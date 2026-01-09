<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 - ${update.pname}</title>

<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f7f3ef;
    color: #4a3420;
    margin: 20px auto;
    max-width: 1200px;
    padding-bottom: 40px;
}

.form-container {
    max-width: 720px;
    margin: 0 auto;
}

h2 {
    text-align: center;
    color: #6b4b28;
    margin: 0 0 15px;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 12px;
    background: #fff8f2;
    box-shadow: 0 2px 6px rgba(125, 60, 34, 0.1);
    border-radius: 12px;
    padding: 10px;
}

td {
    padding: 14px 16px;
    font-size: 15px;
}

input[type="text"], select, textarea, input[type="file"] {
    width: 100%;
    margin-top: 8px;
    padding: 10px 12px;
    border-radius: 10px;
    border: 1px solid #d7b894;
    font-size: 14px;
    box-sizing: border-box;
}

input:focus, select:focus, textarea:focus {
    outline: none;
    border-color: #b6895c;
    box-shadow: 0 0 0 3px rgba(182, 137, 92, 0.2);
}

textarea {
    resize: vertical;
    min-height: 90px;
}

img {
    margin-top: 8px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(125, 60, 34, 0.25);
}

.button-group {
    display: flex;
    justify-content: center;
    gap: 10px;
    flex-wrap: wrap;
}

.button-group input, .button-group a {
    width: 140px;
    padding: 12px 0;
    border: none;
    border-radius: 30px;
    font-weight: 700;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    box-shadow: 0 4px 10px rgba(125, 60, 34, 0.25);
    transition: 0.2s;
}

.button-group input[type="submit"] {
    background: #b6895c;
    color: white;
}

.button-group input[type="submit"]:hover {
    background: #a86932;
    transform: translateY(-2px);
}

.button-group input[type="reset"] {
    background: #e6c9a1;
    color: #4a3420;
}

.button-group input[type="reset"]:hover {
    background: #d7b894;
    transform: translateY(-2px);
}

.button-group a {
    background: #7d5430;
    color: white;
}

.button-group a:hover {
    background: #6b4425;
    transform: translateY(-2px);
}
</style>
</head>

<body>

<div class="form-container">
    <h2>주류 수정</h2>

    <form name="update" method="post" action="/product/update" enctype="multipart/form-data">
        <input type="hidden" name="pno" value="${update.pno}">

        <table>
            <tr><td>주류명 <input type="text" name="pname" value="${update.pname}"></td></tr>
            <tr><td>주류 가격 <input type="text" name="pprice" value="${update.pprice}"></td></tr>
            <tr><td>알코올 도수 <input type="text" name="palcohol" value="${update.palcohol}"></td></tr>
            <tr><td>용량 <input type="text" name="psize" value="${update.psize}"></td></tr>

            <tr>
                <td>이미지
                    <c:if test="${not empty update.pimage}">
                        <img src="/images/${update.pimage}" width="120">
                    </c:if>
                    <input type="file" name="uploadfile1">
                </td>
            </tr>

            <tr>
                <td>카테고리
                    <select name="pcategory">
                        <option value="">선택</option>
                        <option value="소주/증류주" ${update.pcategory == '소주/증류주' ? 'selected' : ''}>소주/증류주</option>
                        <option value="막걸리/탁주" ${update.pcategory == '막걸리/탁주' ? 'selected' : ''}>막걸리/탁주</option>
                        <option value="청주/약주" ${update.pcategory == '청주/약주' ? 'selected' : ''}>청주/약주</option>
                        <option value="과실주" ${update.pcategory == '과실주' ? 'selected' : ''}>과실주</option>
                        <option value="기타우리술" ${update.pcategory == '기타우리술' ? 'selected' : ''}>기타 우리술</option>
                    </select>
                </td>
            </tr>

            <tr><td>재고수 <input type="text" name="pcount" value="${update.pcount}"></td></tr>
            <tr><td>상세정보 <textarea name="pdetail">${update.pdetail}</textarea></td></tr>
            <tr><td>추천 안주 <textarea name="ppairing">${update.ppairing}</textarea></td></tr>

            <tr>
                <td>추천 안주 이미지
                    <c:if test="${not empty update.ppairingImage}">
                        <img src="/images/${update.ppairingImage}" width="120">
                    </c:if>
                    <input type="file" name="uploadfile2">
                </td>
            </tr>

            <tr>
                <td>
                    <div class="button-group">
                        <input type="submit" value="수정하기">
                        <input type="reset" value="취소">
                        <a href="/product/detail?pno=${update.pno}">상세보기</a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
