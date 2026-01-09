<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 수정</title>
</head>
<body>

<h2>1:1 문의 수정</h2>

<form action="/question/update" method="post">
    <input type="hidden" name="qno" value="${question.qno}">

    <table border="1">
        <tr>
            <th>제목</th>
            <td>
                <input type="text" name="qtitle"
                       value="${question.qtitle}" required>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea name="qcontent" rows="10" cols="50" required>
				${question.qcontent}</textarea>
            </td>
        </tr>
    </table>

    <br>

    <button type="submit">수정 완료</button>
    <button type="button"
            onclick="location.href='detail?qno=${question.qno}'">취소</button>
</form>

</body>
</html>