<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<form name="board" method="post" action="/board/list">
	<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="notice" items="${noticeList}">
            <tr>
                <td>${board.bno}</td> <td><a href="detail?bno=${board.bno}">${board.btitle}</a></td>
                <td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td> 
                <td>${board.bview}</td> 
           	</tr>
        </c:forEach>
    </tbody>
	</table>
</form>
<button onclick="location.href='write'">글쓰기</button>
</body>
</html>