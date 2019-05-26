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
		<ul class="paging">
			<c:if test="${pageMaker.prev }">
				<li class="pagingLeftBtn">
					<a href='<c:url value="/board/boardList?page=${pageMaker.startPage-1 }"/>'></a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<c:choose>
					<c:when test="${idx==pageMaker.cri.page }">
						<li class="active">
	        				<a href='<c:url value="/board/boardList?page=${idx }"/>'>${idx }</a>
	        			</li>
					</c:when>
					<c:otherwise>
						<li>
	        				<a href='<c:url value="/board/boardList?page=${idx }"/>'>${idx }</a>
						</li>
					</c:otherwise>
				</c:choose>
    		</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
    			<li class="pagingRightBtn">
        			<a href='<c:url value="/board/boardList?page=${pageMaker.endPage+1 }"/>'></a>
    			</li>
    		</c:if>
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