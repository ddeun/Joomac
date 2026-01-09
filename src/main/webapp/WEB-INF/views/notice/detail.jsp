<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
    <h2>공지사항 상세보기</h2>
    <table border=1>
        <tr>
            <th>번호</th>
            <td>${notice.nno}</td>
            <th>작성일</th>
            <td><fmt:formatDate value="${notice.ndate}" pattern="yyyy-MM-dd HH:mm" /></td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3"><strong>${notice.ntitle}</strong></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3" class="content-area">
                <c:if test="${not empty notice.nimage}">
                    <div class="img-box">
                        <img src="/upload/${notice.nimage}" alt="공지 이미지">
                    </div>
                </c:if>
                
                <pre>${notice.ncontent}</pre>
            </td>
        </tr>
    </table>


    <div>
        <button onclick="location.href='/notice/list'">목록으로</button>
        
        <c:if test="${sessionScope.loginUser.mid == 'admin'}">
            <button onclick="location.href='/notice/update?nno=${notice.nno}'">수정</button>
            <button onclick="deleteNotice(${notice.nno})">삭제</button>
        </c:if>
    </div>

    <script>
        function deleteNotice(nno) {
            if(confirm("이 공지사항을 정말 삭제하시겠습니까?")) {
                location.href = "/notice/delete?nno=" + nno;
            }
        }
    </script>
</body>
</html>