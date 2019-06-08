<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>도서 대출</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1 class="title"><b>대출</b></h1>
	<p>도서 대출 페이지 입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	<br><br>
	<div class="container"  style="text-align: center;">
		<h2>성공회대학교 학생이 아닙니다.</h2>
		<h2>관리자에게 문의하세요.</h2>
	<a href="/SKHUBooks/" class="btn btn-error" >RETURN TO THE HOMEPAGE</a>
</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>	

</body>
</html>