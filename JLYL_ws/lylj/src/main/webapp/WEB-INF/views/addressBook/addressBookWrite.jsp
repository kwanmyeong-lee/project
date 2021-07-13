<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">

<form name="frmBookWrite" action="#">
	<div id="bookWriteDiv">
		<h4>주소록 등록</h4>
		<p>설명을 어쩌규 저쩌구 할것임 ㅇㅇ</p>
		<div id="userNameInputDiv">
			<label>이름</label><span class="splitSpan">:</span>
			<input type="text" name="addressBook_name" id="addressBook_name" class="inputItems">
		</div>
		<div id="telInputDiv">
			<label>번호</label><span class="splitSpan">:</span>
			<input type="text" name="addressBook_tel" id="addressBook_tel" class="inputItems">
		</div>
		<div id="emailInputDiv">
			<label>메일</label><span class="splitSpan">:</span>
			<input type="text" name="addressBook_maile" id="addressBook_maile" class="inputItems">
		</div>
		<div id="InputDiv">
			<label>부서</label><span class="splitSpan">:</span>

		</div>
		<div id="positionInputDiv">
			<label>직급</label><span class="splitSpan">:</span>

		</div>
		<div id="btnItems">
			<input type="submit" id="bookWriteSubmit" value="등록">
			<button id="bookWritwCancleBtn">취소</button>
		</div>
	</div>
</form>
<%@ include file="../inc/bottom.jsp" %>