<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류 상품 목록</title>
<style>
    /* 기본 폰트, 배경 */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f7f3ef; /* 연한 크림톤 */
        color: #4a3420; /* 부드러운 다크 브라운 */
        margin: 20px auto;
        max-width: 1200px;
        padding: 0 20px 50px;
    }
    
    h2 {
        text-align: center;
        color: #6b4b28;
        margin-bottom: 30px;
        font-weight: 700;
        letter-spacing: 1px;
        text-shadow: 1px 1px 1px #e5c8a1;
    }

    /* 카테고리 메뉴 */
    .category-menu {
        text-align: center;
        margin-bottom: 25px;
    }
    .category-menu a {
        display: inline-block;
        margin: 0 10px 10px 0;
        padding: 8px 18px;
        border-radius: 25px;
        border: 2px solid #b6895c;
        color: #7d5430;
        font-weight: 600;
        background-color: #fff8f2;
        transition: all 0.3s ease;
        text-decoration: none;
        box-shadow: 0 2px 4px rgba(125, 60, 34, 0.1);
    }
    .category-menu a:hover {
        background-color: #b6895c;
        color: #fff;
        box-shadow: 0 4px 8px rgba(125, 60, 34, 0.2);
        transform: translateY(-2px);
    }
    .category-menu a.active {
        background-color: #b6895c;
        color: white;
        font-weight: 700;
        box-shadow: 0 4px 8px rgba(125, 60, 34, 0.3);
        transform: translateY(-2px);
    }

    /* 상품 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 10px;
        background: #fff8f2;
        box-shadow: 0 2px 6px rgba(125, 60, 34, 0.1);
        border-radius: 12px;
        overflow: hidden;
    }
    th, td {
        padding: 12px 10px;
        text-align: center;
        vertical-align: middle;
        font-size: 15px;
        color: #4a3420;
    }
    th {
        background-color: #e6c9a1;
        font-weight: 700;
        font-size: 16px;
        letter-spacing: 1px;
        color: #4a3420;
    }
    tr {
        background-color: #fff8f2;
        border-radius: 6px;
        transition: background-color 0.25s ease;
    }
    tr:hover {
        background-color: #fce8d9;
    }
    td img {
        border-radius: 6px;
        box-shadow: 0 2px 4px rgba(125, 60, 34, 0.2);
        max-width: 80px;
        height: auto;
        transition: transform 0.3s ease;
        cursor: pointer;
    }
    td img:hover {
        transform: scale(1.05);
        box-shadow: 0 3px 6px rgba(125, 60, 34, 0.3);
    }

    /* 관리 링크 스타일 */
    td a {
        color: #7d5430;
        font-weight: 600;
        margin: 0 4px;
        transition: color 0.3s ease;
        text-decoration: none;
    }
    td a:hover {
        color: #a86932;
        text-decoration: underline;
    }

    /* 상품 등록 버튼 */
    a#register-btn {
        display: block;
        width: 160px;
        margin: 30px auto 0;
        padding: 12px 0;
        background-color: #b6895c;
        color: #fff;
        font-weight: 700;
        border-radius: 30px;
        text-align: center;
        box-shadow: 0 4px 10px rgba(125, 60, 34, 0.3);
        transition: background-color 0.3s ease;
        text-decoration: none;
    }
    a#register-btn:hover {
        background-color: #a86932;
        box-shadow: 0 5px 12px rgba(168, 105, 50, 0.4);
    }
</style>
</head>
<body>
<h2>주류 상품 목록</h2>

<!-- 상단 카테고리 메뉴 -->
<div class="category-menu">
    <a href="${pageContext.request.contextPath}/product/list"
       class="${empty category ? 'active' : ''}">전체보기</a>
    <a href="${pageContext.request.contextPath}/product/list?category=소주/증류주"
       class="${category == '소주/증류주' ? 'active' : ''}">소주/증류주</a>
    <a href="${pageContext.request.contextPath}/product/list?category=막걸리/탁주"
       class="${category == '막걸리/탁주' ? 'active' : ''}">막걸리/탁주</a>
    <a href="${pageContext.request.contextPath}/product/list?category=청주/약주"
       class="${category == '청주/약주' ? 'active' : ''}">청주/약주</a>
    <a href="${pageContext.request.contextPath}/product/list?category=과실주"
       class="${category == '과실주' ? 'active' : ''}">과실주</a>
    <a href="${pageContext.request.contextPath}/product/list?category=기타우리술"
       class="${category == '기타우리술' ? 'active' : ''}">기타 우리술</a>
</div>

<!-- 상품 테이블 -->
<table>
    <thead>
    <tr>
        <th>이미지</th>
        <th>상품명</th>
        <th>가격</th>
        <th>카테고리</th>
        <th>재고</th>
        <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${list}">
        <tr>
            <td>
                <c:if test="${dto.pimage != null}">
                    <a href="/product/detail?pno=${dto.pno}">
                        <img src="/images/${dto.pimage}" alt="상품이미지">
                    </a>
                </c:if>
            </td>
            <td>${dto.pname}</td>
            <td>${dto.pprice} 원</td>
            <td>
                <a href="${pageContext.request.contextPath}/product/list?category=${dto.pcategory}">
                    ${dto.pcategory}
                </a>
            </td>
            <td>
                <c:choose>
                    <c:when test="${dto.pcount == 0}">품절</c:when>
                    <c:otherwise>${dto.pcount}</c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/product/updateform?pno=${dto.pno}">수정</a> |
                <a href="${pageContext.request.contextPath}/product/delete?pno=${dto.pno}" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
<a href="${pageContext.request.contextPath}/product/write" id="register-btn">상품 등록</a>

</body>
</html>
