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
<title>QnA</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1 class="title"><b>대출</b></h1>
	<p>도서 대출 페이지 입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	<br><br><br><br>
	<div class="site-content">
     <div class="hero">
       <div class="container">
         <a class="logo"><img src="/SKHUBooks/resources/bootstrap/images/logo2.png"></a>

         <h1 class="hero-title"><white>도서를 태그해주세요</white></h1>
         	<form action="loan" class="subscribe-form">
				<div class="control">
					<i class="fa fa-search"></i>
					<input type="text" placeholder="도서를 태그해주세요..." class="form-control" style=" height : 50px; padding-left: 50px" name="member_no" autofocus="autofocus">
			    	<button type="button" class="btn btn-success" style="position: absolute;top: 5px;right: 5px;bottom: 5px;padding: 0 20px;">Search</button>
				</div>
			</form>
       </div> <!-- .container -->
     </div> <!-- .hero -->
     <br><br><br>
     <div class="container">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>학번</th>
              <th>이름</th>
              <th>소속</th>
              <td>학년</td>
              <th>아이디</th>
              <th>연락처</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>${list.member_no }</td>
              <td>${list.member_name }</td>
              <td>${list.member_department }</td>
              <td>${list.member_grade }</td>
              <td>${id }</td>
              <td>0${list.member_pnum }</td>
            </tr>
          </tbody>
        </table>
        <h2>대여 목록</h2>
        <table class="table table-striped">
        	<thead>
        		<tr>
        			<th>사진</th>
        			<th>도서명</th>
        			<th>저자</th>
        			<th>출판사</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>사아지인</td>
        			<td>도서</td>
        			<td>저자</td>
        			<td>출판사</td>
        		</tr>
        	</tbody>
        </table>
      </div>
    </div>
</body>
</html>