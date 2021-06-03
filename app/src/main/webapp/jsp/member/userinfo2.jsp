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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link href="css/common.css" rel="stylesheet" >
<style>

#rap{
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
        <button type="button" class="logo-box" onclick="location.href='../app/club/list'"><img  src="../images/joinjoylogo-bl.png"></button>
        <button type="button" class="hotplace-box" onclick="location.href='../app/hotplace/list'"><img  src="../images/hotplace-bl.png"></button>
        <div class="dropdown">
            <button class="dropbtn"><img  src="../images/community-bl.png"></button>
          <div class="dropdown-content">
            <a href="../board/list?boardtype=1">꿀팁게시판</a>
            <a href="../board/list?boardtype=2">자유게시판</a>
             <a href="../board/list?boardtype=3">세컨핸즈샵</a>
             <a href="../club/reportList">신고게시판</a>
          </div>
         </div>
         <button type="button" class="discount-box" onclick="location.href='../discount/list'"><img  src="../images/discount-bl.png"></button>
         <button type="button" class="qna-box" onclick="location.href='../qna/list'"><img  src="../images/qna-bl.png"></button>
        <button type="button" class="faq-box" onclick="location.href='../faq/list'"><img  src="../images/faq-bl.png"></button>
         
      <button type="button" class="btn btn-primary btn-sm">logout</button>
</header>
<body>

<%-- <c:if test="${empty loginUser}">
  <p>로그인 하지 않았습니다.</p>
</c:if>

<c:if test="${not empty loginUser}">
  <c:if test="${not empty loginUser.photo}">
    <c:set var="photo80x80Url">../upload/${loginUser.photo}_80x80.jpg</c:set>
    <c:set var="photoUrl">../upload/${loginUser.photo}</c:set>
  </c:if>
  <c:if test="${empty loginUser.photo}">
    <c:set var="photo80x80Url">../images/person_80x80.jpg</c:set>
    <c:set var="photoUrl"></c:set>
  </c:if>
  <table border='1'>
  <tbody>
  <tr>
    <th>사용자 번호</th> 
    <td>${loginUser.no}</td></tr>
  <tr>
    <th>이름</th> 
    <td>${loginUser.name}</td></tr>
  <tr>
    <th>이메일</th> 
    <td>${loginUser.email}</td></tr>
  <tr>
    <th>사진</th> 
    <td><a href='${photoUrl}'>
    <img src='${photo80x80Url}'></a></td></tr>
  </tbody>
  </table>
</c:if>
</body>
</html> --%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<div id="rap">
<div class="container">

   <h1>마이페이지</h1>
 <c:if test="${empty loginUser}">
    <p>로그인 하지 않았습니다.</p>
  </c:if>
    <c:if test="${not empty loginUser.photo}">
      <c:set var="photo80x80Url">upload/${loginUser.photo}_80x80.jpg</c:set>
      <c:set var="photoUrl">upload/${loginUser.photo}</c:set>
    </c:if>
    <c:if test="${empty loginUser.photo}">
      <c:set var="photo80x80Url">images/person_80x80.jpg</c:set>
      <c:set var="photoUrl"></c:set>
    </c:if>
  <form action='member/update' method='post' enctype='multipart/form-data'>
      <table border='1'>
            <tbody>
    <div class="mb-3 row">
      <label for="name" class="col-sm-2 col-form-label">이름</label>
      <div class="col-sm-10">
        <input type="text" class="form-control-plaintext form-control-sm" id="name" value='${loginUser.name}' readonly>
      </div>
    </div>
    <div class="mb-3 row">
      <label for="email" class="col-sm-2 col-form-label">이메일</label>
      <div class="col-sm-10">
        <input type="text" class="form-control-plaintext form-control-sm" id="email" value='${loginUser.email}' readonly>
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
      <div class="col-sm-10">
        <input type="password" class="form-control-plaintext form-control-sm" id="password" value='${loginUser.password}' maxlength="12">
      </div>
    </div>
    
    <div class="mb-3 row">
      <label for="birth" class="col-sm-2 col-form-label">생년월일</label>
      <div class="col-sm-10">
        <input type="text" class="form-control-plaintext form-control-sm" id="birth" value='${loginUser.birth}' readonly>
      </div>
    </div>
        <div class="mb-3 row">
      <label for="tel" class="col-sm-2 col-form-label">전화번호</label>
      <div class="col-sm-10">
        <input type="text" class="form-control-plaintext form-control-sm" id="tel" value='${loginUser.tel}' maxlength="11">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="photo" class="col-sm-2 col-form-label">사진</label>
      <div class="col-sm-10">
        <a href='${photoUrl}'>
          <img src="${photo80x80Url}" class="img-thumbnail" alt="사용자 사진">
        </a>
      </div>
            </tbody>
                  <tfoot>
      <tr><td colspan='2'>
          <input type='submit' class="btn btn-primary" value='수정'> 
          <input type="button" value="탈퇴" class="btn btn-primary" onclick="location.href='delete?no=${member.no}'"/>
          </tfoot>
    </table>
  </form>
</div>
</div>

</body>
</html> 