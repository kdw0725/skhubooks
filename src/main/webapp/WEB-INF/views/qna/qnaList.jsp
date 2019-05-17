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
					<b>${list.qna_writer }</b>
				</td>				
			
				<td>
					<div id = "qnaInfo">
						<a>${list.qna_insertdate }</a>
						<sec:authentication property='principal.username' var="logInID"/>
						<c:if test = "${logInID == list.qna_writer }">
							<a onclick="qnaUpdate('${list.qna_no }','${list.qna_content }')">수정</a>
							<a onclick="qnaDelete(${list.qna_no })">삭제</a>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<a id="qnaContent${list.qna_no }">${list.qna_content }</a>
					<c:if test="${list.qna_comment == null }">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<tr id="comment${list.qna_no }">
								<td>
									<a onclick="insertComment(${list.qna_no })">답글달기</a>
								</td>
							</tr>
						</sec:authorize>
					</c:if>
					<c:if test="${list.qna_comment != null }">
						<tr id = "comment${list.qna_no }">
							<td >└ ${list.qna_comment }</td>
							<c:if test="${logInID == list.qna_writer }">
								<td id = "commentBtn">
										<a onclick = "commentUpdate('${list.qna_no}','${list.qna_comment }')">수정</a>
										<a onclick = "commentDelete(${list.qna_no})">삭제</a>
									</td>
							</c:if>
						</tr>
						
					</c:if>
					
				</td>
			</tr>
			
			
		</c:forEach>
	</table>
	
	
</body>

<script>
function qnaUpdate(qna_no, qna_content){
	$("#qnaContent"+qna_no).html('	<textarea name="qna_content" id="qna_editor" style="width: 300px; height: 100px;" required="required">'+qna_content+'</textarea>\
									<br>\
									<input type="hidden" name = "qna_no" value="'+qna_no+'">\
									<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
									<button onclick = "fn_qnaUpdate('+qna_no+')">수정 완료</button>\
									<button onclick = "fn_qnaUpdateCancel(\''+qna_no+'\',\''+qna_content+'\')">수정 취소</button>\
			');
	$("#qnaInfo").hide();
}
function qnaDelete(qna_no){
   if(confirm("질문을 삭제하시겠습니까?")){
	   location.href="/SKHUBooks/qna/qnaDelete?qna_no="+qna_no;
   }
}
function asdf(){
	alert('aaaaa');
}
function fn_qnaUpdate(qna_no){
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
	$("#comment"+qna_no).html('<textarea name="qna_comment" id="qna_editor" style="width: 300px; height: 100px;" required="required"></textarea>\
						       <br>\
						       <input type="hidden" name = "qna_no" value="'+qna_no+'">\
						       <input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
						       <button onclick = "commentInsert('+qna_no+')">답글 등록</button>\
						       <button onclick = "commentCancel('+qna_no+')">등록 취소</button>\
						       ');
	$("#qnaInfo").hide();	
}
function commentCancel(qna_no){
	$("#comment"+qna_no).html('<a onclick="insertComment('+qna_no+')">답글달기</a>');
}
function commentInsert(qna_no){
	var qna_comment = $("#qna_editor").val();
	var qnaData = {"qna_comment" : qna_comment,
			   	   "qna_no" : qna_no
				  };
	if(qna_comment.length < 1){
		alert("내용을 입력하세요.");
	}
	else{
		$.ajax({
			type : "POST",
			url : "/SKHUBooks/qna/commentInsert",
			data : qnaData,
			dataType : "json",
			beforeSend : function(xhr){
				//데이터 전송 전에 헤더에 csrf 값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(Result){
				alert('답글이 등록되었습니다.');
				$("#comment"+qna_no).html('<td>└ '+qna_comment+'</td>\
											<td id="commentBtn">\
												<a onclick="commentUpdate(\''+qna_no+'\',\''+qna_comment+'\')">수정</a>\
												<a onclick="commentDelete('+qna_no+')">삭제</a>\
											');
				$("#qnaInfo").show();
				$("#commentBtn").show();
			},
			error : function(error){
				alert("서버가 응답하지 않습니다. \n다시 시도해 주시기 바랍니다.");
			}
		});
	};
}
function commentUpdate(qna_no, qna_comment){
	$("#comment"+qna_no).html('<textarea name="qna_comment" id="qna_editor" style="width: 300px; height: 100px;" required="required">'+qna_comment+'</textarea>\
									<br>\
									<input type="hidden" name = "qna_no" value="'+qna_no+'">\
									<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
									<button onclick = "commentUpdateDo(\''+qna_no+'\',\''+qna_comment+'\')">답글 수정</button>\
									<button onclick = "commentUpdateCancel(\''+qna_no+'\',\''+qna_comment+'\')">수정 취소</button>\
									');	
 
}
function commentDelete(qna_no){
	   if(confirm("답글을 삭제하시겠습니까?")){
		   alert("삭제가 완료되었습니다.");
		   location.href = "/SKHUBooks/qna/commentDelete?qna_no="+qna_no;
	   }
}
function commentUpdateCancel(qna_no,qna_comment){
	$("#comment"+qna_no).html('<td>└ '+qna_comment+'</td>\
								<td id="commentBtn">\
									<a onclick="commentUpdate(\''+qna_no+'\',\''+qna_comment+'\')">수정</a>\
									<a onclick="commentDelete('+qna_no+')">삭제</a>\
								');
}
function commentUpdateDo(qna_no, qna_comment){
	var qna_comment = $("#qna_editor").val();
	var qnaData = {"qna_comment" : qna_comment,
		   	   "qna_no" : qna_no
			  };
	if(qna_comment.length < 1){
		alert("내용을 입력하세요.");
	}
	else{
		$.ajax({
			type : "POST",
			url : "/SKHUBooks/qna/commentUpdate",
			data : qnaData,
			dataType : "json",
			beforeSend : function(xhr){
				//데이터 전송 전에 헤더에 csrf 값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(Result){
				alert("수정이 완료되었습니다.");
				$("#comment"+qna_no).html('<td>└ '+qna_comment+'</td>\
											<td id="commentBtn">\
												<a onclick="commentUpdate(\''+qna_no+'\',\''+qna_comment+'\')">수정</a>\
												<a onclick="commentDelete('+qna_no+')">삭제</a>\
											');
			},
			error : function(error){
				alert("서버가 응답하지 않습니다. \n다시 시도해 주시기 바랍니다.");
			}
		})
	}
}
</script>
</html>