<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류 등록</title>
</head>
<body>
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
             <tr>
                <td>알코올<br>
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
                    <input type="file" name="uploadfile">
                </td>    
            </tr>
            <tr>
                <td>카테고리<br>
                    <input type="text" name="pcategory">
                </td>    
            </tr>
             <tr>
                <td>재고수<br>
                    <input type="text" name="pcount">
                </td>    
            </tr>
             <tr>
                <td>상세정보<br>
                    <input type="text" name="pdetail">
                </td>    
            </tr>
             <tr>
                <td>안주 추천<br>
                    <input type="text" name="ppairing">
                </td>    
            </tr>
            
            <tr>
                <td>
                    <div class="button-group">
                        <input type="button" value="주류등록" onclick="check()"> 
                        <input type="reset" value="등록취소">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>