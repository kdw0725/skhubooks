<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border = 1px>
		<tr>
			<td>제목</td>
			<td>${list.board_title }</td>			
		</tr>
		<tr>
			<td>작성자</td>
			<td>${list.board_writer }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="board_content" id="editor" style="width: 1100px; height: 205px;" required="required" readonly="readonly">${list.board_content }</textarea>
			</td>
		</tr>
		
	</table>


</body>
</html>