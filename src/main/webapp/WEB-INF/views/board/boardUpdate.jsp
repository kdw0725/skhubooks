<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		<form action="boardUpdateDo" encType="multiplart/form-data">
		<input type="hidden" value="${list.board_no }" name="board_no">
			<table class=" table table-bordered">
				<tbody>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">제목</th>
						<td>
							<input type="text" value="${list.board_title }" class="form-control" name="board_title" placeholder="제목을 입력하세요." required="required">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">작성자</th>
						<td class="form-control">
							<sec:authentication property="principal.username"/>
							<input class="form-control" type="hidden" name="board_writer" readonly="readonly" value="<sec:authentication property="principal.username"/>">
						</td>
					</tr>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">내용</th>
						<td>
							<textarea class="form-control" name="board_content" id="editor" style="height: 205px;" required="required">${list.board_content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-default pull-rigth" value="수정 완료">
							<input type="button" class="btn btn-default pull-rigth" value="수정 취소" onclick="cancelUpdate(${list.board_no})">
							<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
						</td>
					</tr>
				</tbody>
			</table>
			
			
		</form>
	</div>
</body>
<script>

function cancelUpdate(board_no){
	if(confirm("수정을 취소하시겠습니까?")){
		location.href="/SKHUBooks/board/boardDetail?board_no="+board_no;
	}
	return false;
}

function gotoHome(){
	location.href = "/SKHUBooks/board/boardList"
}
</script>
</html>