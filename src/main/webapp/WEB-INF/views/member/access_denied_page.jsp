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
<h6>권한이 없어 접근이 불가합니다.<br>관리자에게 문의하세요.</h6>
<a href="/SKHUBooks/">홈으로</a>
</body>
</html>