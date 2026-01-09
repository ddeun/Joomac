<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 상세보기 - ${product.pname}</title>
    <style>
        table { 
            width: 600px; 
            border-collapse: collapse; 
            margin-top: 20px; 
        }
        th { 
            width: 150px; 
            background-color: #f4f4f4; 
            text-align: left; 
            padding: 10px; 
        }
        td { 
            padding: 10px; 
            border: 1px solid #ddd; 
        }
        .product-img { 
            max-width: 300px; 
            height: auto; 
            display: block; 
            margin-bottom: 10px; 
        }
    </style>
</head>
<body>
    <h2>주류 상세 정보</h2>

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