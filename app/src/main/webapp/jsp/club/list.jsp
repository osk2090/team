<%@ page import="com.osk.team.domain.Club" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: osk2090
  Date: 2021/05/17
  Time: 11:17 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Club List</title>
</head>
<body>
<h1>Club List</h1>
<p><a href='detailSearch'>참여</a></p><p><a href='club.html'>생성</a></p>

<table border='1'>
    <thead>
    <tr>
        <th>번호</th> <th>도착지</th> <th>가는날</th> <th>오는날</th> <th>테마</th> <th>인원수</th>
    </tr>
    </thead>
    <tbody>
    <jsp:useBean id="clubs" type="List<Club>" scope="request"/>
    <%
        for (Club c : clubs) {
            pageContext.setAttribute("c", c);
    %>
    <tr>
        <td><a href='detail?no=${c.no}'></a></td>
        <td>${c.arrive}</td>
        <td>${c.startDate}</td>
        <td>${c.endDate}</td>
        <td>${c.theme}</td>
        <td>${c.total}</td>
    </tr>
<%
    }
%>
</tbody>
</table>

<form action='search' method='get'>
    <input type='text' name='keyword'>
    <button>검색</button>

    <form method='get'>
        <fieldset>
            <legend>클럽 상세 검색</legend>
            <table border='1'>
                <tbody>
                <tr> <th>도착지</th> <td><input type='search' name='arrive' value='${c.arrive}'></td> </tr>
                <tr> <th>가는날</th> <td><input type='date' name='startDate' value='${c.startDate}'></td> </tr>
                <tr> <th>오는날</th> <td><input type='date' name='endDate' value='${c.endDate}'></td> </tr>
                <tr> <th>테마</th> <td><input type='search' name='theme' value='${c.theme}'></td> </tr>
                <tr> <td colspan='2'><button>검색</button></td> </tr>
                </tbody>
            </table>
        </fieldset>
    </form>

</form>
</body>
</html>
