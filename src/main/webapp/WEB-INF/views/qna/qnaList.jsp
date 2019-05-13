<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaList</title>
</head>
<body>

	<form action="qnaInsert">
		<textarea name="qna_content" id="editor" style="width: 1100px; height: 205px;" required="required"></textarea>
		<br>
		<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">
		<input type="submit" value="제출">
		<input type="reset" value="취소">
	</form>

	<table border=1px>
		<c:forEach var="list" varStatus="i" items="${list}">	
			<tr>
				<td>${list.qna_writer }</td>
			</tr>
			<tr>
				<td>${list.qna_content }</td>
			</tr>
			<tr>
				<td>${list.qna_comment }</td>
			</tr>
			<tr>
				<td>${list.qna_insertdate }</td>
			</tr>
	</c:forEach>
	</table>
</body>
</html>