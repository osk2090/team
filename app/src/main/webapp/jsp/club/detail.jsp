<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>클럽 상세</title>
</head>
<body>
<h1>클럽 상세보기</h1>
<form action='update' method='post'>
    번호: <input type='text' name='arrive' value='${club.no}' readonly><br>
    방장: <input type='text' name='writer' value='${club.writer.name}' readonly><br>
    도착지: <input type='text' name='arrive' value='${club.arrive}' readonly><br>
    가는날: <input type='date' name='startDate' value='${club.startDate}' readonly><br>
    오는날: <input type='date' name='endDate' value='${club.endDate}' readonly><br>
    테마: <select name='theme' id='theme' value='${club.theme}' >
    <option value='불멍때리기'>불멍때리기</option>
    <option value='고기파티'>고기파티</option>
    <option value='낚시'>낚시</option>
    <option value='일상탈출'>일상탈출</option>
    <option value='글램핑'>글램핑</option>
    <option value='캠핑'>캠핑</option>
    <option value='별보기'>별보기</option>
</select><br>
    제목: <input type='text' name='title' value='${club.title}'><br>
    내용: <textarea name='content' rows='10' cols='60'>${club.content}</textarea><br>
    인원수(최대 10명): <input type='number' name='count' value='${club.total}'><br>
<%--    <jsp:include page="/jsp/club/photo_list.jsp"/>--%>
<%--    사진1: <input type="file" name="photo1"><br>--%>
<%--    사진2: <input type="file" name="photo2"><br>--%>
<%--    사진3: <input type="file" name="photo3"><br>--%>
    <input type='submit' value='변경'>
    <a href='delete?no=${club.getNo()}'>삭제</a>
</form>
<p><a href='list'>목록</a></p>
</body>
</html>
  