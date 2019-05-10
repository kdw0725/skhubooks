<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logIn</title>
</head>
<body>

	<form action="/SKHUBooks/login" method="post">
		<p>ID</p>
		<input type="text" name="member_id">
		<p>Password</p> 
		<input type="password" name="member_pw">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
		<br>
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		    <font color="red">
		        <p>아이디, 비밀번호를 확인하세요</p>
		        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
		    </font>
		</c:if>
		<p>Remember Me
			<input type="checkbox" name="RememberMe" name="_spring_security_remember_me">
		</p>
		<input type="submit" value="logIn"><br>
		
		<a href="/SKHUBooks/member/signIn">회원가입</a>
	</form>
</body>
</html>