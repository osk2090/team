<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="com.osk.team.domain.Member" %>
<%@ page import="com.osk.team.domain.Club" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 상세</title>
</head>
<body>
<h1>클럽 상세보기</h1>

<%--<%! HttpServletRequest request;%>--%>
<%--<%! Member loginUser = (Member) request.getSession().getAttribute("loginUser");%>--%>
<%--<%! Club club = new Club();%>--%>
<%--<% if (loginUser == null){%>--%>
<%--<p>로그인 후 이용 가능합니다!</p>--%>
<%--<%} else if (loginUser.getNo() == club.getWriter().getNo()) {%>--%>
<%--<p>방장은 입장할 수 없습니다!</p>--%>
<%--<%} else {%>--%>
<%--<p><%loginUser.getName();%> 님 환영합니다.</p>--%>
<input type="button" id="clubjoin" value="클럽 참여"/>

<c:if test="${not empty club}">
    <form action='update' method='post' enctype='multipart/form-data'>
        <table border='1'>
            <tbody>
            <tr>
                <th>번호</th>
                <td><input type='text' name='no' value='${club.no}' readonly></td>
            </tr>
            <tr>
                <th>방장</th>
                <td>${club.writer.name}</td>
            </tr>
            <tr>
                <th>팀원</th>
<%--                    <jsp:include page="/jsp/club/member_list.jsp"/>--%>
                <c:forEach items="${member}" var="m" >
                <c:forEach items="${clubMembers}" var="clubMember">
                <c:if test="${m.no == clubMember.no}">
                    <c:set var="checked" value="checked"/>
                </c:if>
                </c:forEach>
<%--                <input type='checkbox' name='member' value='${m.no}' ${checked}>${m.name}<br>--%>
<%--                    <c:remove var="checked"/>--%>
                </c:forEach>
            <tr>
                <th>도착지</th>
                <td>${club.arrive}</td>
            </tr>
            <tr>
                <th>가는날</th>
                <td>${club.startDate}</td>
            </tr>
            <tr>
                <th>오는날</th>
                <td>${club.endDate}</td>
            </tr>
            <tr>
                <th>테마</th>
                <td>${club.theme}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input name='title' type='tel' value='${club.title}'></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name='content' rows='10' cols='60'>${club.content}</textarea></td>
            </tr>
            <tr>
                <th>인원수</th>
                <td>${club.total}</td>
            </tr>
            <tr>
                <th>사진</th>
                <c:if test="${not empty club.photos}">
                    <%System.out.println("11");%>
                    <c:forEach items="${club.photos}" var="p">
                        <%System.out.println("22");%>
                        <c:set var="photo254x178Url">../upload/${p.name}_254x178.jpg</c:set>
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
                    <input type='submit' value='변경'> <a href='delete?no=${member.no}'>삭제</a>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</c:if>

<p><a href='list'>목록</a></p>
</body>
</html>