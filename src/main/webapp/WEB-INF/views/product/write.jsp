<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류 등록</title>
</head>
<body>
    <h2>주류 등록</h2>
    <form name="write" method="post" action="/product/write" enctype="multipart/form-data">
        <table>
            <tr>
                <td>주류<br>
                    <input type="text" name="pname">
                </td>
            </tr>
            <tr>
                <td>주류 가격<br>
                    <input type="text" name="pprice">
                </td>
            </tr>
            <tr>
                <td>알코올 도수<br>
                    <input type="text" name="palcohol">
                </td>    
            </tr>
            <tr>
                <td>용량<br>
                    <input type="text" name="psize">
                </td>    
            </tr>
            <tr>
                <td>이미지<br>
                    <input type="file" name="uploadfile1">
                </td>    
            </tr>
            <tr>
                <td>카테고리<br>
                    <select name="pcategory" required>
                        <option value="">선택</option>
                        <option value="소주/증류주">소주/증류주</option>
                        <option value="막걸리/탁주">막걸리/탁주</option>
                        <option value="청주/약주">청주/약주</option>
                        <option value="과실주">과실주</option>
                        <option value="기타우리술">기타 우리술</option>
                    </select>
                </td>    
            </tr>
            <tr>
                <td>재고수<br>
                    <input type="text" name="pcount">
                </td>    
            </tr>
            <tr>
                <td>상세정보<br>
                    <textarea name="pdetail" rows="4" cols="40"></textarea>
                </td>
            </tr>
            <tr>
                <td>추천 안주<br>
                    <textarea name="ppairing" rows="2" cols="40"></textarea>
                </td>
            </tr>
            <tr>
                <td>추천 안주 이미지<br>
                    <input type="file" name="uploadfile2">
                </td>
            </tr>
            <tr>
                <td>
                    <div class="button-group">
                        <input type="submit" value="주류등록"> 
                        <input type="reset" value="등록취소">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
