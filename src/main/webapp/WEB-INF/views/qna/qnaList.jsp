<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>QnA</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<form action="qnaInsert">
		<textarea name="qna_content" id="editor" style="width: 1100px; height: 205px;" required="required"></textarea>
		<br>
		<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">
		<input type="submit" value="제출">
		<input type="reset" value="취소">
	</form>

	<table>
		<c:forEach var="list" varStatus="i" items="${list}">	
			<tr>
				<td>
					<input type="hidden" id = "qna_no" value=${list.qna_no }>
					<h3>${list.qna_writer }</h3>
				</td>				
			</tr>
			
			<tr>
				<td>
					<a id="qnaContent${list.qna_no }">${list.qna_content }</a>
					
					<div id = "qnaInfo">
					<h6>${list.qna_insertdate }</h6>
						<sec:authentication property='principal.username' var="logInID"/>
						<c:if test = "${logInID == list.qna_writer }">
							<a onclick="qnaUpdate('${list.qna_no }','${list.qna_content }')">수정</a>
							<a onclick="qnaDelete(${list.qna_no })">삭제</a>
						</c:if>
		
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a onclick="insertComment(${list.qna_no })">답글달기</a>
						</sec:authorize>
					</div>
				</td>
			</tr>
			<c:if test="${list.qna_comment != null }">
				<tr>
					<td>└</td>
					<td>${list.qna_comment }</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	
	
</body>

<script>

function qnaUpdate(qna_no, qna_content){
	$("#qnaContent"+qna_no).html('	<textarea name="qna_content" id="qna_editor" style="width: 300px; height: 100px;" required="required">'+qna_content+'</textarea>\
									<br>\
									<input type="hidden" name = "qna_no" value="'+qna_no+'">\
									<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
									<button onclick = "fn_qnaUpdate()">수정 완료</button>\
									<button onclick = "fn_qnaUpdateCancel(\''+qna_no+'\',\''+qna_content+'\')">수정 취소</button>\
			');
	$("#qnaInfo").hide();
}

function qnaDelete(qna_no){
   if(confirm("질문을 삭제하시겠습니까?")){
	   location.href="/SKHUBooks/qna/qnaDelZete?qna_no="+qna_no;
   }
}
function asdf(){
	alert('aaaaa');
}

function fn_qnaUpdate(){
	var qna_no = $("#qna_no").val();
	var qna_content = $("#qna_editor").val();
	var qnaData = {"qna_content" : qna_content,
				   "qna_no" : qna_no
				  };
	
	if(qna_content.length < 1){
		alert("내용을 입력해주시기 바랍니다.");
	}
	else{
		$.ajax({
			type : "POST",
			url : "/SKHUBooks/qna/qnaUpdate",
			data : qnaData,
			dataType : "json",
			beforeSend : function(xhr){
				//데이터 전송 전에 헤더에 csrf 값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(Result){
				alert("수정이 완료되었습니다.");
				$("#qnaContent"+qna_no).html(qna_content);
				$("#qnaInfo").show();
			},
			error : function(error){
				alert("서버가 응답하지 않습니다. \n다시 시도해 주시기 바랍니다.");
			}			
		});
	};
}
function fn_qnaUpdateCancel(qna_no, qna_content){
	$("#qnaContent"+qna_no).html(qna_content);
	$("#qnaInfo").show();
}

function insertComment(qna_no){
	alert(qna_no);
}
</script>
</html>