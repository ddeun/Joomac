<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
</head>
<body>
	<h2>회원 상세 정보</h2>
	<table border="1">
		<tr><th>회원번호</th><td>${dto.mno}</td></tr>
		<tr><th>아이디</th><td>${dto.mid}</td></tr>
		<tr><th>이름</th><td>${dto.mname}</td></tr>
		<tr><th>생일</th><td>${dto.mbirth}</td></tr>
		<tr><th>전화번호</th><td>${dto.mtel}</td></tr>
		<tr><th>성별</th><td>${dto.mgender}</td></tr>
		<tr>
			<th>주소</th>
			<td>${dto.mzipcode} ${dto.maddr} ${dto.maddrdetail}</td>
		</tr>
		<tr><th>이메일</th><td>${dto.memail}</td></tr>
		<tr>
			<th>가입일</th>
			<td>
				<fmt:formatDate value="${dto.mdate}" pattern="yyyy-MM-dd HH:mm" />
			</td>
		</tr>
	</table>
	
<br>

<a href="/admin/list">목록으로</a>
<a href="#?mno=${dto.mno}"
   onclick="return confirm('정말 탈퇴시키겠습니까?')">
   탈퇴 
</a>

</body>
</html>