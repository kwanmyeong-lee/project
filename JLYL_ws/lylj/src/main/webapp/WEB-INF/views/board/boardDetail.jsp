<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp" %>
<%@ include file="boardAside.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<div id="detailBodyDiv">
	<div id=detailDiv>
	    <div id="titleDiv"> <span>제목테스트!!!</span>
	            <button id="detialMenu" type="button" data-bs-toggle="dropdown" >
	                <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
	            </button>
	            <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
	                <li><a class="dropdown-item" href="#">수정</a></li>
	                <li><a class="dropdown-item" href="#">삭제</a></li>
	            </ul>
	        <span id="readcountSpan">조회수 : 39</span>
	        <span id="userNameSpan">테스트이름</span>
	    </div>
	    <div id="borderDiv"></div>
	    <textarea name="contentTa" id="contentTaDetail" cols="120" rows="35" readonly>아아아아아아ㅏㅇ</textarea>
	    <span id="regdateSpan">2021-07-05 23:38:55</span>
	    <div id="borderDiv"></div>
    </div>
	<%@ include file="boardComment.jsp" %>
</div>

<%@ include file="../inc/bottom.jsp" %>