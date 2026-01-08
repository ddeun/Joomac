<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>
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
	</table>

	<br>
	
	<a href="/member/passwordcheck">회원정보 수정</a>
	
	&nbsp; | &nbsp;
	
	<a href="/member/withdraw" onclick="return confirm('정말 탈퇴하시겠습니까?');"> 회원 탈퇴 </a>
</body>
</html>
