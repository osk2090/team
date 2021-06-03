<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/header_bl2.css" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
</head>

<header>
<button type="button" class="logo-box" onclick="location.href='../club/main'"><img  src="../../images/joinjoylogo-wh.png"></button>
<button type="button" class="hotplace-box" onclick="location.href='../hotplace/list'"><img  src="../../images/hotplace-wh.png"></button>
<div class="dropdown">
    <button class="dropbtn"><img  src="../../images/community-wh.png"></button>
    <div class="dropdown-content">
        <a href="../board/list?boardtype=1">꿀팁게시판</a>
        <a href="../board/list?boardtype=2">자유게시판</a>
        <a href="../board/list?boardtype=3">세컨핸즈샵</a>
        <a href="../club/reportList">신고게시판</a>
    </div>
</div>
<button type="button" class="discount-box" onclick="location.href='../discount/list'"><img  src="../../images/discount-wh.png"></button>
<button type="button" class="qna-box" onclick="location.href='../qna/list'"><img  src="../../images/qna-wh.png"></button>
<button type="button" class="faq-box" onclick="location.href='../faq/list'"><img  src="../../images/faq-wh.png"></button>

<c:choose>
    <c:when test="${empty loginUser}">
        <button type="button" class="btn-outline-primary" onclick="location.href='../member/addd'">Sign up</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../login'">Login</button>
    </c:when>
    <c:otherwise>
        <button type="button" class="btn-outline-primary" onclick="location.href='../member/detail'">My page</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../logout'">Logout</button>
    </c:otherwise>
</c:choose>
</header>

<style>
    .bttmBox {
        width: 1283px;
        height: 685px;
        padding: 25px 20px 15px 40px;
        border-radius: 20px;
        background-color: #ffffff;
    }
</style>
<body>

<div style="background-color: #20273b;
   position:absolute;
   width: 66.82%;
   height: 22.22%;
   left: 16.61%;
   top: 11%;
   border-radius: 20px;">
    <div class="form-check" style="position: absolute; left: 3.12%; top: 16.67%;">
        <input class="form-check-input" type="radio" name="select" id="selectjoin" OnClick="window.location.href='list';" checked>
        <label class="form-check-label" for="selectjoin" style="color: #fff;">
            참여
        </label>
    </div>
    <div class="form-check" style="position: absolute; left: 11.85%; top: 16.67%;">
        <input class="form-check-input" type="radio" name="select" id="selectadd" OnClick="window.location.href='add';">
        <label class="form-check-label" for="selectadd" style="color: #fff;">
            생성
        </label>
    </div>

    <form action='list' method='get'>
        <fieldset style= "position: absolute; width: 90%; top: 40%; left: 3.35%; color:#fff;">
            <table>
                <thead style="font-size: 0.75em; background-color: #20273b;">
                <tr>
                    <th>도착지</th><th>가는날</th><th>오는날</th><th>테마</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type='search' name='arrive' value='${param.arrive}' style="border: none; width: 254px; height: 54px; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-color: #fff;"></td>
                    <td><input type='date' name='startDate' value='${param.startDate}' style="border: none; width: 254px; height: 54px; border-color: #fff;"></td>
                    <td><input type='date' name='endDate' value='${param.endDate}' style="border: none; width: 254px; height: 54px; border-color: #fff;"></td>
                    <td><select name="theme" id="theme" style="border: none; width: 254px; height: 54px; border-bottom-right-radius: 10px; border-top-right-radius: 10px; border-color: #fff;">
                        <option value=''></option>
                        <option value='불멍때리기'>불멍때리기</option>
                        <option value='고기파티'>고기파티</option>
                        <option value='낚시'>낚시</option>
                        <option value='일상탈출'>일상탈출</option>
                        <option value='글램핑'>글램핑</option>
                        <option value='캠핑'>캠핑</option>
                        <option value='별보기'>별보기</option>
                    </td>
                    <td></td>
                    <td>
                        <button style="left: 20%; width: 163px; height: 54px; border-radius: 10px; background-color: #4d90eb; color: #fff; border: 0;">Search</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </form>
</div>

    <div test="${not empty club}">

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

        <form action='update' method='post' style=" width: 1283px;
        height: 685px;
           position:absolute;
        padding: 25px 20px 15px 40px;
        border-radius: 20px;
        left: 16.61%;
        top: 35%;
        background-color: #ff0000;">
<%--            번호: --%>
            <input type='text' name='no' value='${club.no}' hidden><br>
            <!--로그인된 사람만 수정할수 있고 아닌사람은 readonly되게-->
            <c:if test="${loginUser.no == club.writer.no}">
                제목: <input type='text' name='title' value='${club.title}'><br>
                내용: <textarea name='content' rows='10' cols='60'>${club.content}</textarea><br>
            </c:if>

            <c:if test="${loginUser.no != club.writer.no}">
                제목:<input class="form-control" name='title' value='${club.title}'  type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled>
                내용:<input class="form-control" name='content' value='${club.content}' type="text" placeholder="Disabled input" aria-label="Disabled input example" disabled>
            </c:if>

        방장:
            <div>
                <c:if test="${not empty club.writer.photo}">
                    <c:set var="photoUrl">../../upload/${cm.photo}_30x30.jpg</c:set>
                </c:if>
                <c:if test="${empty club.writer.photo}">
                    <c:set var="photoUrl">../../images/person_30x30.jpg</c:set>
                </c:if>
                    ${club.writer.name}

                <img src='${photoUrl}' class="circle">
            </div>

            팀원:<br>
            <jsp:include page="/jsp/club/member_list.jsp"/>
            도착지: <input type='text' name='arrive' value='${club.arrive}' readonly><br>
            가는날: <input type='date' name='startDate' value='${club.startDate}' readonly><br>
            오는날: <input type='date' name='endDate' value='${club.endDate}' readonly><br>
            테마: <input name='theme' id="themeid" value='${club.theme}' readonly><br>

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

            <td colspan='2'>
                <input type='submit' value='변경'>
                <a href='delete?no=${club.no}'>삭제</a>
            </td>
            </c:if>
            <button type="button" class="btn btn-outline-danger" OnClick="window.location.href='main';">메인</button>
        </form>
    </div>
</body>
</html>


<%--<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">--%>
<%--    <div class="carousel-inner">--%>
<%--        <div class="carousel-item active">--%>
<%--            <img class="d-block w-100" src="..." alt="First slide">--%>
<%--        </div>--%>
<%--        <div class="carousel-item">--%>
<%--            <img class="d-block w-100" src="..." alt="Second slide">--%>
<%--        </div>--%>
<%--        <div class="carousel-item">--%>
<%--            <img class="d-block w-100" src="..." alt="Third slide">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">--%>
<%--        <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
<%--        <span class="sr-only">Previous</span>--%>
<%--    </a>--%>
<%--    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">--%>
<%--        <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
<%--        <span class="sr-only">Next</span>--%>
<%--    </a>--%>
<%--</div>--%>