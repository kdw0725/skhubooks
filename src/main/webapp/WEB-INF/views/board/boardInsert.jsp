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
<h1 class="title"><b>공지사항</b></h1>
<p>skhubooks 공지사항 입니다.</p>
<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
<br><br><br><br>
	<div class="container">
		<form action="boardInsertDo" encType="multiplart/form-data">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style=" width: 100px; text-align: center;vertical-align: middle;">제&nbsp;&nbsp;목</th>
						<td>
							<input type="text" name="board_title" class="form-control" placeholder="제목을 입력하세요." required="required">
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
						<th style=" width: 100px; text-align: center;vertical-align: middle;">내&nbsp;&nbsp;용</th>
						<td><textarea class="form-control" name="board_content" id="editor" style="height: 205px;" required="required"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-default pull-rigth">
							<input type="reset" class="btn btn-default pull-rigth">	
							<input type="button" value="글 목록" class="btn btn-default pull-right" onclick="gotoHome()">
						</td>	
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
<script>
function gotoHome(){
	location.href = "/SKHUBooks/board/boardList?page=1";
}
</script>
</html>