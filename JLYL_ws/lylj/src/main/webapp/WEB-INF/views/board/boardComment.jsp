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
		var form = $('#replyAddDiv').html('<div class="replyImg" style="width:55px;"><i class="fas fa-angle-double-right"></i></div>'
				+'<form name="frmReplyAdd" method="post" id="frmReplyAdd">'
				+'<input type="hidden" name="boardWriter" value="답변" id="boardWriter">'
				+'<input type="hidden" name="boardNo" value="${param.boardNo }">'
				+'<input type="hidden" name="boardCommentGroupNo" value="'+groupNo+'" id="boardReplyGroupNo">'
				+'<input type="hidden" name="boardCommentStepNo" value="1" id="boardReplyStepNo">'
				+'<textarea name="boardCommentContent" class="commentTa" cols="129" rows="3" id="boardReplyContent">'+'@'+writer+'&nbsp;</textarea>'
				+'<button type="button" class="btn btn-primary" id="replyUp">등록</button>'
				+'</form>');
		$('.replyBtn').hide();
		$('.replyCancleBtn').show();
		$('#replyAddDiv').show();
		$(this).next().next().next().next().next().append(form);
	});
	
	$('.replyCancleBtn').click(function(){
		$('.replyCancleBtn').hide();
		$('.replyBtn').show();
		$('#replyAddDiv').hide();
	});

	//게시판 번호
	var boardNo = $('input[name=boardNo]').val();

	
	//답변 댓글에서 등록 버튼 클릭 이벤트 발생시
	$(document).on("click","#replyUp",function(){
		$('#boardReplyContent').focus();
		var commentContent = $('#boardReplyContent').val();
		var commentWriter = $('#boardWriter').val();
		var commentGroupNo = $('#boardReplyGroupNo').val();
		var commentStepNo = $('#boardReplyStepNo').val();
		
		$.ajax({
			type:"post",
			url:"<c:url value='/comment/replyWrite'/>",
			data:{
				boardNo:boardNo, 
				boardCommentContent:commentContent, 
				boardCommentWriter:commentWriter,
				boardCommentGroupNo:commentGroupNo,
				boardCommentStepNo:commentStepNo
			},				
			dataType:"json",
			success:function(d){
				alert("답변 등록을 성공하였습니다.");
				$('#replyAddDiv').hide();
				location.reload(true);
			},
			error:function(xhr, status, error){
				alert("댓글 등록을 실패하였습니다." + error);
			}
		});
		
	});
	
	//일반 댓글에서 등록 버튼 클릭 이벤트 발생시
	$('#commentUp').click(function(){
		var commentContent = $('#commAddContent').val();
		var commentWriter = $('#commAddwriter').val();
		
		$.ajax({
			type:"POST",
			url:"<c:url value='/comment/commentWrite'/>",
			data:{
				boardNo:boardNo, 
				boardCommentContent:commentContent, 
				boardCommentWriter:commentWriter
			},				
			dataType:"json",
			success:function(data){
				alert("댓글 등록하였습니다.");
				
				getReplies();
				location.reload(true);
			},
			error:function(xhr, status, error){
				alert("댓글 등록을 실패하였습니다." + error);
			}
		});
		
	});
	
	//댓글 목록 출력 함수
	function getReplies() {

	  $.getJSON("/board/boardDetail?boardNo=" + BoardNo, function (data) {
	      var str = "";
	      $(data).each(function () {
	        str += "<c:if test='${empty commList}'>"
	    	str += " <div style='text-align:center;'>등록된 댓글이 없습니다.</div>"
	    	str += " </c:if>"
	    	str +=  "<c:if test='${!empty commList}'>"
	    	str += "	<c:forEach var='commVo' items='${commList}'>"
	    	str += "	<c:if test='${commVo.boardCommentStepNo == 0 }'>"
	    	str += "		<div class='commentDiv'>"
	    	str += "			<input type='hidden' name='boardNo' value='${commVo.boardCommentGroupNo }'>"
	    	str += "	        <span class='userNameComm'>${commVo.boardCommentWriter }</span> <button class='replyBtn'>답글</button><button class='replyCancleBtn'>취소</button>"
	    	str += "	        <button id='detialMenu2' type='button' data-bs-toggle='dropdown'>"
	    	str += "	            <img src='<c:url value='/resources/img/icons8_menu.png'/>' id='menuImg' alt='메뉴'/>"
	    	str += "	        </button>"
	    	str += "	        <ul class='dropdown-menu dropdown-menu-lg-end' aria-labelledby='dropdownMenuLink'>"
	    	str += "	            <li><a class='dropdown-item' href='<c:url value='/comment/delete?boardCommentNo=${commVo.boardCommentNo}&boardNo=${commVo.boardNo }'/>'>삭제</a></li>"
	    	str += "	        </ul><br>"
	    	str += "	        <span class='contentComm'>${commVo.boardCommentContent }</span><br><br>"
	    	str += "	        <span id='regdateComm'><fmt:formatDate value='${commVo.boardCommentDate }' pattern='yyyy-MM-dd HH:mm:ss'/></span>"
	    	str += "        </div>"
	    	str += "    </c:if>"
	    	str += "	<c:if test='${commVo.boardCommentStepNo > 0 }'>"
	    	str += "    	<div class='replyDiv'>"
	    	str += "    		<div class='replyImg' style='width:55px;'><i class='fas fa-angle-double-right'></i></div>"
	    	str += "    		<div>"
	    	str += "    			<span class='userNameComm'>${commVo.boardCommentWriter }</span>"
	    	str += "		        <button id='detialMenu2' type='button' data-bs-toggle='dropdown' style='flex-wrap: wrap;'>"
	    	str += "		            <img src='<c:url value='/resources/img/icons8_menu.png'/>' id='menuImg' alt='메뉴'/>"
	  		str += "		        </button>"
	  		str += "		        <ul class='dropdown-menu dropdown-menu-lg-end' aria-labelledby='dropdownMenuLink'>"
	  		str += "		            <li><a class='dropdown-item' href='<c:url value='/comment/delete?boardCommentNo=${commVo.boardCommentNo}&boardNo=${commVo.boardNo }'/>'>삭제</a></li>"
	  		str += "		        </ul>"
	  		str += "		        <br>"
	  		str += "		        <span class='contentComm' style='flex-wrap: wrap;'>${commVo.boardCommentContent }</span><br><br>"
	  		str += "		        <span id='regdateComm'><fmt:formatDate value='${commVo.boardCommentDate }' pattern='yyyy-MM-dd HH:mm:ss'/></span>"
	  		str += "		        <br>"
	  		str += "	        </div>"
	  		str += "	    </div>"
	  		str += "    </c:if>"
	  		str += "    </c:forEach>"
	  		str += "</c:if>";
	      });
	      $("#commentAllDiv").html(str);
	  });

	}
});
</script>
<div id="commentBodyDiv">
    <h4>댓글</h4>
    <hr>
    <!-- 일반 댓글 쓰는 div -->
    <div id="commentAdd">
		<form name="frmCommentAdd" method="post" id="frmCommentAdd">
			<input type="hidden" name="boardCommentWriter" value="tttt" id="commAddwriter">
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
					        <span class="userNameComm">${commVo.boardCommentWriter }</span> <button class="replyBtn">답글</button><button class="replyCancleBtn">취소</button>
					        <button id="detialMenu2" type="button" data-bs-toggle="dropdown">
					            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
					        </button>
					        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
					            <li><a class="dropdown-item" href="<c:url value='/comment/delete?boardCommentNo=${commVo.boardCommentNo}&boardNo=${commVo.boardNo }'/>">삭제</a></li>
					        </ul><br>
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
				    		<div class="replyImg" style="width:55px;"><i class="fas fa-angle-double-right"></i></div>
				    		<div>
				    			<span class="userNameComm">${commVo.boardCommentWriter }</span>
						        <button id="detialMenu2" type="button" data-bs-toggle="dropdown" style="flex-wrap: wrap;">
						            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
						        </button>
						        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
						            <li><a class="dropdown-item" href="<c:url value='/comment/delete?boardCommentNo=${commVo.boardCommentNo}&boardNo=${commVo.boardNo }'/>">삭제</a></li>
						        </ul>
						        <br>
						        <span class="contentComm" style="flex-wrap: wrap;">${commVo.boardCommentContent }</span><br><br>
						        <span class="regdateReply"><fmt:formatDate value="${commVo.boardCommentDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						        <br>
					        </div>
					    </div>
			        </c:if>
				    <c:if test="${commVo.boardCommentDelflag == 'Y'}">
			    		<div class="replyDiv" style="height: 50px;">
			    			<div class="replyImg" style="width:55px;"><i class="fas fa-angle-double-right"></i></div>
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
<%-- 
<div class="commentAllDiv">
    <!-- commList가 없을 때 -->
    <c:if test="${empty commList}">
    	<div class="align_center">등록된 댓글이 없습니다.</div>
    </c:if>
    <!-- commList가 있을 때 -->
    <c:if test="${!empty commList}">
    <!-- 반복 시작 -->
    	<c:forEach var="commVo" items="${commList}">
    	<!-- stepNo=0 -->
    	<c:if test="${commVo.boardCommentStepNo == 0 }">
    		<div class="commentDiv">
				<input type="hidden" name="boardNo" value="${commVo.boardCommentGroupNo }">
		        <span class="userNameComm">${commVo.boardCommentWriter }</span> <button class="replyBtn">답글</button><button class="replyCancleBtn">취소</button>
		        <button id="detialMenu2" type="button" data-bs-toggle="dropdown">
		            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
		        </button>
		        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
		            <li><a class="dropdown-item" href="#">삭제</a></li>
		        </ul><br>
		        <span class="contentComm">${commVo.boardCommentContent }</span><br><br>
		        <span id="regdateComm"><fmt:formatDate value="${commVo.boardCommentDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		        <hr>
	        </div>
        </c:if>
    	<!-- stepNo>0 -->
    	<c:if test="${commVo.boardCommentStepNo > 0 }">
	    	<div class="replyDiv">
	    		<div class="replyImg" style="width:55px;"><i class="fas fa-angle-double-right"></i></div>
	    		<div>
	    			<span class="userNameComm">${commVo.boardCommentWriter }</span>
			        <button id="detialMenu2" type="button" data-bs-toggle="dropdown" style="flex-wrap: wrap;">
			            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
			        </button>
			        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
			            <li><a class="dropdown-item" href="#">삭제</a></li>
			        </ul>
			        <br>
			        <span class="contentComm" style="flex-wrap: wrap;">${commVo.boardCommentContent }</span><br><br>
			        <span id="regdateComm"><fmt:formatDate value="${commVo.boardCommentDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
			        <br>
			        <hr class="replyDivHr" style="margin-top: 10px;">
		        </div>
		    </div>
        </c:if>
	    </c:forEach>
    <!-- 반복 끝 -->
	</c:if>
   </div>
