<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>	

<html>
<head>
<meta charset="UTF-8">
<title>access_denied_page</title>
</head>
<body>
<h1 class="title"><b>경고</b></h1>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<!-- <h6>권한이 없어 접근이 불가합니다.<br>관리자에게 문의하세요.</h6> -->
<!-- <a href="/SKHUBooks/">홈으로</a> -->
<div class="container"  style="text-align: center;">
	<h2>권한이 없어 접근이 블가합니다.</h2>
	<h2>관리자에게 문의하세요.</h2>
	<a href="/SKHUBooks/" class="btn btn-error" >RETURN TO THE HOMEPAGE</a>
</div>
</body>
</html>