<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style>
    table { width: 800px; border-collapse: collapse; margin-top: 20px; }
    th { width: 150px; background-color: #f4f4f4; padding: 10px; border: 1px solid #ccc; }
    td { padding: 10px; border: 1px solid #ccc; }
    .content-box { min-height: 300px; vertical-align: top; }
    .img-box img { max-width: 500px; height: auto; display: block; margin: 10px 0; }
</style>
</head>
<body>
    <h2>게시글 상세보기</h2>
    
    <table>
        <tr>
            <th>번호</th>
            <td>${board.bno}</td>
            <th>조회수</th>
            <td>${board.bview}</td>
        </tr>
        <tr>
            <th>작성자(MNO)</th>
            <td>${board.mno}</td>
            <th>작성일</th>
            <td>${board.bdate}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3"><strong>${board.btitle}</strong></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" class="content-box">
                <c:if test="${not empty board.bip}">
                    <div class="img-box">
                        <img src="/images/${board.bip}" alt="첨부 이미지">
                    </div>
                </c:if>
                
                <pre style="white-space: pre-wrap; font-family: inherit;">${board.bcontent}</pre>
            </td>
        </tr>
    </table>

    <div style="margin-top: 20px;">
        <button onclick="location.href='/board/list'">목록으로</button>
        
        <c:if test="${sessionScope.member.mno == board.mno}">
            <button onclick="location.href='/board/update?bno=${board.bno}'">수정</button>
            <button onclick="deleteCheck(${board.bno})">삭제</button>
        </c:if>
    </div>

    <script>
        function deleteCheck(bno) {
            if(confirm("정말 삭제하시겠습니까?")) {
                location.href = "/board/delete?bno=" + bno;
            }
        }
    </script>
</body>
</html>