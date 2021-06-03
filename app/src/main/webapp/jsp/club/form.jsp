<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JoinJoy</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../css/header_bl.css" type="text/css">
    <style>
        body{
            background-image: url("../../images/airplane-2619434.jpg");
            background-size: 100%;
            background-position: 50% 23%;
            background-repeat: no-repeat;
            z-index:-1;
        }
    </style>
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

<body>
<div style="position: absolute; left:16.6%; top:17%; font-size:50px; color: #fff; font-weight: bold;">이제 조인하세요</div>
<style>

    #photo1 {
        width: 3%;
        height: 50px;
        margin: 20px 0 30px 31%;
        padding: 11px 827px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: -23.5%;
        top: 30%;
    }

    #photo2 {
        width: 3%;
        height: 50px;
        margin: 20px 0 30px 31%;
        padding: 11px 827px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: -23.5%;
        top: 45%;
    }

    #photo3 {
        width: 3%;
        height: 50px;
        margin: 20px 0 30px 31%;
        padding: 11px 827px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: -23.5%;
        top: 60%;
    }

    .box2 {
        width: 1000px;
        height: 499px;
        margin: auto;
        padding: 50px 0 16px 75px;
        border-radius: 20px;
        background-color: #f8f8f8;
    }

</style>

<div style="background-color: #20273b;
   position:absolute;
   width: 66.82%;
   height: 22.22%;
   left: 16.61%;
   top: 30.09%;
   border-radius: 20px;">
    <div class="form-check" style="position: absolute; left: 3.12%; top: 16.67%;">
        <input class="form-check-input" type="radio" name="select" id="selectjoin" OnClick="window.location.href='main';">
        <label class="form-check-label" for="selectjoin" style="color: #fff;">
            참여
        </label>
    </div>
    <div class="form-check" style="position: absolute; left: 11.85%; top: 16.67%;">
        <input class="form-check-input" type="radio" name="select" id="selectadd" OnClick="window.location.href='add';" checked>
        <label class="form-check-label" for="selectadd" style="color: #fff;">
            생성
        </label>
    </div>

    <form action="add" method="post" enctype="multipart/form-data">
        <fieldset style= "position: absolute; width: 90%; top: 40%; left: 3.35%; color:#fff;">
            <table>
                <thead style="font-size: 0.75em;">
                <tr>
                    <th>도착지</th><th>가는날</th><th>오는날</th><th>테마</th><th>인원수(2~10명)</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td><input type='search' name='arrive' value='${param.arrive}' style="border: none; width: 201px; height: 54px; border-top-left-radius: 10px; border-bottom-left-radius: 10px; border-color: #fff;"></td>
                    <td><input id="start" name='startDate' value='${param.startDate}' style="border: none; width: 201px; height: 54px; border-color: #fff;"></td>
                    <script>
        $(function () {
            $("#start").datepicker({
                currentText: '오늘 날짜',
                showAnim: "slide",
                dateFormat: "yy-mm-dd",
                minDate: 0
            });
        });
                  </script>
                    <td><input id="end" name='endDate' value='${param.endDate}' style="border: none; width: 201px; height: 54px; border-color: #fff;"></td>

                    <script>
        $(function () {
            $("#end").datepicker({
                currentText: '오늘 날짜',
                showAnim: "slide",
                dateFormat: "yy-mm-dd",
                minDate: 0
            });
        });
    </script>
                    <td><select name="theme" id="theme" style="border: none; width: 201px; height: 54px; border-color: #fff;">
                        <option value='불멍때리기'>불멍때리기</option>
                        <option value='고기파티'>고기파티</option>
                        <option value='낚시'>낚시</option>
                        <option value='일상탈출'>일상탈출</option>
                        <option value='글램핑'>글램핑</option>
                        <option value='캠핑'>캠핑</option>
                        <option value='별보기'>별보기</option>
                    </select>
                    </td>
                    <td>
                    <input type="number" name="count" min="2" max="10" style="border: none; width: 201px; height: 54px; border-bottom-right-radius: 10px; border-top-right-radius: 10px; border-color: #fff;">
                    </td>
                    <td></td>
                    <td>
                        <button type="submit" style="left: 20%; width: 81px; height: 54px; border-radius: 10px; background-color: #4d90eb; color: #fff; border: 0;">등록</button>
                    </td>
                    <td>
                        <button type="button" OnClick="window.location.href='main';" style="left: 20%; width: 81px; height: 54px; border-radius: 10px; background-color: #ffffff; color: #ff0000; border: 0;">취소</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>

        <div style="position:absolute;
        width: 1000px;
        height: 400px;
        padding: 50px 0 16px 75px;
        background-color: #f8f8f8;
        left: 11.5%;
        top: 106%;
        border-radius: 20px;">
            <div class=" col-lg-11" style="text-align: center;">
                <input name="title" class="form-control input-lg" type="text" placeholder="제목1">
            </div>
            <div class=" col-lg-11" style="text-align: center;">
                <input name="content" class="form-control input-sm" type="text" placeholder="내용">
            </div>

            <div>
                <input style="text-align: center;" class="form-control form-control-sm" id="photo1" type="file" name="photo1" multiple>
            </div>

            <div>
                <input style="text-align: center;" class="form-control form-control-sm" id="photo2" type="file" name="photo2" multiple>
            </div>

            <div>
                <input style="text-align: center;" class="form-control form-control-sm" id="photo3" type="file" name="photo3" multiple>
            </div>
        </div>
    </form>
</div>
</body>
</html>