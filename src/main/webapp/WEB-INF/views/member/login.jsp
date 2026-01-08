<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 주맥 회원 로그인</title>
<script>
function checkLogin() {
    let f = document.login;

    let mid = f.mid.value.trim();
    let mpasswd = f.mpasswd.value.trim();

    if (mid === "") {
        alert("아이디를 입력하세요.");
        f.mid.focus();
        return false;
    }

    if (mpasswd === "") {
        alert("비밀번호를 입력하세요.");
        f.mpasswd.focus();
        return false;
    }

    return true;
}
</script>
</head>
<body style="text-align:center;">
<c:if test="${not empty loginError}">
    <script>
        alert("${loginError}");
    </script>
    <c:remove var="loginError" scope="session"/>
</c:if>
   <h3>로그인</h3>
   <form name="login" method="post" action="/member/login" onsubmit="return checkLogin();">
      <div>
         아이디 : <input type="text" name="mid" placeholder="아이디를 입력하세요.">
      </div>
      <div>
         비밀번호 : <input type="password" name="mpasswd" placeholder="비밀번호를 입력하세요.">
      </div>   
      <div>
         <input type="submit" value="로그인">
         <input type="button" value="회원가입"  onclick="location.href='/member/join'">
      </div>   
   </form>
</body>
</html>