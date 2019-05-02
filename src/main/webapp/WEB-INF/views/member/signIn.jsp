<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="signInDo ">
		<table border=1px>
			<tr>
				<td>이름</td>
				<td><input type="text" name="member_name"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="member_pw"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="member_birth" placeholder="ex)950725"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="member_pnum" placeholder="ex)01083356191"></td>
			</tr>
		</table>
		<input type="submit" value="회원가입">
		<input type="reset" value="재작성">
	</form>
</body>
</html>