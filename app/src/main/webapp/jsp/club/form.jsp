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
</head>
<body class="body">
<h1 class="join">이제 조인하세요</h1>
<style>

    .body{
        background-image: url("../../images/airplane-2619434.jpg");
        background-size: 100%;
        background-position: 50% 30%;
        background-repeat: no-repeat;
    }

    .join {
        width: 316px;
        height: 60px;
        margin: 158px 1413px 40px 190px;
        font-size: 42px;
        font-weight: bold;
        font-stretch: normal;
        font-style: normal;
        line-height: normal;
        letter-spacing: normal;
        text-align: left;
        color: #ffffff;
    }

    #photo1 {
        width: 10%;
        height: 50px;
        margin: 20px 0 30px 380px;
        padding: 11px 979px 16px 19px;
        border-radius: 10px;
        border: solid 1px #d3d3d3;
        background-color: #f4f4f4;
        position: absolute;
        left: 28px;
        top: 680px;
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
        top: 740px;
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
        top: 800px;
    }

    .box1 {
        width: 1283px;
        height: 240px;
        margin: auto;
        padding: 34px 40px 40px;
        border-radius: 20px;
        background-color: #20273b;
        color: #ffffff;
    }

    .box2 {
        width: 1000px;
        height: 499px;
        margin: auto;
        padding: 50px 0 16px 75px;
        border-radius: 20px;
        background-color: #f8f8f8;
    }

    .radio1 {
        color: #ffffff;
        margin: 100px;
    }

    .title {
        width: 155px;
        height: 29px;
        margin: 0 369px 4px 0;
        font-size: 24px;
        font-weight: bold;
        font-stretch: normal;
        font-style: normal;
        line-height: normal;
        letter-spacing: normal;
        text-align: left;
        color: rgba(0, 0, 0, 0.3);
    }

    .content {
        width: 28px;
        height: 19px;
        margin: 4px 496px 36px 0;
        font-size: 16px;
        font-weight: 500;
        font-stretch: normal;
        font-style: normal;
        line-height: 1.5;
        letter-spacing: normal;
        text-align: left;
        color: rgba(0, 0, 0, 0.3);
    }

</style>
<form action="add" method="post" enctype="multipart/form-data">

    <div class="box1">
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
        <br>
        <br>
        <br>
    <div style="text-align: center;">

    도착지: <input type="text" name="arrive">

    가는날: <input id="start" name="startDate">
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
    오는날: <input id="end" name="endDate">
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

    테마: <select name="theme" id="theme">
    <option value="불멍때리기">불멍때리기</option>
    <option value="고기파티">고기파티</option>
    <option value="낚시">낚시</option>
    <option value="일상탈출">일상탈출</option>
    <option value="글램핑">글램핑</option>
    <option value="캠핑">캠핑</option>
    <option value="별보기">별보기</option>
</select>
    인원수(2~10명): <input type="number" name="count" min="2" max="10">
        <button type="submit" class="btn btn-outline-primary">등록</button>
        <button type="button" class="btn btn-outline-danger" OnClick="window.location.href='main';">취소</button>
    </div>
    </div>
<br>
        <div class="box2">
            <div class=" col-lg-11" style="text-align: center;">
                <input name="title" class="form-control input-lg" type="text" placeholder="제목">
            </div>
<br>
            <div class=" col-lg-11" style="text-align: center;">
                <input name="content" class="form-control input-sm" type="text" placeholder="내용">
            </div>

            <div class="mb-11">
                <input class="form-control form-control-sm" id="photo1" type="file" name="photo1" multiple>
            </div>
            <div class="mb-11">
                <input class="form-control form-control-sm" id="photo2" type="file" name="photo2" multiple>
            </div>
            <div class="mb-3">
                <input class="form-control form-control-sm" id="photo3" type="file" name="photo3" multiple>
            </div>
        </div>
</form>
</body>
</html>