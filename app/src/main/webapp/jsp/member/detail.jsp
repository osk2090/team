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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<title>회원리스트</title>
<style>
#wra{
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
         
      <button type="button" class="btn btn-primary btn-sm">logout</button>
</header>
<body>
<!--     <div class="container">
      <div class="row">
        <div class="col">
          <h1>Button</h1>
          <button type="button" class="btn btn-primary">Primary</button>
          <button type="button" class="btn btn-secondary">Secondary</button>
          <button type="button" class="btn btn-success">Success</button>
          <button type="button" class="btn btn-danger">Danger</button>
          <button type="button" class="btn btn-warning">Warning</button>
          <button type="button" class="btn btn-info">Info</button>
          <button type="button" class="btn btn-light">Light</button>
          <button type="button" class="btn btn-dark">Dark</button>
          <button type="button" class="btn btn-link">Link</button>
        </div>
      </div>
    </div> -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<div id="wra">
<!-- <h1>&ensp;회원 상세정보</h1> -->

<c:if test="${not empty member}">
  <c:if test="${not empty member.photo}">
    <c:set var="photo80x80Url">../../upload/${member.photo}_80x80.jpg</c:set>
    <c:set var="photoUrl">../../upload/${member.photo}</c:set>
  </c:if>
  <c:if test="${empty member.photo}">
    <c:set var="photo80x80Url">../../images/person_80x80.jpg</c:set>
    <c:set var="photoUrl"></c:set>
  </c:if>

<br><br><br><br><br><br>
  <form action='update' method='post' enctype='multipart/form-data'>
    <table border='1'>
      <tbody>
      <tr>
        <th>번호</th>
        <td><input type='text' name='no' value='${member.no}' readonly></td></tr>
      <tr>
        <th>이름</th>
        <td><input name='name' type='text' value='${member.name}'readonly></td></tr>
      <tr>
        <th>이메일</th>
        <td><input name='email' type='email' value='${member.email}'readonly></td></tr>
      <tr>
        <th>암호</th>
        <td><input name='password' type='password'></td></tr>
      <tr>
        <th>생년월일</th>
        <td>${member.birth}</td></tr>
      <tr>
        <th>전화번호</th>
        <td><input name='tel' type='tel' value='${member.tel}'></td></tr>
        <%--     <tr>
              <th>성별</th>
              <td><input type='no' name='gender' value='${member.gender}'readonly></td></tr> --%>
      <tr>
        <th>사진</th>
        <td><a href='${photoUrl}'>
          <img src='${photo80x80Url}'></a><br>
          <input name='photo' type='file'></td></tr>
        <%--     <tr>
              <th>탈퇴여부</th>
              <td><input type='no' name='status' value='${member.status}'readonly></td></tr>
            <tr>
              <th>관리자권한</th>
              <td><input type='no' name='power' value='${member.power}'readonly></td></tr> --%>
      <tr>
        <th>제제횟수</th>
        <td><input type='no' name='count' value='${member.count}'readonly></td></tr>
      </tbody>
      <tfoot>
      <tr><td colspan='2'>
        <input type='submit' class="btn btn-primary" value='수정'> 
        <input type="button" value="탈퇴" class="btn btn-primary" onclick="location.href='delete?no=${member.no}'"/>
        <input type="button" value="리스트" class="btn btn-primary" onclick="location.href='list'"/>
      </td></tr>
      </tfoot>
    </table>
  </form>
</c:if>

<c:if test="${empty member}">
  <p>해당 번호의 회원이 없습니다.</p>
</c:if>
</div>
</body>
</html>