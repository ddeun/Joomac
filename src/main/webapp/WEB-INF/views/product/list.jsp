<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
<h2>주류 상품 목록</h2>

<table border="1">
    <tr>
        <th>이미지</th>
        <th>상품명</th>
        <th>가격</th>
        <th>카테고리</th>
        <th>재고</th>
        <th>관리</th>
    </tr>

    <c:forEach var="dto" items="${list}">
        <tr>
            <td>
                <c:if test="${dto.pimage != null}">
                    <img src="${pageContext.request.contextPath}/images/${dto.pimage}" width="80" alt="상품이미지">
                </c:if>
            </td>
            <td>${dto.pname}</td>
            <td>${dto.pprice} 원</td>
            <td>${dto.pcategory}</td>
            <td>
                <c:choose>
                    <c:when test="${dto.pcount == 0}">품절</c:when>
                    <c:otherwise>${dto.pcount}</c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="/product/detail?pno=${dto.pno}">상세</a> |
                <a href="/product/edit?pno=${dto.pno}">수정</a> |
                <a href="/product/delete?pno=${dto.pno}" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
            </td>
        </tr>
    </c:forEach>
</table>

<br>
<a href="/product/write">상품 등록</a>
</body>
</html>