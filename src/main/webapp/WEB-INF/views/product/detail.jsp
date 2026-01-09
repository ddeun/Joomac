<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 - ${product.pname}</title>

<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f7f3ef;
    color: #4a3420;
    margin: 20px auto;
    max-width: 900px;
    padding: 0 20px 50px;
}

h2 {
    text-align: center;
    color: #6b4b28;
    margin-bottom: 25px;
    font-weight: 700;
    letter-spacing: 1px;
    text-shadow: 1px 1px 1px #e5c8a1;
}

/* ⭐ 카드형 행 레이아웃 */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 12px;
}

tr {
    background: #fff8f2;
    box-shadow: 0 2px 6px rgba(125,60,34,0.08);
    transition: transform .15s ease, box-shadow .15s ease;
}

tr:hover {
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(125,60,34,0.12);
}

th {
    width: 170px;
    background: #e6c9a1;
    color: #3e230b;
    font-weight: 700;
    padding: 14px 12px;
    border: 1px solid #d7b894;
    border-right: none;
    border-radius: 12px 0 0 12px;
}

td {
    padding: 14px 12px;
    color: #5a3a1b;
    border: 1px solid #d7b894;
    border-left: none;
    border-radius: 0 12px 12px 0;
}

.product-img {
    max-width: 320px;
    border: 1px solid #d7b894;
    background: #fff;
    padding: 8px;
    border-radius: 8px;
}

/* 버튼 */
.button-group {
    margin-top: 25px;
    display: flex;
    justify-content: center;
    gap: 10px;
    flex-wrap: wrap;
}

.button-group a,
.button-group button {
    width: 140px;
    padding: 12px 0;
    border-radius: 30px;
    border: none;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    text-decoration: none;
    box-shadow: 0 4px 10px rgba(125, 60, 34, 0.25);
    transition: .2s ease;
}

.btn-list { background:#e6c9a1; color:#4a3420; }
.btn-edit { background:#7d5430; color:#fff; }
.btn-delete { background:#b85c38; color:#fff; }
.buy-btn { background:#b6895c; color:#fff; }

.button-group a:hover,
.button-group button:hover {
    transform: translateY(-2px);
    filter: brightness(0.95);
}
</style>
</head>

<body>

<h2>주류 상세 정보</h2>

<table>
<tr><th>상품 이미지</th><td><img src="/images/${product.pimage}" class="product-img"></td></tr>
<tr><th>상품명</th><td>${product.pname}</td></tr>
<tr><th>카테고리</th><td>${product.pcategory}</td></tr>
<tr><th>가격</th><td>${product.pprice} 원</td></tr>
<tr><th>알코올 도수</th><td>${product.palcohol}%</td></tr>
<tr><th>용량</th><td>${product.psize}ml</td></tr>
<tr><th>재고 수량</th><td>${product.pcount}</td></tr>
<tr><th>상세 설명</th><td>${product.pdetail}</td></tr>
<tr><th>추천 안주 이미지</th><td><img src="/images/${product.ppairingImage}" class="product-img"></td></tr>
<tr><th>추천 안주</th><td>${product.ppairing}</td></tr>
</table>

<div class="button-group">
    <a class="btn-list" href="/product/list">목록</a>
    <a class="btn-edit" href="/product/updateform?pno=${product.pno}">수정</a>
    <a class="btn-delete" href="/product/delete?pno=${product.pno}">삭제</a>
    <form action="/cart/add" method="post" style="display:inline;">
        <input type="hidden" name="pno" value="${product.pno}">
        <button class="buy-btn">구매</button>
    </form>
</div>

</body>
</html>
