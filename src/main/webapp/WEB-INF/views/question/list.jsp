<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록</title>
</head>
<body>

<h2>1:1 문의 목록</h2>

<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>상태</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="question" items="${list}">
            <tr>
                <td>${question.qno}</td>
                <td>
                    <a href="/question/detail?qno=${question.qno}">
    					${question.qtitle}
					</a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${question.qstatus == '답변완료'}">
                            답변완료
                        </c:when>
                        <c:otherwise>
                            답변대기
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <fmt:formatDate value="${question.qdate}" pattern="yyyy-MM-dd" />
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<br>

		<button type="button" onclick="location.href='/question/write'">문의하기</button>

</body>
</html>