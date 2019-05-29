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
	<p>SKHUBooks 자료 검색 사이트 입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	<br><br>
	<div class="container">
		<table class="table table-striped" style="text-align: center">
		<caption>
			<a><b>"${keyword}"</b></a>에 대한 검색 결과입니다.<br><br>
		</caption>
			<tr>
				<th style="text-align: center; width : 20%;">사진</th>
				<th style="text-align: center; width : 40%;">도서명</th>
				<th style="text-align: center;" >저자</th>
				<th style="text-align: center">출판사</th>
				<th style="text-align: center">대출 가능</th>
			</tr>
			
			<c:forEach var="list" varStatus="i" items="${list}">
				<tr onclick="bookDetail(${list.BOOK_NO})">
					<th style="height : 100px; width : 20%;' vertical-align: middle; text-align: center;">
						<img class="file_img" alt="등록된 이미지가 없습니다." src="/SKHUBooks/resources/bootstrap/images/upload/${list.FILE_NAME }">
					</th>
					<td style="vertical-align : middle;">${list.BOOK_NAME }</td>
					<td style="vertical-align : middle;">${list.BOOK_AUTHOR }</td>
					<td style="vertical-align : middle;">${list.BOOK_PUBLISHER }</td>
					<td style="vertical-align : middle;">
						<c:if test="${list.BOOK_LOAN }">
							<blue>대출 가능</blue>
						</c:if>
						<c:if test="${!list.BOOK_LOAN }">
							<red>대출 불가</red>
						</c:if>
					</td>
				</tr>			
			</c:forEach>
		</table>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<input class="btn btn-default pull-rigth" type="button" onclick="bookInsert()" value="신규등록">
		</sec:authorize>
		<div class="text-center">
			<ul class="paging">
				<c:if test="${pageMaker.prev }">
					<li class="pagingLeftBtn">
						<a href='<c:url value="/book/bookList?page=${pageMaker.startPage-1 }"/>'></a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx==pageMaker.cri.page }">
							<li class="active">
								<a href='<c:url value="/book/bookList?page=${idx }"/>'>${idx }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href='<c:url value="/book/bookList?page=${idx }"/>'>${idx }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="pagingRightBtn">
	        			<a href='<c:url value="/book/bookList?page=${pageMaker.endPage+1 }"/>'></a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
<script>
function bookInsert(){
	location.href="/SKHUBooks/book/bookInsert";
}

function bookDetail(book_no){
	location.href = "/SKHUBooks/book/bookDetail?book_no="+book_no;
}
</script>
</html>