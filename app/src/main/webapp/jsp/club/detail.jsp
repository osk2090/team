<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
<%--    <jsp:include page="/jsp/club/css/blackheader.jsp"/>--%>
<%--    <jsp:include page="/jsp/club/css/dropbox.jsp"/>--%>
    <jsp:include page="/jsp/club/css/detailbox.css"/>
</style>
<head>
    <title>클럽 상세</title>
</head>
<body style="text-align: center;">
<h1></h1>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<style>

    .searchBox {
        width: 1283px;
        height: 240px;
        padding: 34px 40px 40px;
        border-radius: 20px;
        background-color: #20273b;
    }

    .bttmBox {
        width: 1283px;
        height: 685px;
        padding: 25px 20px 15px 40px;
        border-radius: 20px;
        background-color: #f8f8f8;
    }


</style>
<div class="searchBox">
<tr class="radio1">
    <td class="form-check">
        <input class="form-check-input" type="radio" name="select" id="selectjoin" OnClick="window.location.href='main';" >
        <label class="form-check-label" for="selectjoin">
            참여
        </label>
    </td>
    <td class="form-check">
        <input class="form-check-input" type="radio" name="select" id="selectadd" OnClick="window.location.href='add';" checked>
        <label class="form-check-label" for="selectadd">
            생성
        </label>
    </td>
</tr>
</div>

<c:if test="${not empty club}">

    <!--클럽참여 관련-->
        <c:set var="exist" value="${false}"/>
        <c:if test="${club.total != club.nowTotal}">
            <c:forEach items="${clubMembers}" var="cm">
                <c:if test="${loginUser.no == cm.no}">
                    <button type="button" class="btn btn-secondary btn-lg" disabled>클럽 참여중</button>
                    <c:set var="exist" value="${true}"/>
                </c:if>
            </c:forEach>
        </c:if>

        <c:if test="${club.total == club.nowTotal and loginUser.no == club.writer.no}">
            <button type="button" class="btn btn-secondary btn-lg" disabled>클럽 참여불가</button>
        </c:if>

        <c:if test="${!exist and not empty loginUser and loginUser.no != club.writer.no and club.total > club.nowTotal}">
            <form action="join" method="post">
                <input type="text" name="no" value="${club.no}" hidden>
                <input type="text" name="loginUser" value="${loginUser.no}" hidden>
                    <input class="btn btn-primary" type="submit" value="클럽 참여">
            </form>
        </c:if>

    <!--클럽신고 관련-->
    <c:set var="existreports" value="${false}"/>
    <c:forEach items="${reports}" var="rs">
            <c:if test="${rs.no == club.no}">
                <span class="badge bg-danger">신고된 글</span>
                <c:set var="existreports" value="${true}"/>
            </c:if>
    </c:forEach>

    <c:forEach items="${clubMembers}" var="cm">
        <c:if test="${not empty loginUser and !existreports and loginUser.no != club.writer.no and loginUser.no == cm.no}">
            <form action="report1" method="post">
                <input type="text" name="no" value="${club.no}" hidden>
                <input type="text" name="clubWriterNo" value="${club.writer.no}" hidden>
                <button type="submit" class="btn btn-danger">클럽 신고</button>
            </form>
        </c:if>
    </c:forEach>

            <table border='1'>
    번호: <input type='text' name='no' value='${club.no}' readonly><br>
    방장:
<%--    <div>--%>
<%--        <c:if test="${not empty club.writer.photo}">--%>
<%--            <c:set var="photoUrl">../../upload/${cm.photo}_30x30.jpg</c:set>--%>
<%--        </c:if>--%>
<%--        <c:if test="${empty club.writer.photo}">--%>
<%--            <c:set var="photoUrl">../../images/person_30x30.jpg</c:set>--%>
<%--        </c:if>--%>
<%--            ${club.writer.name}--%>
<%--            ${club.writer.tel}--%>

<%--        <img src='${photoUrl}' class="circle">--%>
<%--    </div>--%>

    팀원:<br>
    <jsp:include page="/jsp/club/member_list.jsp"/>
    <form action='update' method='post'>
            도착지: <input type='text' name='arrive' value='${club.arrive}' readonly><br>
            가는날: <input type='date' name='startDate' value='${club.startDate}' readonly><br>
            오는날: <input type='date' name='endDate' value='${club.endDate}' readonly><br>
            테마: <input name='theme' id="themeid" value='${club.theme}' readonly><br>

            <!--로그인된 사람만 수정할수 있고 아닌사람은 readonly되게-->
            <c:if test="${loginUser.no == club.writer.no}">
            제목: <input type='text' name='title' value='${club.title}'><br>
            내용: <textarea name='content' rows='10' cols='60'>${club.content}</textarea><br>
            </c:if>

            <c:if test="${loginUser.no != club.writer.no}">
            제목: <input type='text' name='title' value='${club.title}' readonly><br>
            내용: <textarea name='content' rows='10' cols='60' readonly>${club.content}</textarea><br>
            </c:if>

            인원수 / 현재인원수: ${club.total} / ${club.nowTotal} <br>
            <th>사진</th>
            <c:if test="${not empty club.photos}">
            <%System.out.println("11");%>
            <c:forEach items="${club.photos}" var="p">
            <%System.out.println("22");%>
            <c:set var="photo254x178Url">../../upload/${p.name}_254x178.jpg</c:set>
            <%System.out.println("33");%>
            <td><img src='${photo254x178Url}'><br>
                        <%System.out.println("44");%>
                </c:forEach>
                </c:if>

                <c:if test="${not empty loginUser and loginUser.no == club.writer.no or loginUser.power == 1 }">

                <tfoot>
                <tr>
                    <td colspan='2'>
                        <input type='submit' value='변경'>
                        <a href='delete?no=${club.no}'>삭제</a>
                    </td>
                </tr>
                </tfoot>
                </c:if>
        </table>
    </form>
</c:if>
<button type="button" class="btn btn-outline-danger" OnClick="window.location.href='main';">메인</button>
</body>
</html>