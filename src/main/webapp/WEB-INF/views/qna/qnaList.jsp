<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<body>

	<form action="qnaInsert">
		<textarea name="qna_content" id="editor" style="width: 1100px; height: 205px;" required="required"></textarea>
		<br>
		<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">
		<input type="submit" value="제출">
		<input type="reset" value="취소">
	</form>

	<table border="1px">
		<c:forEach var="list" varStatus="i" items="${list}">	
			<tr>
				<td>작성자</td>
				<td>${list.qna_writer }</td>
				<td>
					<sec:authentication property='principal.username' var="logInID"/>
					<c:if test = "${logInID == list.qna_writer }">
						<a onclick="qnaUpdate(${list.qna_no })">수정</a>
						<a onclick="qnaDelete(${list.qna_no })">삭제</a>
					</c:if>	
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a onclick="insertComment(${list.qna_no })">답글달기</a>
					</sec:authorize>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${list.qna_content }</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${list.qna_insertdate }</td>
			</tr>
			<c:if test="${list.qna_comment != null }">
				<tr>
					<td></td>
					<td>${list.qna_comment }</td>
					<td></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>

<script>
function qnaUpdate(qna_no){
	alert(qna_no);
}

function qnaDelete(qna_no){
   if(confirm("질문을 삭제하시겠습니까?")){
	   location.href="/SKHUBooks/qna/qnaDelete?qna_no="+qna_no;
   }
}

function insertComment(qna_no){
	alert(qna_no);
}
</script>
</html>