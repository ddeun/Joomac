<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 작성</title>
</head>
<body>

	<h2>1:1 문의 작성</h2>

	<form action="/question/write" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="qtitle" required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="qcontent" rows="10" cols="50" required></textarea>
				</td>
			</tr>
		</table>

		<br>

		<button type="submit">등록</button>
		<button type="button" onclick="location.href='/question/list'">취소</button>
	</form>

</body>
</html>