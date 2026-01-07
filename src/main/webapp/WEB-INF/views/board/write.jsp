<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 게시글 작성</title>
</head>
<body>
	<h2>게시글 작성</h2>
    <form action="/board/write" method="post" enctype="multipart/form-data">
        <table border="1">
            <tr>
                <th>제목</th>
                <td><input type="text" name="btitle" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="bcontent" rows="10" cols="50" required></textarea></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="file" name="uploadfile"></td>
            </tr>
            	<input type="hidden" name="mno" value="1"> 
        </table>
        <br>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='/board/list'">취소</button>
    </form>
</body>
</html>