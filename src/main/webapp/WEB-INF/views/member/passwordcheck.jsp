<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>

<h3>비밀번호 확인</h3>

<!-- 🔴 비밀번호 오류 메시지 -->
<c:if test="${not empty sessionScope.pwError}">
    <p style="color:red;">
        ${sessionScope.pwError}
    </p>
    <!-- 한 번 보여주고 삭제 -->
    <c:remove var="pwError" scope="session"/>
</c:if>

<form method="post" action="/member/passwordcheck">
    비밀번호 :
    <input type="password" name="mpasswd" required>
    <button type="submit">확인</button>
</form>

</body>
</html>
