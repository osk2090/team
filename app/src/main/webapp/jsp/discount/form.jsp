<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<style>

    .content1 {
        width: 1283px;
        height: 1199px;
        padding: 23px 29px 28px 28px;
        border-radius: 20px;
        background-color: #f8f8f8;
        position: absolute;
        top: 121px;
        left: 319px;
        display: flex;

    }

    .btn-primary {
        height: 39px;
        margin: 0 0 20px 159px;
        padding: 7px 29px 11px 33px;
        border-radius: 10px;
        background-color: #4d90eb;
        position: absolute;
        left: 933px;

    }

    .title {
        margin: 1px 54px 26px 0;
        font-family: AppleSDGothicNeoB00;
        font-size: 24px;
        font-weight: normal;
        font-stretch: normal;
        font-style: normal;
        line-height: 1.33;
        letter-spacing: normal;
        text-align: left;
        color: #20273b;
        position: absolute;
        left: 28px;
        top: 24px;
    }

    #title {
        width: 1226px;
        height: 59px;
        margin: 20px 0 30px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 82px;
    }

    #photo1 {
        width: 1226px;
        height: 50px;
        margin: 20px 0 30px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 150px;
    }

    #photo2 {
        width: 1226px;
        height: 50px;
        margin: 20px 0 30px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 200px;
    }

    #photo3 {
        width: 1226px;
        height: 50px;
        margin: 20px 0 30px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 250px;
    }

    .form-control2 {
        width: 1226px;
        height: 59px;
        margin: 20px 0 30px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 155px;
    }

    .form-control3 {
        width: 1226px;
        height: 59px;
        margin: 20px 0 30px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 171px;
    }

    .photo2 {
        width: 214px;
        height: 134px;
        margin: 30px 39px 30px 0;
        padding: 49px 88px 48px 89px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        top: 171px;
        left: 281px;
    }



    #content {
        width: 1226px;
        height: 836px;
        margin: 30px 0 0;
        padding: 12px 12px 12px 12px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        top: 335px;
        left: 28px;
    }



</style>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>???????????? ??????</title>

    <link rel="stylesheet" href="../../css/header_wh.css" type="text/css">

</head>

<header>
    <button type="button" class="logo-box" onclick="location.href='../club/main'"><img  src="../../images/joinjoylogo-bl.png"></button>
    <button type="button" class="hotplace-box" onclick="location.href='../hotplace/list'"><img  src="../../images/hotplace-bl.png"></button>
    <div class="dropdown">
        <button class="dropbtn"><img  src="../../images/community-bl.png"></button>
        <div class="dropdown-content">
            <a href="../board/list?boardtype=1">???????????????</a>
            <a href="../board/list?boardtype=2">???????????????</a>
            <a href="../board/list?boardtype=3">???????????????</a>
            <a href="../club/reportList">???????????????</a>
        </div>
    </div>
    <button type="button" class="discount-box" onclick="location.href='../discount/list'"><img  src="../../images/discount-bl.png"></button>
    <button type="button" class="qna-box" onclick="location.href='../qna/list'"><img  src="../../images/qna-bl.png"></button>
    <button type="button" class="faq-box" onclick="location.href='../faq/list'"><img  src="../../images/faq-bl.png"></button>

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
<div class="content1">
    <div class="title">
        ???????????? ?????????
    </div>
    <form action="add" method="post" enctype="multipart/form-data">
        <button type="submit" class="btn btn-primary">??????</button>
        <div class="form-group">
            <input type="text" id="title" name="title" class="form-control" placeholder="????????? ???????????????.">
        </div>
        <div class="form-group">
            <textarea class="form-control"  id="content" name="content" placeholder="????????? ???????????????."></textarea>
        </div>

        <div class="mb-3">
            <input class="form-control form-control-sm" id="photo1" type="file" multiple>
        </div>
        <div class="mb-3">
            <input class="form-control form-control-sm" id="photo2" type="file">
        </div>
        <div class="mb-3">
            <input class="form-control form-control-sm" id="photo3" type="file">
        </div>


    </form>
</div>
</body>
</html>
