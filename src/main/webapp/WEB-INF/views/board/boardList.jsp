<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>


<table>
		<tr>
			<th>NO</th>
			<th style="text-align: center">제목</th>
			<th>작성자</th>
			<th>작성일</th>
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





</body>
</html>