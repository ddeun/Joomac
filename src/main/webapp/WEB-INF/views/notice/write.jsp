<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<h2>공지사항 작성</h2>
	<form action="/notice/write" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="ntitle" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="ncontent" rows="10" cols="50" required></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="uploadfile"></td>
			</tr>
		</table>
		<br>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='/notice/list'">취소</button>	
	</form>
</body>
</html>