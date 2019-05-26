<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/include/headinclude.jsp"%>
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
	<h1 class="title"><b>Q & A</b></h1>
	<p>무엇이든 물어보세요!</p>
	<%@ include file="/WEB-INF/views/include/headinclude2.jsp"%>
	
	<div class="container">
		<br><br><br><br>
		<b>질문하기</b>
		<form action="qnaInsert">
		<hr/>
			<textarea name="qna_content" id="editor" style="width: 100%; height: 100px;" required="required" placeholder="질문을 입력하세요. "></textarea>
			<hr/>
			<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">
			<input type="submit" value="등록" class="btn btn-default pull-right">
			<input type="reset" value="reset" class="btn btn-default pull-rigth">
		</form>
	</div>
	<br><br>
	<div class="container">
		<table class="table table-striped" style="width : 100%;">
			<thead>
				<tr>
					<th colspan="2" style="width : 60%; font-size: 20px">Q & A</th>
					<th style="font-size: 20px; text-align: center;">작성자</th>
					<th style="font-size: 20px; text-align: center;">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" varStatus="i" items="${list}">
					<tr>
						<td colspan="2" style=" padding : 20px;">
							<black id="qnaContent${list.qna_no }">${list.qna_content }</black>
						</td>
						
						<td style="text-align: center;" >
							<input type="hidden" id = "qna_no" value=${list.qna_no }>
							${list.qna_writer }
						</td>
						<td style="text-align: center;">
								${list.qna_insertdate }
						</td>
							<c:if test="${list.qna_comment == null }">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<td>
										<div id = "contentBtn${list.qna_no }">
											<input type="button" value="답변" onclick="insertComment(${list.qna_no })" class="btn btn-default pull-right">
											<input type="button" value="수정" class="btn btn-default pull-right" onclick = "qnaUpdate('${list.qna_no}','${list.qna_content }')">
											<input type="button" value="삭제" class="btn btn-default pull-right" onclick = "qnaDelete(${list.qna_no})">
										</div>
									</td>
								</sec:authorize>
							</c:if>
							<c:if test="${list.qna_comment != null }">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<td>
										<div id="contentBtn${list.qna_no }">
											<input type="button" value="수정" class="btn btn-default pull-right" onclick = "qnaUpdate('${list.qna_no}','${list.qna_content }')">
											<input type="button" value="삭제" class="btn btn-default pull-right" onclick = "qnaDelete(${list.qna_no})">
										</div>
									</td>
								</sec:authorize>
							</c:if>
							
							<sec:authentication property='principal.username' var="logInID"/>
							<c:if test="${logInID == list.qna_writer }">
								<td>
									<div id="contentBtn${list.qna_no }">
										<input type="button" value="수정" class="btn btn-default pull-right" onclick = "qnaUpdate('${list.qna_no}','${list.qna_content }')">
										<input type="button" value="삭제" class="btn btn-default pull-right" onclick = "qnaDelete(${list.qna_no})">
									</div>
								</td>
							</c:if>
					</tr>
					<c:if test="${list.qna_comment != null }">
						<tr id="comment${list.qna_no }">
							<td colspan="4" style="padding : 15px;">　└　Re: ${list.qna_comment }</td>
							<td>
								<div id="commentBtn${list.qna_no }">
			         				<input type="button" value="수정" class="btn btn-default pull-right" onclick="commentUpdate('${list.qna_no}','${list.qna_comment }')">
			         				<input type="button" value="삭제" class="btn btn-default pull-right" onclick="commentDelete(${list.qna_no})">
	         				  	</div>
							</td>
						</tr>
					</c:if>
					<c:if test="${list.qna_comment == null }">
						<tr id="comment${list.qna_no }">
						</tr>
						<tr id="asdf" style = "display: none">
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<ul class="paging">
				<c:if test="${pageMaker.prev }">
					<li class="pagingLeftBtn">
						<a href='<c:url value="/qna/qnaList?page=${pageMaker.startPage-1 }"/>'></a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<c:choose>
						<c:when test="${idx==pageMaker.cri.page }">
							<li class="active">
	        					<a href='<c:url value="/qna/qnaList?page=${idx }"/>'>${idx }</a>
	        				</li>
						</c:when>
						<c:otherwise>
							<li>
	        					<a href='<c:url value="/qna/qnaList?page=${idx }"/>'>${idx }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li class="pagingRightBtn">
	        			<a href='<c:url value="/qna/qnaList?page=${pageMaker.endPage+1 }"/>'></a>
	    			</li>
				</c:if>
			</ul>
		</div>
	</div>
	
