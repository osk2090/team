<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<title>회원리스트</title>
<style>
    #ap{
      width:500px;
      margin-left:auto;
      margin-right:auto;
      text-align:center;
      height: 100px;
      top: 100px;
      position: relative;
    }
body{
  background-color: #fff;
}
        
header{
  background-color: #20273b;
  position: fixed;
  width: 100%;
  height: 80px;
  margin: 0 0 149px;
  padding: 16px 100px 15px 83px;
  z-index: 200;
}
.dropbtn {
  background-color: #20273b;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}
.dropdown {
  position: relative;
  top: -10%;
  left:54%;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #20273b;
  min-width: 115px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border-radius: 10px;
}
.dropdown-content a {
  color: #a3a3a3;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #fff;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn {background-color: #20273b;}
button.btn.btn-primary.btn-sm {
    position: absolute;
    top: 25%;
    right: 5.2%;
}
.btn-primary {
    width: 80px;
    height: 40px;
    padding: 8px 15px 11px;
    border-radius: 10px;
    background-color:#4d90eb;
    border-color:#4d90eb;
}
.logo-box {
    position: absolute;
    top:25%;
    left: 5.2%;
    background-color: #20273b;
    border: none;
}
.hotplace-box {
    position: absolute;
    top:32.8%;
    left: 46%;
    background-color: #20273b;
    border: none;
}
.discount-box {
    position: absolute;
    top:32.8%;
    left: 61.3%;
    background-color: #20273b;
    border: none;
}
.qna-box {
    position: absolute;
    top:32.8%;
    left: 68.6%;
    background-color: #20273b;
    border: none;
}
.faq-box {
    position: absolute;
    top:32.8%;
    left: 75.9%;
    background-color: #20273b;
    border: none;
}
</style>
</head>
<header>
        <button type="button" class="logo-box" onclick="location.href='../club/list'"><img  src="../../images/joinjoylogo-bl.png"></button>
        <button type="button" class="hotplace-box" onclick="location.href='../hotplace/list'"><img  src="../../images/hotplace-bl.png"></button>
        <div class="dropdown">
            <button class="dropbtn"><img  src="../../images/community-bl.png"></button>
          <div class="dropdown-content">
            <a href="../board/list?boardtype=1">꿀팁게시판</a>
            <a href="../board/list?boardtype=2">자유게시판</a>
             <a href="../board/list?boardtype=3">세컨핸즈샵</a>
             <a href="../club/reportList">신고게시판</a>
          </div>
         </div>
         <button type="button" class="discount-box" onclick="location.href='../discount/list'"><img  src="../../images/discount-bl.png"></button>
         <button type="button" class="qna-box" onclick="location.href='../qna/list'"><img  src="../../images/qna-bl.png"></button>
        <button type="button" class="faq-box" onclick="location.href='../faq/list'"><img  src="../../images/faq-bl.png"></button>
         
      <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../app/logout'">logout</button>
</header>
<body>
<br>
<div id="ap">
<h3>회원 리스트</h3>
<h4>관리자님 환영합니다.</h4>
<!-- <p><a href='add'>새 회원</a></p> -->
<!-- <p><a href='add'>회원가입</a></p> -->
<table border='1'>
  <thead>
  <tr>
    <th>번호</th> <th>이름</th> <th>이메일</th>
    <th>생년월일</th> <th>전화번호</th><th>성별</th>
    <th>사진</th>
  </tr>
  </thead>
  <tbody>

  <c:forEach items="${list}" var="m">
    <c:if test="${not empty m.photo}">
      <c:set var="photoUrl">../../upload/${m.photo}_30x30.jpg</c:set>
    </c:if>
    <c:if test="${empty m.photo}">
      <c:set var="photoUrl">../../images/person_30x30.jpg</c:set>
    </c:if>
    <tr>
      <td>${m.no}</td>
      <td><a href='detail?no=${m.no}'>${m.name}</a></td>
      <td>${m.email}</td>
      <td>${m.birth}</td>
      <td>${m.tel}</td>
      <td><c:set var="gender" value="0" />
        <c:if test="${m.gender eq '0'}">
          <a>남자</a>
        </c:if>
        <c:if test="${m.gender eq '1'}">
          <a>여자</a>
        </c:if></td>
      <td><img src='${photoUrl}'></td>
    </tr>
  </c:forEach>

  </tbody>
</table>

<form action='list' method='get'>
  <input type='search' name='keyword' value='${param.keyword}'>
  <button>검색</button>
</form>
</div>
</body>
</html>