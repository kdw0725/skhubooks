<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>	

<html>
<head>
<meta charset="UTF-8">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>회원가입</title>
</head>
<body>
<h1 class="title"><b>회원가입</b></h1>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<article class="container">
        <div class="page-header">
            <div class="col-md-6 col-md-offset-3">
              <br></br>

            <br></br>
            </div>
        </div>
        <div class="col-sm-6 col-md-offset-3">
            <form role="form" action = "signInDo">
                <div class="form-group">
                    <label for="inputName">성명</label>
                    <input type="text" name = "member_name" class="form-control" id="inputName" placeholder="이름을 입력해 주세요">
                </div>
                <div class="form-group">
                    <label for="InputEmail">아이디</label>
                    <input type="text" name="member_id" class="form-control" id="InputId" placeholder="아이디를 입력해주세요"><input type="button" value="중복확인" class="pull-right" id="pull-right">
                </div>
                <div class="form-group">
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" name = "member_pw" class="form-control" id="inputPassword" placeholder="비밀번호를 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="inputPasswordCheck">비밀번호 확인</label>
                    <input type="password" name="member_pw_check" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    <div class="form-group">
                        <label for="inputtelBIRTH">생년월일</label>
                        <input type="tel" name="member_birth" class="form-control" id="inputtelBIRTH" placeholder="생년월일를 6자리로 입력해 주세요">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputMobile">휴대폰 번호</label>
                    <input type="tel" name="member_pnum" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요">
                </div>


                <div class="form-group">
                <label>약관 동의</label>
                <div data-toggle="buttons">
                <label class="btn btn-primary active">
                <span class="fa fa-check"></span>
                <input id="agree" type="checkbox" autocomplete="off" checked>
                </label>
                <a href="#">이용약관</a>에 동의합니다.
                </div>
                </div>

                <div class="form-group text-center">
                    <button type="submit" id="join-submit" class="btn btn-primary">
                      	  회원가입<i class="fa fa-check spaceLeft"></i>
                    </button>
                    <button type="button" class="btn btn-warning" onclick="gotoHome()">
                       	 가입취소<i class="fa fa-times spaceLeft"></i>
                    </button>
                </div>
            </form>
        </div>

    </article>
	

</body>

<script>
$(document).ready(function(){
	$("#pull-right").unbind("click").click(function(e){
		e.preventDefault();
		fn_userIdCheck();
	});
});
function gotoHome(){
	if(confirm("취소하시겠습니까?")){
		location.href="/SKHUBooks/";
	}
}

function fn_userIdCheck(){
	var member_id = $("#InputId").val();
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