</body>

<script>
function qnaUpdate(qna_no, qna_content){
	$("#qnaContent"+qna_no).html('	\
									<textarea name="qna_content" id="qna_editor" style="width: 100%; height: 100px;" required="required">'+qna_content+'</textarea>\
									<br><hr>\
									<input type="hidden" name = "qna_no" value="'+qna_no+'">\
									<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
									<button class="btn btn-default pull-left" onclick = "fn_qnaUpdate('+qna_no+')">수정 완료</button>\
									<button class="btn btn-default pull-left" onclick = "fn_qnaUpdateCancel(\''+qna_no+'\',\''+qna_content+'\')">수정 취소</button>\
			');
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
				$("#contentBtn"+qna_no).html('  \
												<input type="button" value="수정" class="btn btn-default pull-right" onclick = "qnaUpdate(\''+qna_no+'\',\''+qna_content+'\')")">\
												<input type="button" value="삭제" class="btn btn-default pull-right" onclick = "qnaDelete(+qna_no+)">\
												');
			},
			error : function(error){
				alert("서버가 응답하지 않습니다. \n다시 시도해 주시기 바랍니다.");
			}			
		});
	};
}

function fn_qnaUpdateCancel(qna_no, qna_content){
	$("#qnaContent"+qna_no).html(qna_content);
}

function insertComment(qna_no){
	$("#comment"+qna_no).html('\
								<td colspan="2"><form action="commentInsert">\
								<textarea name="qna_comment" id="qna_editor" style="width: 100%; height: 100px;" required="required"></textarea>\
							    <br><hr>\
							    <input type="hidden" name = "qna_no" value="'+qna_no+'">\
							    <input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
							    <button class="btn btn-default pull-left" type="submit">답글 등록</button>\
							    <button class="btn btn-default pull-left" onclick = "commentCancel('+qna_no+')">등록 취소</button>\
							    </form></td>\
						       ');
}

function commentCancel(qna_no){
	$("#comment"+qna_no).html('');
}

function commentUpdate(qna_no, qna_comment){
	$("#comment"+qna_no).html('\
								<textarea name="qna_comment" id="qna_editor" style="width: 100%; height: 100px;" required="required">'+qna_comment+'</textarea>\
								<br><hr>\
								<input type="hidden" name = "qna_no" value="'+qna_no+'">\
								<input type="hidden" name="qna_writer" readonly="readonly" value="<sec:authentication property='principal.username'/>">\
								<button class="btn btn-default pull-left" onclick = "commentUpdateDo(\''+qna_no+'\',\''+qna_comment+'\')">답글 수정</button>\
								<button class="btn btn-default pull-left" onclick = "commentUpdateCancel(\''+qna_no+'\',\''+qna_comment+'\')">수정 취소</button>\
								');	
 
}

function commentDelete(qna_no){
	   if(confirm("답글을 삭제하시겠습니까?")){
		   alert("삭제가 완료되었습니다.");
		   location.href = "/SKHUBooks/qna/commentDelete?qna_no="+qna_no;
	   }
}

function commentUpdateCancel(qna_no,qna_comment){
	$("#comment"+qna_no).html('\
								<td colspan="4">　└　Re:  '+qna_comment+'</td>\
								<td>\
								<input type = "button" value="수정" class="btn btn-default pull-right" onclick="commentUpdate(\''+qna_no+'\',\''+qna_comment+'\')">\
								<input type = "button" value="삭제" class="btn btn-default pull-right" onclick="commentDelete('+qna_no+')"  >\
								</td>\
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
				$("#comment"+qna_no).html(' \
											<td colspan="4">　└　Re:  '+qna_comment+'</td>\
											<td>\
											<input type = "button" value="수정" class="btn btn-default pull-right" onclick="commentUpdate(\''+qna_no+'\',\''+qna_comment+'\')">\
											<input type = "button" value="삭제" class="btn btn-default pull-right" onclick="commentDelete('+qna_no+')"  >\
											</td>\
											');
			},
			error : function(error){
				alert("서버가 응답하지 않습니다. \n다시 시도해 주시기 바랍니다.");
			}
		});
	};
}
</script>
</html>