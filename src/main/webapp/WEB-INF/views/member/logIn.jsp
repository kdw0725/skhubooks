<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="/SKHUBooks/resources/bootstrap/css/login.min.css">
<meta charset="UTF-8">
<title>logIn</title>
</head>
<body>
	<div class="form">
		<form action="/SKHUBooks/login" method="post" class="login-form">
			<input type="text" name="member_id" placeholder="username" class="textarea">
			<input type="password" name="member_pw" placeholder="password" class="textarea">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<br>
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			    <font color="red">
			        <p>아이디, 비밀번호를 확인하세요</p>
			        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
			    </font>
			</c:if>
			<div class="form-group">
      	  		<input type="checkbox" name="_spring_security_remember_me" value="1" class="pull-left" />　
			</div>
     		<div class="form-group">  로그인 저장</div>
			<input type="submit" value="logIn" class="submitBtn"><br>
			<p class="message">계정이 없으신가요?<a href="/SKHUBooks/member/signIn">회원가입</a></p>
		</form>
	</div>
</body>
</html>