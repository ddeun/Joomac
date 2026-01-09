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
        background: #fff8f0;
        color: #333;
        margin: 20px auto;
        max-width: 800px;
        padding: 0 20px 50px;
    }

    h2 {
        text-align: center;
        color: #7d3c22;
        margin-bottom: 30px;
        font-weight: 700;
        letter-spacing: 1.5px;
        text-shadow: 1px 1px 1px #d9b382;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background: #fff8f0;
        box-shadow: 0 4px 12px rgba(125, 60, 34, 0.1);
        border-radius: 12px;
        overflow: hidden;
    }
    th, td {
        padding: 12px 10px;
        text-align: left;
        font-size: 15px;
        color: #5a3a1b;
    }
    th {
        width: 150px;
        background-color: #f4e3d3;
        font-weight: 700;
        font-size: 16px;
        letter-spacing: 1px;
        color: #3e230b;
    }
    tr {
        transition: background-color 0.25s ease;
    }
    tr:hover {
        background-color: #fdf0dc;
    }

    .product-img {
        max-width: 300px;
        height: auto;
        display: block;
        margin-bottom: 10px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(125, 60, 34, 0.3);
    }

    .button-group {
        margin-top: 20px;
        text-align: center;
    }
    .button-group a {
        display: inline-block;
        margin: 0 10px 10px 0;
        padding: 10px 18px;
        border-radius: 5px;
        background-color: #fff3e0;
        color: #7d3c22;
        font-weight: bold;
        text-decoration: none;
        border: 2px solid #ffa500;
        transition: all 0.3s ease;
    }
    .button-group a:hover {
        background-color: #ffa500;
        color: #fff;
        transform: translateY(-2px);
    }

    /* 구매하기 버튼 */
    button.buy-btn {
        padding: 10px 20px;
        background-color: #ffa500;
        color: white;
        border: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }
    button.buy-btn:hover {
        background-color: #ff8c00;
    }
</style>
</head>
<body>
<h2>주류 상세 정보</h2>

<table>
    <tr>
        <th>상품 이미지</th>
        <td>
            <c:choose>
                <c:when test="${product.pimage != null}">
                    <img src="/images/${product.pimage}" class="product-img" alt="${product.pname}">
                </c:when>
                <c:otherwise>이미지가 없습니다.</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <th>상품명</th>
        <td>${product.pname}</td>
    </tr>
    <tr>
        <th>카테고리</th>
        <td>${product.pcategory}</td>
    </tr>
    <tr>
        <th>가격</th>
        <td>${product.pprice} 원</td>
    </tr>
    <tr>
        <th>알코올 도수</th>
        <td>${product.palcohol}%</td>
    </tr>
    <tr>
        <th>용량</th>
        <td>${product.psize}ml</td>
    </tr>
    <tr>
        <th>재고 수량</th>
        <td>
            <c:choose>
                <c:when test="${product.pcount == 0}">
                    <span style="color:red;">품절</span>
                </c:when>
                <c:otherwise>${product.pcount} 개</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <th>상세 설명</th>
        <td>${product.pdetail}</td>
    </tr>
    <tr>
        <th>추천 안주 이미지</th>
        <td>
            <c:choose>
                <c:when test="${product.ppairingImage != null}">
                    <img src="/images/${product.ppairingImage}" class="product-img" alt="추천 안주">
                </c:when>
                <c:otherwise>이미지가 없습니다.</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <th>추천 안주</th>
        <td>${product.ppairing}</td>
    </tr>
</table>

<div class="button-group">
    <a href="/product/list">목록으로</a>
    <a href="/product/updateform?pno=${product.pno}">수정하기</a>
    <a href="/product/delete?pno=${product.pno}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>
    <br>
    <!-- 구매하기 버튼 -->
    <form action="/cart/add" method="post" style="display:inline;">
        <input type="hidden" name="pno" value="${product.pno}">
        <input type="hidden" name="quantity" value="1">
        <button type="submit" class="buy-btn">구매하기</button>
    </form>
</div>

    <table>
        <!-- 상품 이미지 -->
        <tr>
            <th>상품 이미지</th>
            <td>
                <c:choose>
                    <c:when test="${product.pimage != null}">
                        <!-- 이미지 경로: /images/파일명 -->
                        <img src="/images/${product.pimage}" class="product-img" alt="${product.pname}">
                    </c:when>
                    <c:otherwise>이미지가 없습니다.</c:otherwise>
                </c:choose>
            </td>
        </tr>

        <!-- 상품명 -->
        <tr>
            <th>상품명</th>
            <td>${product.pname} (번호: ${product.pno})</td>
        </tr>

        <!-- 카테고리 -->
        <tr>
            <th>카테고리</th>
            <td>${product.pcategory}</td>
        </tr>

        <!-- 가격 -->
        <tr>
            <th>가격</th>
            <td>${product.pprice} 원</td>
        </tr>

        <!-- 알코올 도수 -->
        <tr>
            <th>알코올 도수</th>
            <td>${product.palcohol}%</td>
        </tr>

        <!-- 용량 -->
        <tr>
            <th>용량</th>
            <td>${product.psize}</td>
        </tr>

        <!-- 재고 수량 -->
        <tr>
            <th>재고 수량</th>
            <td>
                <c:choose>
                    <c:when test="${product.pcount == 0}">
                        <span style="color:red;">품절</span>
                    </c:when>
                    <c:otherwise>${product.pcount} 개</c:otherwise>
                </c:choose>
            </td>
        </tr>

        <!-- 상세 설명 -->
        <tr>
            <th>상세 설명</th>
            <td>${product.pdetail}</td>
        </tr>

        <!-- 추천 안주 -->
        <tr>
            <th>추천 안주</th>
            <td>${product.ppairing}</td>
        </tr>
    </table>

    <br>
    <!-- 버튼 그룹 -->
    <div class="button-group">
        <a href="/product/list">목록으로</a> |
        <a href="/product/updateform?pno=${product.pno}">수정하기</a> |
        <a href="/product/delete?pno=${product.pno}" 
           onclick="return confirm('정말 삭제하시겠습니까?')">삭제하기</a>
    </div>
</body>
</html>
