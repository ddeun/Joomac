<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
    <h2>📢 공지사항 수정</h2>
    <hr>

    <form action="/notice/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="nno" value="${notice.nno}">
        
        <table border=1>
            <tr>
                <th>공지 번호</th>
                <td>${notice.nno}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="ntitle" value="${notice.ntitle}" required>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="ncontent" rows="10" required>${notice.ncontent}</textarea>
                </td>
            </tr>
            <tr>
                <th>첨부 이미지</th>
                <td>
                    <c:if test="${not empty notice.nimage}">
                            현재 파일:${notice.nimage}
                    </c:if>
                    <input type="file" name="uploadFile">
                </td>
            </tr>
        </table>

        <div class="btn-area">
            <button type="submit">수정완료</button>
            <button type="button" onclick="location.href='/notice/detail?nno=${notice.nno}'">취소</button>
            <button type="button" onclick="location.href='/notice/list'">목록으로</button>
        </div>
    </form>
</body>
</html>