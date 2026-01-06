<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 장바구니</title>
<style>
    .cart-table { width: 100%; border-collapse: collapse; text-align: center; }
    .cart-table th, .cart-table td { border: 1px solid #ddd; padding: 10px; }
    .total-area { margin-top: 20px; text-align: right; font-size: 1.2em; }
</style>
</head>
<body>
    <h2>🛒 장바구니</h2>

    <form action="/order/ready" method="post">
        <table class="cart-table">
            <thead>
                <tr>
                    <th>선택</th>
                    <th>상품번호</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>소계</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="totalPrice" value="0" />
                <c:forEach var="item" items="${cartList}">
                    <tr>
                        <td><input type="checkbox" name="selectedItems" value="${item.cno}"></td>
                        <td>${item.pno}</td>
                        <td>
                            <input type="number" value="${item.ccount}" min="1" style="width: 50px;">
                            <button type="button">변경</button>
                        </td>
                        <td><fmt:formatNumber value="${item.cprice}" pattern="#,###원"/></td>
                        <td>
                            <fmt:formatNumber value="${item.cprice * item.ccount}" pattern="#,###원"/>
                            <c:set var="totalPrice" value="${totalPrice + (item.cprice * item.ccount)}" />
                        </td>
                        <td>
                            <button type="button" onclick="location.href='/cart/delete?cno=${item.cno}'">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty cartList}">
                    <tr>
                        <td colspan="6">장바구니가 비어 있습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>

        <div class="total-area">
            <strong>총 결제 예정 금액: </strong>
            <span style="color: red;"><fmt:formatNumber value="${totalPrice}" pattern="#,###원"/></span>
        </div>

        <div style="margin-top: 20px; text-align: center;">
            <button type="button" onclick="location.href='/'">쇼핑 계속하기</button>
            <button type="submit">선택 상품 주문하기</button>
        </div>
    </form>
</body>
</html>