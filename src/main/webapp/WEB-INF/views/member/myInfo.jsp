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
    <title>SKHUBooks</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1 class="title"><b>내 정보 확인</b></h1>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<div class="container">
	<h3><b>회원 정보</b></h3><br>
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
              <td>${member.member_no }</td>
              <td>${member.member_name }</td>
              <td>${member.member_department }</td>
              <td>${member.member_grade }</td>
              <td>${id }</td>
              <td>0${member.member_pnum }</td>
            </tr>
          </tbody>
        </table>
        <br><br>
        <h3><b>대여 목록</b></h3><br>
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

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>