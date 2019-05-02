<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="logInDo">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="member_pw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인">
	</form>
	<a href="/SKHUBooks/signIn">회원가입</a>
</body>
</html>