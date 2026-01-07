<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주맥 회원가입</title>
<script>
function goPopup(){
	   var pop = window.open("jusopopup","pop","width=570,height=420,scrollbars=yes,resizable=yes")
	}
function jusoCallBack(mzipcode, maddr, maddrdetail){
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.]
    document.member.mzipcode.value = mzipcode;
    document.member.maddr.value = maddr;
    document.member.maddrdetail.value = maddrdetail;
}
function checkMember() {
   
   let f = document.member;
   
    let mid = f.mid.value.trim();
    let mpasswd = f.mpasswd.value.trim();
    let mname = f.mname.value.trim();
    let mbirth = f.mbirth.value;
    let mtel = f.mtel.value.replace(/-/g, "");
    let mzipcode = f.mzipcode.value.trim();
    let maddr = f.maddr.value.trim();
    let maddrdetail = f.maddrdetail.value.trim();
    let memail = f.memail.value.trim();

    let regExpId = /^[a-zA-Z0-9]{4,12}$/;
    let regExpPw = /^[A-Za-z\d!?@#+]{8,16}$/;
    let regExpName = /^[가-힣a-zA-Z]{2,}$/;
    let regExpTel = /^01[016789]\d{7,8}$/;
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
        alert("전화번호를 올바르게 입력하세요.");
        f.mtel.focus();
        return false;
    }

    if (mzipcode === "" || maddr === "") {
        alert("주소 검색을 통해 주소를 입력하세요.");
        return false;
    }
  
    if (!regExpEmail.test(memail)) {
        alert("이메일을 입력해주세요.");
        f.memail.focus();
        return false;
    }
	document.member.submit();
}
</script>

</head>
<body>
   <form name="member" method="post" action="/member/join">
      <table border="1" width="280" align="center">
         <tr> 
            <td align="center">아이디 : <input type="text" name="mid"></td>
         </tr>
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
            <td align="center">성별 : <input type="radio" name="mgender" value="남"> 남
                    <input type="radio" name="mgender" value="여"> 여
            </td>
         </tr>
         <tr>   
            <td align="center">전화번호 : <input type="text" name="mtel"></td>
         </tr>
         <tr>
             <td align="center">
                 우편번호 :
              <input type="text" name="mzipcode" id="mzipcode" size="6" readonly>
                 <input type="button" value="주소검색" onclick="goPopup()">
             </td>
         </tr>
         <tr>
             <td align="center">
                 주소 :
                 <input type="text" name="maddr" id="maddr" readonly>
             </td>
         </tr>
         <tr>
             <td align="center">
                 상세주소 :
                 <input type="text" name="maddrdetail" id="maddrdetail" readonly>
             </td>
         </tr>
         <tr>   
            <td align="center">이메일 : <input type="text" name="memail"></td>
         </tr>
         <tr>
            <td align="center"><input type="button" value="회원가입" onclick="checkMember()"> <input type="reset" value="취소"></td>
         </tr>
      </table>      
   </form>
</body>
</html>
