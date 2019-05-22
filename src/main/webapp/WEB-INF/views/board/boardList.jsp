<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>
<h1 class="title"><b>자유 게시판</b></h1>
<p>skhubooks 자유게시판 입니다.</p>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<br><br><br><br>
<div class="container">
	<table class="table table-striped" style="text-align: center">
		<tr>
			<th>NO</th>
			<th style="text-align: center; width : 40%;">제목</th>
			<th style="text-align: center">작성자</th>
			<th style="text-align: center">작성일</th>
		</tr>
		
				
		 <c:forEach var="list" varStatus="i" items="${list}">
		 <tr>
		 		<th scope="row">${list.no }</th>
				<td><a href="boardDetail?board_no=${list.board_no}">${list.board_title }</a></td>
				<td>${list.board_writer }</td>
				<td>${list.board_insertdate }</td>
		</tr>
		</c:forEach>
		
	</table>
	
	<input class="btn btn-default pull-rigth" type="button" onclick="boardInsert()" value="글쓰기">
	
	<div class="text-center">
     <ul class="pagination">
       <li><a href="#">1</a></li>
       <li><a href="#">2</a></li>
       <li><a href="#">3</a></li>
       <li><a href="#">4</a></li>
       <li><a href="#">5</a></li>
     </ul>
   </div>
</div>
</body>

<script>
function boardInsert(){
	location.href="/SKHUBooks/board/boardInsert";
}
</script>
</html>