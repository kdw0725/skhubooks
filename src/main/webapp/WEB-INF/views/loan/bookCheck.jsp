<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${toDay }" pattern="yyyy-MM-dd" var="toDay"/>

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
         	<form action="bookLoanDo" class="subscribe-form">
				<div class="control">
					<i class="fa fa-search"></i>
					<input type="text" placeholder="도서를 태그해주세요..." class="form-control" style=" height : 50px; padding-left: 50px" name="book_no" autofocus="autofocus">
					<input type="hidden" value="${list.member_no }" name="member_no">
			    	<button type="button" class="btn btn-success" style="position: absolute;top: 5px;right: 5px;bottom: 5px;padding: 0 20px;">Search</button>
				</div>
			</form>
       </div> <!-- .container -->
     </div> <!-- .hero -->
     <br><br><br>
     <div class="container">
     	<h2>회원 정보</h2>
        <table class="table table-striped">
          <thead>
            <tr>
              <th style="text-align: center;">학번</th>
              <th style="text-align: center;">이름</th>
              <th style="text-align: center;">소속</th>
              <th style="text-align: center;">학년</th>
              <th style="text-align: center;">아이디</th>
              <th style="text-align: center;">연락처</th>
            </tr>
          </thead>
          <tbody>
            <tr style="text-align: center;">
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
        			<th style="text-align: center;">사진</th>
        			<th style="text-align: center;">도서명</th>
        			<th style="text-align: center;">저자</th>
        			<th style="text-align: center;">출판사</th>
        			<th style="text-align: center;">반납 예정일</th>
        		</tr>
        	</thead>
        	<tbody>
        		<c:forEach var="lentBook" varStatus="i" items="${lentBook }">
	        		<tr style="text-align: center;">
	        			<td><img class="file_img" alt="" src="/SKHUBooks/resources/bootstrap/images/upload/${lentBook.FILE_NAME }"></td>
	        			<td style="vertical-align: middle;">${lentBook.BOOK_NAME }</td>
	        			<td style="vertical-align: middle;">${lentBook.BOOK_AUTHOR }</td>
	        			<td style="vertical-align: middle;">${lentBook.BOOK_PUBLISHER }</td>
	        			<td style="vertical-align: middle;">
	        				<c:if test="${toDay >  lentBook.BOOK_RETURNDATE}">
	        					${lentBook.BOOK_RETURNDATE }<br>
	        					<red>연체료 : 1일 500원</red>
	        					
		        			</c:if>
		        			<c:if test="${toDay <  lentBook.BOOK_RETURNDATE}">
		        				${lentBook.BOOK_RETURNDATE } 
		        			</c:if>
		        			<c:if test="${toDay ==  lentBook.BOOK_RETURNDATE}">
		        				${lentBook.BOOK_RETURNDATE }<br>
		        				<blue>반납 예정일입니다.</blue>
		        			</c:if>
		        		</td>
	        		</tr>
        		</c:forEach>
        	</tbody>
        </table>
      </div>
    </div>
</body>
<script>

</script>
</html>