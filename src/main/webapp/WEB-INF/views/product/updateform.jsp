<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 - ${update.pname}</title>
</head>
<body>
    <h2>주류 수정</h2>
    <form name="update" method="post" action="/product/update" enctype="multipart/form-data">
        <input type="hidden" name="pno" value="${update.pno}">

        <table>
            <tr>
                <td>주류명<br>
                    <input type="text" name="pname" value="${update.pname}">
                </td>
            </tr>
            <tr>
                <td>주류 가격<br>
                    <input type="text" name="pprice" value="${update.pprice}">
                </td>
            </tr>
            <tr>
                <td>알코올 도수<br>
                    <input type="text" name="palcohol" value="${update.palcohol}">
                </td>
            </tr>
            <tr>
                <td>용량<br>
                    <input type="text" name="psize" value="${update.psize}">
                </td>
            </tr>
            <tr>
                <td>이미지<br>
                    <c:if test="${not empty update.pimage}">
                        <img src="/images/${update.pimage}" width="100" alt="기존 이미지"><br>
                    </c:if>
                    새 이미지 업로드: <input type="file" name="uploadfile1">
                </td>
            </tr>
            <tr>
                <td>카테고리<br>
                    <select name="pcategory">
                        <option value="">선택</option>
                        <option value="소주/증류주" <c:if test="${update.pcategory == '소주/증류주'}">selected</c:if>>소주/증류주</option>
                        <option value="막걸리/탁주" <c:if test="${update.pcategory == '막걸리/탁주'}">selected</c:if>>막걸리/탁주</option>
                        <option value="청주/약주" <c:if test="${update.pcategory == '청주/약주'}">selected</c:if>>청주/약주</option>
                        <option value="과실주" <c:if test="${update.pcategory == '과실주'}">selected</c:if>>과실주</option>
                        <option value="기타우리술" <c:if test="${update.pcategory == '기타우리술'}">selected</c:if>>기타 우리술</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>재고수<br>
                    <input type="text" name="pcount" value="${update.pcount}">
                </td>
            </tr>
            <tr>
                <td>상세정보<br>
                    <textarea name="pdetail" rows="4" cols="40">${update.pdetail}</textarea>
                </td>
            </tr>
            <tr>
                <td>추천 안주<br>
                    <textarea name="ppairing" rows="2" cols="40">${update.ppairing}</textarea>
                </td>
            </tr>
            <tr>
                <td>추천 안주 이미지<br>
                    <c:if test="${not empty update.ppairingImage}">
                        <img src="/images/${update.ppairingImage}" width="100" alt="기존 이미지"><br>
                    </c:if>
                    새 이미지 업로드: <input type="file" name="uploadfile2">
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
</body>
</html>
