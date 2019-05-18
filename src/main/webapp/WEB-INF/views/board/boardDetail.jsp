<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="title"><b>자유 게시판</b></h1>
<p>skhubooks 자유게시판 입니다.</p>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<br><br>
	<div class="container">
		<table border = 1px class="table table-bordered">
			<tbody>
				<tr>
					<th style=" width: 100px; text-align: center;vertical-align: middle;">제&nbsp;&nbsp;목</th>
					<td class="form-control">${list.board_title }</td>
				</tr>
				<tr>
					<th style=" width: 100px; text-align: center;vertical-align: middle;">작성자</th>
					<td class="form-control">${list.board_writer }</td>
				</tr>
				<tr>
					<th style=" width: 100px; text-align: center;vertical-align: middle;">내&nbsp;&nbsp;용</th>
					<td class="form-control" style="height: 205px;">${list.board_content }</td>
				</tr>
				<tr>
					<td colspan = "2">
						<input type="button" class="btn btn-default pull-rigth" onclick="boardUpdate(${list.board_no })" value="수정">
						<input type="button" class="btn btn-default pull-rigth" onclick="boardDelete(${list.board_no })" value="삭제">
						<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
					</td>
				</tr>
			</table>
		</tbody>
	</div>

</body>

<script>
function boardUpdate(board_no){
	location.href="/SKHUBooks/board/boardUpdate?board_no="+board_no;
}

function boardDelete(board_no){
	if(confirm("삭제하시겠습니까?")){
	location.href="/SKHUBooks/board/boardDelete?board_no="+board_no;
	alert("삭제 되었습니다.")
	}
	return false;
}

function gotoHome(){
	location.href = "/SKHUBooks/board/boardList";
}
</script>
</html>