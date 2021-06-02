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
<body>
<h1 class="join">이제 조인하세요</h1>
<style>

    .join {
        width: 316px;
        height: 60px;
        margin: 158px 1413px 40px 191px;
        font-size: 50px;
        font-weight: bold;
        font-stretch: normal;
        font-style: normal;
        line-height: normal;
        letter-spacing: normal;
        text-align: left;
        /*color: #ffffff;*/
    }

    .box1 {
        width: 1283px;
        height: 240px;
        margin: 40px 319px 10px 198px;
        padding: 34px 40px 40px;
        border-radius: 20px;
        background-color: #20273b;
        color: #ffffff;

    }

    .box2 {
        width: 1283px;
        height: 499px;
        margin: 10px 319px 0 318px;
        padding: 40px 0 16px 40px;
        border-radius: 20px;
        background-color: #f8f8f8;
    }

    .radio1 {
        color: #ffffff;
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
        /*font-size: 16px;*/
        /*font-weight: 500;*/
        /*font-stretch: normal;*/
        /*font-style: normal;*/
        /*line-height: 1.5;*/
        /*letter-spacing: normal;*/
        /*color: rgba(0, 0, 0, 0.3);*/
    }

</style>
<form action="add" method="post" enctype="multipart/form-data">

    <div class="box1">
    <tr class="radio1">
        <td class="form-check">
            <input class="form-check-input" type="radio" name="select" id="selectjoin" OnClick="window.location.href='list';" >
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
    <div  style="text-align: center;">
    도착지: <input type="text" name="arrive" style="color: white">

    가는날: <input id="start" name="startDate" style="color: white">
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
    오는날: <input id="end" name="endDate" style="color: white">
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

    테마: <select name="theme" id="theme" style="color: white">
    <option value="불멍때리기">불멍때리기</option>
    <option value="고기파티">고기파티</option>
    <option value="낚시">낚시</option>
    <option value="일상탈출">일상탈출</option>
    <option value="글램핑">글램핑</option>
    <option value="캠핑">캠핑</option>
    <option value="별보기">별보기</option>
</select>
    인원수(2~10명): <input type="number" name="count" min="2" max="10" style="color: white">
        <button type="submit" class="btn btn-outline-primary">등록</button>
        <button type="button" class="btn btn-outline-danger" OnClick="window.location.href='list';">취소</button>
    </div>
    </div>

    <div style="text-align: center;" class="box2">
    제목: <input type="text" name="title" class="title"><br>
    내용: <textarea name="content" rows="10" cols="60" class="content"></textarea><br>

    사진1: <input type="file" name="photo1"><br>
    사진2: <input type="file" name="photo2"><br>
    사진3: <input type="file" name="photo3"><br>
    </div>

</form>
</body>
</html>