<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주맥 회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<form name="member" method="post" action="/member/join">
      <table border="1" width="350">
         <tr> 
            <td>아이디 : <input type="text" name="mid"></td>
         <tr>
            <td>비밀번호 : <input type="password" name="mpasswd"></td>
         </tr>
         <tr>   
            <td>이름 : <input type="text" name="mname"></td>
         </tr>
         <tr>
            <td>생년월일 : <input type="date" name="mbirth"></td>
         </tr>
         <tr>
            <td>성별 : <input type="radio" name="mgender" value="남자"> 남자 
                    <input type="radio" name="mgender" value="여자"> 여자
            </td>
         </tr>
         <tr>   
            <td>전화번호 : <input type="text" name="mtel"></td>
         </tr>
         <tr>   
            <td>주소 : <input type="text" name="maddr"></td>
         </tr>
         <tr>   
            <td>이메일 : <input type="text" name="memail"></td>
         </tr>
         <tr>
            <td> 가입일 : <input type="date" name="mdate"></td>         
         </tr>
         <tr>
         <td><input type="submit" value="회원가입" onclick="return checkmember()"> <input type="reset" value="취소"></td>
         </tr>
      </table>      
   </form>
</body>
</html>