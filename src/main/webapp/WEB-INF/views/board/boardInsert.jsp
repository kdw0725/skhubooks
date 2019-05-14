<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="boardInsertDo">
		<table border =1px>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_writer" readonly="readonly" value="<sec:authentication property="principal.username"/>"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea name="board_content" id="editor" style="width: 1100px; height: 205px;" required="required"></textarea></td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<input type="text" name="file">
					<input type="button" value="첨부">
				</td>
			</tr>
			
		</table>
		<input type="submit">
		<input type="reset">
	</form>

</body>
</html>