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
    <title>SKHUBooks</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1 class="title"><b>대출</b></h1>
	<p>도서 대출 페이지 입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	<div class="site-content">
     <div class="hero">
       <div class="container">
         <a class="logo"><img src="/SKHUBooks/resources/bootstrap/images/logo2.png" alt="Brand California"></a>

         <h1 class="hero-title"><white>학생증을 태그하세요</white></h1>
         	<div class="subscribe-form" id="memberCheckForm">
				<div class="control">
					<i class="fa fa-search"></i>
					<input type="text" placeholder="학생증을 태그해주세요..." class="form-control" style=" height : 50px; padding-left: 50px" name="member_no" autofocus="autofocus" id="cardNo" maxlength="9">
			    	<button type="button" id="searchKey" class="btn btn-success" style="position: absolute;top: 5px;right: 5px;bottom: 5px;padding: 0 20px;">Search</button>
				</div>
			</div>
       </div> <!-- .container -->
     </div> <!-- .hero -->
     <br><br><br>
    </div>
    	<%@ include file="/WEB-INF/views/include/footer.jsp"%>	
    
</body>
<script>
$(document).ready(function(){
	$("#cardNo").keypress(function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			var member_no = $("#cardNo").val();
			var memberData = {"member_no" : member_no};
			if(member_no.length == 9){
				$.ajax({
					type : "POST",
					url : "/SKHUBooks/loan/idcheck",
					data : memberData,
					dataType : "json",
					beforeSend : function(xhr){
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(checkResult){
						if(checkResult == 0){
							location.href="/SKHUBooks/loan/noMember";
						}
						else if(checkResult ==1){
							location.href="/SKHUBooks/loan/bookCheck?member_no="+member_no;
						}
						else{
							alert("에러가 발생하였습니다.");
						}
					},
					error : function(error){
						alert("서버가 응답하지 않습니다.\n다시 시도해 주시기 바랍니다.");
					}
				});
			}
			else{
				alert("학번을 확인해 주세요.");
			}
		}else{
			
		}
	});
});
</script>
</html>