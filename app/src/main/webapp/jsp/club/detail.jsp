<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 상세</title>
</head>
<body>
<h1>클럽 상세보기</h1>


<c:if test="${not empty club}">
    <form action='update' method='post' enctype='multipart/form-data'>
        <table border='1'>
        번호: <input type='text' name='no' value='${club.no}' readonly><br>
        방장: <input type='text' name='writer' value='${club.writer.name}' readonly><br>
        팀원: <br>
        <jsp:include page="/jsp/member/member_list.jsp"/>
            <c:choose>
                <c:when test="${club.writer.no eq login.no}">
                    <%System.out.println("방장은 참여 불가능");%>
                </c:when>
            </c:choose>
            <tr>
                <td colspan='2'>
                    <input type='submit' value='클럽참여'>
                </td>
            </tr>

        <br>
        도착지: <input type='text' name='arrive' value='${club.arrive}' readonly><br>
        가는날: <input type='date' name='startDate' value='${club.startDate}' readonly><br>
        오는날: <input type='date' name='endDate' value='${club.endDate}' readonly><br>
        테마: <select name='theme' id="themeid" value='${club.theme}'>
        <!--지금 상세보기할때 선택했던 정보가 그대로 안나옴 확인 바람-->
        <option value='불멍때리기'>불멍때리기</option>
        <option value='고기파티'>고기파티</option>
        <option value='낚시'>낚시</option>
        <option value='일상탈출'>일상탈출</option>
        <option value='글램핑'>글램핑</option>
        <option value='캠핑'>캠핑</option>
        <option value='별보기'>별보기</option>
    </select>
        <br>
        제목: <input type='text' name='title' value='${club.title}'><br>
        내용: <textarea name='content' rows='10' cols='60'>${club.content}</textarea><br>
        인원수(최대 10명): <input type='number' name='count' value='${club.total}'><br>
            <tr><th>사진</th>
            <c:if test="${not empty club.photos}">
                <%System.out.println("11");%>
                <c:forEach items="${club.photos}" var="p" >
                    <%System.out.println("22");%>
                    <c:set var="photo254x178Url">../upload/${c.name}_254x178.jpg</c:set>
                    <%System.out.println("33");%>
                    <td><img src='${photo254x178Url}'><br>
                        <%System.out.println("44");%>
                        <input name='photo' type='file'></td>
                </c:forEach>
            </c:if>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan='2'>
                <input type='submit' value='변경'> <a href='delete?no=${club.no}'>삭제</a>
            </td>
        </tr>
        </tfoot>
        </table>
    </form>
    </c:if>
    <c:if test="${empty club}">
        <p>해당 번호의 클럽이 없습니다.</p>
    </c:if>
    <p><a href='list'>목록</a></p>
</form>
</body>
</html>