<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세</title>
</head>
	<body>
	
		<h2>1:1 문의 상세</h2>
		
		<table border="1">
		    <tr>
		        <th>제목</th>
		        <td>${question.qtitle}</td>
		    </tr>
		    <tr>
		        <th>작성일</th>
		        <td>
		            <fmt:formatDate value="${question.qdate}" pattern="yyyy-MM-dd" />
		        </td>
		    </tr>
		    <tr>
		        <th>내용</th>
		        <td><pre>${question.qcontent}</pre></td>
		    </tr>
		</table>
		
		<br>
		
		<c:choose>
		  <c:when test="${reply != null}">
		      <h3>관리자 답변</h3>
		      <pre>${reply.rpcontent}</pre>
		      <p>답변일 : <fmt:formatDate value="${reply.rpdate}" pattern="yyyy-MM-dd"/></p>
		  </c:when>
	
		 <c:otherwise>
		      <c:if test="${loginUser != null && loginUser.mauth != null && fn:contains(fn:toUpperCase(loginUser.mauth), 'ADMIN')}">
		          <form action="/question/answer" method="post">
		              <textarea name="rpcontent" rows="5" cols="60" required></textarea>
		              <input type="hidden" name="qno" value="${question.qno}">
		              <button type="submit">답변 등록</button>
		          </form>
		      </c:if>
		
		      <c:if test="${loginUser == null || loginUser.mauth == null || !fn:contains(fn:toUpperCase(loginUser.mauth), 'ADMIN')}">
        			<p>답변 대기중입니다.</p>
    		  </c:if>
		 </c:otherwise>
		</c:choose>
		
		<br>
		
		<c:if test="${loginUser.mno == question.mno && reply == null}">
    		<button onclick="location.href='/question/update?qno=${question.qno}'">수정</button>
		</c:if>
		
		<button onclick="location.href='list'">목록</button>
	
	</body>
</html>