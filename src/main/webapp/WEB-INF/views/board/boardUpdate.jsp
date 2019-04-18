<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="boardUpdateDo">
	<input type="hidden" value="${list.board_no }" name="board_no">
		<table border="1px">
			<tr>
				<td>제목</td>
				<td><input type="text" value="${list.board_title }" name="board_title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" value="${list.board_writer }" readonly="readonly" name="board_writer"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="board_content" id="editor" style="width: 1100px; height: 205px;" required="required">${list.board_content }</textarea>
				</td>
			</tr>
		
		</table>
		<input type="submit" value="수정 완료">
		<input type="button" value="수정 취소" onclick="cancelUpdate(${list.board_no})">
	</form>

</body>
<script>
function cancelUpdate(board_no){
	if(confirm("수정을 취소하시겠습니까?")){
		location.href="/SKHUBooks/boardDetail?board_no="+board_no;
	}
	return false;
}
</script>
</html>