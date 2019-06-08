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
<title>도서 정보</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1 class="title"><b>도서 정보</b></h1>
	<p>도서 상세 정보 페이지입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	<br><br><br><br>
	<div class="container">
		<table class="table" style="text-align: center; vertical-align: middle;">
			<tbody class="detail_body">
				<tr>
					<th style="text-align: center; width: 40%;" rowspan="5">
						<img class="book_image" alt="등록된 이미지가 없습니다." src="/SKHUBooks/resources/bootstrap/images/upload/${list.FILE_NAME }">
					</th>
					<th style="vertical-align : middle;">도서명</th>
					<td style="vertical-align : middle;">${list.BOOK_NAME }</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">저자</th>
					<td style="vertical-align : middle;">${list.BOOK_AUTHOR }</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">출판사</th>
					<td style="vertical-align : middle;">${list.BOOK_PUBLISHER }</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">상태</th>
					<td style="vertical-align : middle;">
						<c:if test="${list.MEMBER_NO == null}">
							<blue style="margin-left: 16%;">대출 가능</blue>
							<button class="btn btn-default pull-right" onclick="book_reserve(${list.BOOK_NO})">예약하기</button>
							<sec:authentication property='principal.username' var="logInID"/>
							<input type="hidden" value="${logInID }" id="logInID">
						</c:if>
						<c:if test="${list.MEMBER_NO != null}">
							<red>대출 불가</red>
						</c:if>
					</td>
				</tr>
				<tr>
					<th style="vertical-align : middle;">등록일</th>
					<td style="vertical-align : middle;">${list.BOOK_INSERTDATE }</td>
				</tr>
				<tr>
					<th colspan="3">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<input type="button" class="btn btn-default pull-left" value="수정" onclick="bookUpdate(${list.BOOK_NO })">
							<input type="button" class="btn btn-default pull-left" value="삭제" onclick="bookDelete('${list.BOOK_NO }','${list.FILE_NAME }')">
						</sec:authorize>
						<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
					</th>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script>
function gotoHome(){
	history.back();
}

function bookDelete(book_no, file_name){
	if(confirm("삭제하시겠습니까?")){
		location.href="/SKHUBooks/book/bookDelete?book_no="+book_no+"&file_name="+file_name;
	}
}

function bookUpdate(book_no){
	location.href="/SKHUBooks/book/bookUpdate?book_no="+book_no;
}
function book_reserve(book_no){
	if(confirm("도서를 예약하시겠습니까?")){
		var bookData = {"book_no" : book_no};
		$.ajax({
			type : "POST",
			url : "/SKHUBooks/book/bookReserve",
			data : bookData,
			dataType : "json",
			beforeSend : function(xhr){
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(checkResult){
				if(checkResult == 0){
					var member_id = $("#logInID").val()
					location.href="/SKHUBooks/book/bookReservation?book_no="+book_no+"&member_id="+member_id;
				}
				else{
					alert("이미 예약이 되어있는 책입니다.");
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