<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 회원 목록</title>
</head>
<body>
	<h1>회원 목록</h1>
	<table>
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>생일</td>
			<td>전화번호</td>
			<td>성별</td>
			<td>주소</td>
			<td>이메일</td>
			<td>가입일</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.mno}</td>
			<td>
            	<a href="/member/listdetail?mno=${dto.mno}">
                	${dto.mid} </a>
			</td>
			<td>${dto.mname}</td>
			<td>${dto.mbirth}</td>
			<td>${dto.mtel}</td>
			<td>${dto.mgender}</td>
			<td>${dto.mzipcode} ${dto.maddr} ${dto.maddrdetail}</td>
			<td>${dto.memail}</td>
			<td><fmt:formatDate value="${dto.mdate}" pattern="yyyy-MM-dd (E)" /></td>
			<td>
				<a href="#?mno=${dto.mno}">삭제</a>
			</td>
		</tr>
		</c:forEach>		
	</table>
</body>
</html>