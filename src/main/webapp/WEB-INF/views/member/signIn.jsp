<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>회원가입</title>
</head>
<body>
	<form action="signInDo ">
		<p>이름</p>
		<input type="text" name="member_name">
		<p>아이디</p>
		<input type="text" name="member_id" id="member_id">
		<button type="button" class="idCheck" id="idCheck">중복 확인</button>
		<span class="msg">아이디를 확인해주세요.</span>
		<p>비밀번호</p>
		<input type="password" name="member_pw">
		<p>비밀번호 확인</p>
		<input type="password" name="member_pw_check">
		<p>생년월일</p>
		<input type="text" name="member_birth" placeholder="ex)950725">
		<p>전화번호</p>
		<input type="tel" name="member_pnum" placeholder="ex)01083356191"><br><br>
		<input type="submit" value="회원가입" >
		<input type="reset" value="재작성">
	</form>
	

</body>

<script>
$(document).ready(function(){
	$("#idCheck").unbind("click").click(function(e){
		e.preventDefault();
		fn_userIdCheck();
	});
});

function fn_userIdCheck(){
	var member_id = $("#member_id").val();
	var memberData = {"member_id" : member_id};
	
	if(member_id.length < 1){
		alert("아이디를 입력해주시기 바랍니다.");
	}
	else{
		$.ajax({
			type : "POST",
			url : "/SKHUBooks/member/checkMemberID",
			data : memberData,
			dataType : "json",
			beforeSend : function(xhr){
				//데이터 전송 전에 헤더에 csrf 값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(checkResult){
				if(checkResult == 0){
					alert("사용 가능한 아이디 입니다.")
				}
				else if(checkResult == 1){
					alert("이미 존재하는 아이디 입니다.\n다른 아이디를 사용해 주세요.")
				}
				else{
					alert("에러가 발생하였습니다.")
				}
			},
			error : function(error){
				alert("서버가 응답하지 않습니다.\n다시 시도해 주시기 바랍니다.");
			}
			
		});
	}
}
</script>
</html>