<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<script type="text/javascript">
$(function(){
	$('#boardDelete').click(function(){
		var result = confirm('글을 삭제 하시겠습니까?');
		if(!result){
			return false;
		}
	});
	
	$(document).on('click', '#likeBtnChk2', function(){
		$('#likeBtnChk2').hide();
		$('#likeBtnChk1').show();
		var boardNo = $('#boardNo').val();
		$.ajax({
			type:"GET",
			url:"<c:url value='/like/insert'/>",			
			data:{
				boardNo:boardNo
			},				
			dataType:"json",
			success:function(cnt){
				$('#likeCnt').text(': '+cnt);
			}
		});
	});
	
	$(document).on('click', '#likeBtnChk1', function(){
		$('#likeBtnChk1').hide();
		$('#likeBtnChk2').show();

		var boardNo = $('#boardNo').val();
		$.ajax({
			type:"GET",
			url:"<c:url value='/like/delete'/>",			
			dataType:"json",
			data:{
				boardNo:boardNo
			},	
			success:function(cnt){
				$('#likeCnt').text(': '+cnt);
			}
		});
	});
});
</script>
<div id="detailBodyDiv">
	<div id=detailDiv>
	    <div id="titleDiv"> 
	    	<input type="hidden" id="boardNo" value="${param.boardNo }">
	    	<input type="hidden" id="empName" value="${empName }">
	    	<span>${vo.boardTitle }</span>
	    	<br>
	        <span id="userNameSpan">${vo.boardWriter }</span>
	        <span id="readcountSpan">조회수 : ${vo.boardHits }</span>
		    <span id="regdateSpan"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		    <c:if test="${vo.empNo == empNo }">
	            <button id="detialMenu" type="button" data-bs-toggle="dropdown" id="menuBtn">
	                <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
	            </button>
	            <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink" id="meniList">
	                <li><a class="dropdown-item" href="<c:url value='/board/boardEdit?boardNo=${param.boardNo }'/>">수정</a></li>
	                <li><a class="dropdown-item" href="<c:url value='/board/boardDelete?boardNo=${param.boardNo }&boardFolderNo=${vo.boardFolderNo}'/>" id="boardDelete">삭제</a></li>
	            </ul>
	        </c:if>
	            <div id="likeDiv">
	            	<c:if test="${selectByEmpNo eq 0 }">
			        	<button id="likeBtnChk2" type="button"><i class="fa fa-thumbs-up" ></i></button> 
				        <button id="likeBtnChk1" type="button" style="display: none;"><i class="fa fa-thumbs-up" ></i></button> 
			        </c:if>
	            	<c:if test="${selectByEmpNo eq 1 }">
			        	<button id="likeBtnChk2" type="button" style="display: none;"><i class="fa fa-thumbs-up" ></i></button> 
				        <button id="likeBtnChk1" type="button"><i class="fa fa-thumbs-up" ></i></button> 
			        </c:if>
	            	&nbsp;<span id="likeCnt">: ${likeCnt }</span>
			    </div>
	    </div>
	    <c:if test="${!empty fileVo}">
	    <div id="borderDiv"></div>
	    <!-- 첨부파일 -->
		    <button id="upFile" type="button" data-bs-toggle="dropdown" >첨부파일</button>
		    <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink" id="upFileList">
		    	<c:forEach var="file" items="${fileVo}">
		    		<c:set var="filesize" value="${file.fileSize }" />
		            <li><a class="dropdown-item fileA" href="<c:url value='/board/download?boardFileNo=${file.boardFileNo }'/>" ><i class="fas fa-save"></i>&nbsp;&nbsp; ${file.originalFileName}</a></li>
	            </c:forEach>
	        </ul>
        </c:if>
        
	    <c:if test="${empty fileVo }">
	    	<div id="borderDiv"></div>
        </c:if>
        <!-- 글 내용 -->
	   	<div id="contentTaDetail">${vo.boardContent }</div>
	    <div id="borderDiv"></div>
    </div>
	<%@ include file="boardComment.jsp" %>
</div>

<%@ include file="../inc/bottom.jsp" %>