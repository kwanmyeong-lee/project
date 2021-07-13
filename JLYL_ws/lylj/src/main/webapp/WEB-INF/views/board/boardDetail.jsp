<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	        <a href="#" id="userNameSpan">테스트이름</a>
	        <span id="readcountSpan">조회수 : 39</span>
		    <span id="regdateSpan">2021-07-05 23:38:55</span>
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
	   	<div id="contentTaDetail">녝스트 럐블~~~ 저 너머의 문을12312312312312312312312312312312312azsdasdcfqawedr Q3ERE ASEDFSDF ASD FAWERFWEFszdfgwerfgawe3123123123131 열어 녝st 럐ㅖ블</div>
	    <div id="borderDiv"></div>
    </div>
	<%@ include file="boardComment.jsp" %>
</div>

<%@ include file="../inc/bottom.jsp" %>