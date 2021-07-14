<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<script type="text/javascript">
	$(function(){
		$('#likeBtnChk1').hide();
		
		$('#likeBtnChk1').click(function(){
			$(this).hide();
			$('#likeBtnChk2').show();
		});
		$('#likeBtnChk2').click(function(){
			$(this).hide();
			$('#likeBtnChk1').show();
		});
	});
</script>
<div id="detailBodyDiv">
	<div id=detailDiv>
	    <div id="titleDiv"> 
	    	<span>제목테스트!!!</span>
	    	<br>
	        <a href="#" id="userNameSpan">${vo.boardWriter }</a>
	        <span id="readcountSpan">조회수 : ${vo.boardHits }</span>
		    <span id="regdateSpan"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	            <button id="detialMenu" type="button" data-bs-toggle="dropdown" >
	                <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
	            </button>
	            <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
	                <li><a class="dropdown-item" href="#">수정</a></li>
	                <li><a class="dropdown-item" href="#">삭제</a></li>
	            </ul>
	            <div id="likeDiv">
			        <i class="fa fa-thumbs-up" id="likeBtnChk2"></i>
			        <i class="fa fa-thumbs-up" id="likeBtnChk1"></i>
	            	&nbsp;<span id="likeCnt">: 13</span>
			    </div>
	    </div>
	    <div id="borderDiv"></div>
	   	<div id="contentTaDetail">${vo.boardContent }</div>
	    <div id="borderDiv"></div>
    </div>
	<%@ include file="boardComment.jsp" %>
</div>

<%@ include file="../inc/bottom.jsp" %>