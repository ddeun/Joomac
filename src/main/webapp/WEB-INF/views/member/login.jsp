<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주맥 회원 로그인</title>
</head>
<body>
<h3>로그인</h3>
   <form name="login" method="post" action="/member/login">
      <div>
         아이디 : <input type="text" placeholder="아이디를 입력하세요.">
      </div>
      <div>
         비밀번호 : <input type="password" placeholder="비밀번호를 입력하세요.">
      </div>   
      <div>
         <input type="submit" value="로그인">
         <input type="button" value="회원가입">
      </div>   
   </form>
</body>
</html>