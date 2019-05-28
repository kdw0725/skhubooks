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
<title>신규 등록</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1 class="title"><b>신규 등록</b></h1>
	<p>신규 도서 등록 페이지 입니다.</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	<br><br><br><br>
	<div class="container">
		<form action="bookInsertDo" encType="multipart/form-data" method="post">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">도서명</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="도서의 제목을 입력하세요." name="book_name">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">저자</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="저자를 입력하세요." name="book_author">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">출판사</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="출판사를 입려하세요" name="book_publisher">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">도서 이미지</th>	
						<td>
							<div class="filebox">
								<label for="ex_file" class="btn btn-default">파일 선택</label>
								<input class="form-control" disabled="disabled" placeholder="선택된 파일 없음">
								<input style="width:100%;" type="file" class="upload-hidden" id="ex_file" name="book_img">
							</div>
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">도서 번호</th>
						<td>
							<input class="form-control" type="text" required="required" placeholder="도서 번호를 입력하세요" name="book_no">
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-default pull-left">
							<input type="reset" class="btn btn-default pull-left">
							<input type="button" class="btn btn-default pull-right" value="목록" onclick="gotoList()">
						</td>
					</tr>
					
								
				</tbody>
			</table>
		</form>
	</div>
</body>
<script>
$(document).ready(function(){ 
	var fileTarget = $('.filebox .upload-hidden'); 
	
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		}
		else{
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
		}
		$(this).siblings('.filebox .form-control').val(filename); 
	});
});
	
function gotoList(){
	location.href = "/SKHUBooks/book/bookList"
}
</script>
</html>