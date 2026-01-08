<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
    <h2>게시글 수정</h2>
    
    <form action="/board/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="bno" value="${board.bno}">
        
        <table border="1">
            <tr>
                <th>제목</th>
                <td><input type="text" name="btitle" value="${board.btitle}" style="width:100%"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="bcontent" rows="10" style="width:100%">${board.bcontent}</textarea></td>
            </tr>
            <tr>
                <th>이미지 변경</th>
                <td>
                    <p>기존 이미지: ${board.bimage}</p>
                    <input type="file" name="uploadfile">
                </td>
            </tr>
        </table>
        
        <div style="margin-top: 10px;">
            <button type="submit">수정 완료</button>
            <button type="button" onclick="history.back()">취소</button>
        </div>
    </form>
</body>
</html>