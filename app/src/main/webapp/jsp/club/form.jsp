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
<h1>이제 조인하세요</h1>
<style>

    div.box1 {
        width: 1283px;
        height: 240px;
        margin: 40px 318px 16px 319px;
        padding: 34px 40px 40px;
        border-radius: 20px;
        background-color: #20273b;
    }

</style>
<form action="add" method="post" enctype="multipart/form-data">

    <div class="box1">
    <tr>
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

    <div style="text-align: center;">
    제목: <input type="text" name="title"><br>
    내용: <textarea name="content" rows="10" cols="60"></textarea><br>

    사진1: <input type="file" name="photo1"><br>
    사진2: <input type="file" name="photo2"><br>
    사진3: <input type="file" name="photo3"><br>
    </div>

</form>
</body>
</html>