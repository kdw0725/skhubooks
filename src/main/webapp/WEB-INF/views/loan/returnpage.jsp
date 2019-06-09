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
<h1 class="title"><b>반납</b></h1>
	<p>도서 반납 페이지 입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<div class="site-content">
     <div class="hero">
       <div class="container">
         <a class="logo"><img src="/SKHUBooks/resources/bootstrap/images/logo2.png"></a>
         
         <h1 class="hero-title"><white>반납할 도서를 태그해주세요</white></h1>
         	<div class="subscribe-form">
				<div class="control">
					<i class="fa fa-search"></i>
					<input type="text" placeholder="도서를 태그해주세요..." class="form-control" style=" height : 50px; padding-left: 50px" name="book_no" autofocus="autofocus" id="bookNo">
			    	<button type="button" class="btn btn-success" style="position: absolute;top: 5px;right: 5px;bottom: 5px;padding: 0 20px;">Search</button>
				</div>
			</div>
       </div> <!-- .container -->
     </div> <!-- .hero -->
</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>	

</body>
<script>
$(document).ready(function(){
	$("#bookNo").keypress(function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			var book_no =  $("#bookNo").val();
			location.href="/SKHUBooks/loan/bookReturnDo?book_no="+book_no;
			alert("반납되었습니다.");
		}
	});
});	
</script>
</html>