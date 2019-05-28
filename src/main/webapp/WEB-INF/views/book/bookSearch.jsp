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
<title>자료 검색</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<h1 class="title"><b>자료 검색</b></h1>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<!-- 	<br><br><br><br> -->
	<div class="site-content">
		<div class="hero">
			<div class="container">
				<a class="logo"><img alt="Logo" src="/SKHUBooks/resources/bootstrap/images/logo2.png"></a>
				<h1 class="hero-title"><white>도서를 검색하세요</white></h1>
				
				<form action="bookList" class="subscribe-form">
					<div class="control">
						<i class="fa fa-search"></i>
						<input type="text" placeholder="Search for the book..." class="form-control" style=" height : 50px; padding-left: 50px" name="keyword">
           				<input type="submit" value="Search" class="btn btn-success">
					</div>
				</form>
			</div>
		</div>
		<section id="services"> <!-- style="background: #f5f0c5;" -->
          <div class="container">
              <div class="row">
                <br/><br/>
                    <h2><strong>이달의 도서</strong></h2>
                  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                              <img src="images/home/JAVA Programming.png" alt="">
                          <p><h4><p>명품 JAVA Programming</p></h4></p>
                  </div>
                  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                              <img src="images/home/best2.png" alt="">
                          <p><h4><p>여행의 이유</p></h4></p>
                  </div>
                  <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                              <img src="images/home/best3.png" alt="">
                          <p><h4><p>공부머리 독서법</p></h4></p>
                  </div>
              </div>
          </div>
      </section>
	</div>
</body>
</html>