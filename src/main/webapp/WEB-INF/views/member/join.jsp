<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주맥 회원가입</title>
<script>
function checkMember() {
   
   let f = document.member;
   
   let mid = f.mid.value.trim();
    let mpasswd = f.mpasswd.value.trim();
    let mname = f.mname.value.trim();
    let mbirth = f.mbirth.value;
    let mtel = f.mtel.value.trim();
    let memail = f.memail.value.trim();

   let regExpId = /^[a-zA-Z0-9]{4,12}$/;
    let regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!?@#+])[A-Za-z\d!?@#+]{8,16}$/;
    let regExpName = /^[가-힣|a-z|A-Z]$/;
    let regExpTel = /^01[016789][0-9]{7,8}$/;
    let regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    
    if (!regExpId.test(mid)) {
        alert("아이디는 영문/숫자 포함 4~12자입니다.");
        f.mid.focus();
        return false;
    }

   
    if (!regExpPw.test(mpasswd)) {
        alert("비밀번호는 영문, 숫자, 특수문자 포함 8~16자입니다.");
        f.mpasswd.focus();
        return false;
    }

    
    if (!regExpName.test(mname)) {
        alert("이름을 입력하세요.");
        f.mname.focus();
        return false;
    }
    
    if (mbirth === "") {
        alert("생년월일을 선택하세요.");
        f.mbirth.focus();
        return false;
    }
   
 // 미성년자 가입 불가 (만 19세 미만)
    let today = new Date();
    let birth = new Date(mbirth);
    let age = today.getFullYear() - birth.getFullYear();

    let m = today.getMonth() - birth.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birth.getDate())) {
        age--;
    }

    if (age < 19) {
        alert("미성년자는 가입할 수 없습니다.");
        return false;
    }
    
    if (!f.mgender[0].checked && !f.mgender[1].checked) {
        alert("성별을 선택하세요.");
        return false;
    }
    
    if (!regExpTel.test(mtel)) {
        alert("전화번호를 입력하세요.);
        f.mtel.focus();
        return false;
    }

  
    if (!regExpEmail.test(memail)) {
        alert("이메일을 입력해주세요.");
        f.memail.focus();
        return false;
    }

    return true; 
}
</script>

</head>
<body>
   <form name="member" method="post" action="/member/join">
      <table border="1" width="280" align="center">
         <tr> 
            <td align="center">아이디 : <input type="text" name="mid"></td>
         <tr>
            <td align="center">비밀번호 : <input type="password" name="mpasswd"></td>
         </tr>
         <tr>   
            <td align="center">이름 : <input type="text" name="mname"></td>
         </tr>
         <tr>
            <td align="center">생년월일 : <input type="date" name="mbirth"></td>
         </tr>
         <tr>
            <td align="center">성별 : <input type="radio" name="mgender" value="남자"> 남자 
                    <input type="radio" name="mgender" value="여자"> 여자
            </td>
         </tr>
         <tr>   
            <td align="center">전화번호 : <input type="text" name="mtel"></td>
         </tr>
         <tr>   
            <td align="center">주소 : <input type="text" name="maddr"></td>
         </tr>
         <tr>   
            <td align="center">이메일 : <input type="text" name="memail"></td>
         </tr>
            <input type="hidden" name="mdate">   
         <tr>
            <td align="center"><input type="submit" value="회원가입" onclick="return checkmember()"> <input type="reset" value="취소"></td>
         </tr>
      </table>      
   </form>
</body>
</html>