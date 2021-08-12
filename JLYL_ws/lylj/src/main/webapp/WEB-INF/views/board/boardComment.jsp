<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('#replyAddDiv').hide();
	$('.replyCancleBtn').hide();
	
	$('.replyBtn').click(function(){
		var writer = $(this).prev().text();
		var groupNo = $(this).prev().prev().val();
		var form = $('#replyAddDiv').html('<div class="replyImg" style="width:55px;"><i class="fas fa-reply"></i></div>'
				+'<form name="frmReplyAdd" method="post" id="frmReplyAdd" action="<c:url value="/comment/replyWrite"/>">'
				+'<input type="hidden" name="boardCommentWriter" value="${empName}" id="boardWriter">'
				+'<input type="hidden" name="boardNo" value="${param.boardNo }">'
				+'<input type="hidden" name="boardCommentGroupNo" value="'+groupNo+'" id="boardReplyGroupNo">'
				+'<input type="hidden" name="boardCommentStepNo" value="1" id="boardReplyStepNo">'
				+'<textarea name="boardCommentContent" class="commentTa" cols="100" rows="3" id="boardReplyContent">'+'@'+writer+'&nbsp;</textarea>'
				+'<button type="submit" class="btn btn-primary" id="replyUp">등록</button>'
				+'</form>');
		$('.replyBtn').hide();
		$('.replyCancleBtn').show();
		$('#replyAddDiv').show();
		$(this).next().next().next().parent().append(form);
	});
	
	$('.replyCancleBtn').click(function(){
		$('.replyCancleBtn').hide();
		$('.replyBtn').show();
		$('#replyAddDiv').hide();
	});
	
	$('.deleteBtn').click(function(){
		var conf = confirm('댓글을 삭제하시겠습니까?');
		if(!conf){
			return false;
		}
	});

});
</script>
<div id="commentBodyDiv">
    <h4 style="float:left;margin-right:10px;">댓글</h4><div class="commCnt">${vo.commentCnt}</div>
    <!-- 일반 댓글 쓰는 div -->
    <div id="commentAdd">
    <hr>
		<form name="frmCommentAdd" method="post" id="frmCommentAdd" action="<c:url value='/comment/commentWrite'/>">
			<input type="hidden" name="boardCommentWriter" value="${empName }" id="commAddwriter">
			<input type="hidden" name="boardNo" value="${param.boardNo }">
	    	<textarea name="boardCommentContent" class="commentTa" cols="140" rows="3" id="commAddContent"></textarea>
	    	<button type="submit" class="btn btn-primary" id="commentUp">등록</button>
		</form>
	</div>
    <hr>
    <div class="commentAllDiv">
	    <c:if test="${empty commList}">
	    	<div style='text-align:center;'>등록된 댓글이 없습니다.</div>
	    </c:if>
	    <c:if test="${!empty commList}">
	    	<c:forEach var="commVo" items="${commList}">
		    	<c:if test="${commVo.boardCommentStepNo == 0 }">
				    <c:if test="${commVo.boardCommentDelflag == '0'}">
			    		<div class="commentDiv">
							<input type="hidden" name="boardNo" value="${commVo.boardCommentGroupNo }">
					        <span class="userNameComm">${commVo.boardCommentWriter }</span> <button class="replyBtn" type="button">답글</button><button class="replyCancleBtn">취소</button>
					        <c:if test="${commVo.boardCommentWriter == empName}">
						        <button id="detialMenu2" type="button" data-bs-toggle="dropdown">
						            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
						        </button>
						        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
						            <li><a class="dropdown-item deleteBtn" href="<c:url value='/comment/delete?boardCommentNo=${commVo.boardCommentNo}&boardNo=${commVo.boardNo }'/>">삭제</a></li>
						        </ul>
						    </c:if>
						    <br>
					        <span class="contentComm">${commVo.boardCommentContent }</span><br><br>
					        <span class="regdateComm"><fmt:formatDate value="${commVo.boardCommentDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
				        </div>
			    		<hr style="color:white;">
			        </c:if>
				    <c:if test="${commVo.boardCommentDelflag == 'Y'}">
			    		<div class="commentDiv" style="height: 50px;">
			    			<div style="margin: 40px 0 0 30px;">삭제된 댓글 입니다.</div>
			    		</div>
			        </c:if>
		        </c:if>
		    	<c:if test="${commVo.boardCommentStepNo > 0 }">
				    <c:if test="${commVo.boardCommentDelflag == '0'}">
				    	<div class="replyDiv">
				    		<div class="replyImg" style="width:55px;"><i class="fas fa-reply"></i></div>
				    		<div>
				    			<span class="userNameComm">${commVo.boardCommentWriter }</span>
				    			<c:if test="${commVo.boardCommentWriter == empName}">
							        <button id="detialMenu2" type="button" data-bs-toggle="dropdown" style="flex-wrap: wrap;">
							            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
							        </button>
						        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
						            <li><a class="dropdown-item deleteBtn" href="<c:url value='/comment/delete?boardCommentNo=${commVo.boardCommentNo}&boardNo=${commVo.boardNo }'/>">삭제</a></li>
						        </ul>
						        </c:if>
						        <br>
						        <span class="contentComm" style="flex-wrap: wrap;">${commVo.boardCommentContent }</span><br><br>
						        <span class="regdateReply"><fmt:formatDate value="${commVo.boardCommentDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						        <br>
					        </div>
					    </div>
			        </c:if>
				    <c:if test="${commVo.boardCommentDelflag == 'Y'}">
			    		<div class="replyDiv" style="height: 50px;">
			    			<div class="replyImg" style="width:55px;"><i class="fas fa-reply"></i></div>
			    			<span style="margin: 10px 0 5px 20px;">삭제된 댓글 입니다.</span>
			    		</div>
			        </c:if>
		        </c:if>
				<hr>
		    </c:forEach>
		</c:if>
    </div>
    <!-- 답변 클릭시 보여지는 div -->
	<div id="replyAddDiv"></div>    
    
</div>
