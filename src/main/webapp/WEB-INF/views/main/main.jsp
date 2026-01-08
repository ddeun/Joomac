<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOOMAC</title>
</head>
<body>

<header>
    <h1>JOOMAC</h1>
    <img src="/images/joomaclogo.png" style="width: 200px; height: auto;">

    <nav>
        <c:choose>
            <c:when test="${empty sessionScope.loginUser}">
                <a href="/member/login">로그인</a>
                <a href="/member/join">회원가입</a>
            </c:when>

            <c:otherwise>
                <strong>
                    ${sessionScope.loginUser.mname}님 환영합니다
                </strong>
                
                <a href="/member/myinfo">내정보</a>
                
                <a href="/member/logout">로그아웃</a>
            </c:otherwise>
        </c:choose>

        <br><br>

        <a href="/board/list">자유게시판</a>
        <a href="/product/list">상품보기</a>
    </nav>
</header>

<hr>

<main>
    <h2>오늘의 추천 주류</h2>
    <div style="border: 1px solid #ccc; padding: 20px;">
        <p>프로젝트의 메인 페이지입니다.</p>
    </div>
</main>

</body>
</html>