--%>


<%-- 	//댓글 목록 출력 함수
	function getReplies() {

	  $.getJSON("/board/boardDetail?boardNo=" + BoardNo, function (data) {
	      console.log(data);
	      var str = "";
	      $(data).each(function () {
	        str += "<c:if test='${empty commList}'>"
	    	str += " <div class='align_center'>등록된 댓글이 없습니다.</div>"
	    	str += " </c:if>"
	    	str +=  "<c:if test='${!empty commList}'>"
	    	str += "	<c:forEach var='commVo' items='${commList}'>"
	    	str += "	<c:if test='${commVo.boardCommentStepNo == 0 }'>"
	    	str += "		<div class='commentDiv'>"
	    	str += "			<input type='hidden' name='boardNo' value='${commVo.boardCommentGroupNo }'>"
	    	str += "	        <span class='userNameComm'>${commVo.boardCommentWriter }</span> <button class='replyBtn'>답글</button><button class='replyCancleBtn'>취소</button>"
	    	str += "	        <button id='detialMenu2' type='button' data-bs-toggle='dropdown'>"
	    	str += "	            <img src='<c:url value='/resources/img/icons8_menu.png'/>' id='menuImg' alt='메뉴'/>"
	    	str += "	        </button>"
	    	str += "	        <ul class='dropdown-menu dropdown-menu-lg-end' aria-labelledby='dropdownMenuLink'>"
	    	str += "	            <li><a class='dropdown-item' href='#'>삭제</a></li>"
	    	str += "	        </ul><br>"
	    	str += "	        <span class='contentComm'>${commVo.boardCommentContent }</span><br><br>"
	    	str += "	        <span id='regdateComm'><fmt:formatDate value='${commVo.boardCommentDate }' pattern='yyyy-MM-dd HH:mm:ss'/></span>"
	    	str += "        </div>"
	    	str += "    </c:if>"
	    	str += "	<c:if test='${commVo.boardCommentStepNo > 0 }'>"
	    	str += "    	<div class='replyDiv'>"
	    	str += "    		<div class='replyImg' style='width:55px;'><i class='fas fa-angle-double-right'></i></div>"
	    	str += "    		<div>"
	    	str += "    			<span class='userNameComm'>${commVo.boardCommentWriter }</span>"
	    	str += "		        <button id='detialMenu2' type='button' data-bs-toggle='dropdown' style='flex-wrap: wrap;'>"
	    	str += "		            <img src='<c:url value='/resources/img/icons8_menu.png'/>' id='menuImg' alt='메뉴'/>"
	  		str += "		        </button>"
	  		str += "		        <ul class='dropdown-menu dropdown-menu-lg-end' aria-labelledby='dropdownMenuLink'>"
	  		str += "		            <li><a class='dropdown-item' href='#'>삭제</a></li>"
	  		str += "		        </ul>"
	  		str += "		        <br>"
	  		str += "		        <span class='contentComm' style='flex-wrap: wrap;'>${commVo.boardCommentContent }</span><br><br>"
	  		str += "		        <span id='regdateComm'><fmt:formatDate value='${commVo.boardCommentDate }' pattern='yyyy-MM-dd HH:mm:ss'/></span>"
	  		str += "		        <br>"
	  		str += "	        </div>"
	  		str += "	    </div>"
	  		str += "		<hr class='replyDivHr' style='margin-top: 10px;'>"	
	  		str += "    </c:if>"
	  		str += "    </c:forEach>"
	  		str += "</c:if>";
	      });
	      $("#commentAllDiv").html(str);
	  });

	} --%>

