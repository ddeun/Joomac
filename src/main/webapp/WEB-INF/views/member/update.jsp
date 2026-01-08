<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<form name="member" method="post" action="/member/update">
		<input type="hidden" name="mno" value="${edit.mno}">
		<p>아이디 : ${edit.mid} </p>
		<p>비밀번호 : <input type="password" name="mpasswd" placeholder="변경 시에만 입력"></p>
		<p>이름 : <input type="text" name="mname" value="${edit.mname}"></p>
		<p>생일 : ${edit.mbirth} </p>
		<p>전화번호 : <input type="text" name="mtel" value="${edit.mtel}"></p>
		<p>성별 : ${edit.mgender} </p>
		<p>우편번호 : <input type="text" name="mzipcode" value="${edit.mzipcode}" readonly></p>
		<p>주소 : <input type="text" name="maddr" value="${edit.maddr}" readonly></p>
		<p>상세 주소 : <input type="text" name="maddrdetail" value="${edit.maddrdetail}"></p>
		<p>이메일 : <input type="text" name="memail" value="${edit.memail}"></p>
		<p> 
			<input type="submit" value="회원정보수정">
			<input type="button" value="수정취소" onclick="location.href='/member/mypage';">
		</p>
	</form>
</body>
</html>