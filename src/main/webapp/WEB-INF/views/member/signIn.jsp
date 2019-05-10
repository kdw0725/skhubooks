<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="signInDo ">
		<p>이름</p>
		<input type="text" name="member_name">
		<p>아이디</p>
		<input type="text" name="member_id">
<!-- 		<input type="button" onclick="distinct(this.form)" value="수정"> -->
		
		<p>비밀번호</p>
		<input type="password" name="member_pw">
		<p>비밀번호 확인</p>
		<input type="password" name="member_pw_check">
		<p>생년월일</p>
		<input type="text" name="member_birth" placeholder="ex)950725">
		<p>전화번호</p>
		<input type="text" name="member_pnum" placeholder="ex)01083356191"><br><br>
		<input type="submit" value="회원가입" >
		<input type="reset" value="재작성">
	</form>
</body>
<script>

</script>
</html>