<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript">
	$(function() {
		/* 취소버튼 클릭 이벤트*/
		$('.bookCancleBtn').click(function() {
			history.back();
		});
		
		/* 카테고리 수정 클릭 이벤트 */
		$('.folBtn').click(function(){
			window.open('<c:url value="/addressBook/bookFolInfo"/>','네이버','width=600, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no');
		});
	});
</script>
</head>
<body>
	<form name="frmBookUpdate" action="<c:url value='/addressBook/update'/>">
		<div id="bookUpdateDiv">
			<input type="hidden" name="addressBookNo" value="${bookVo.addressBookNo }">
			<h4>주소록 수정</h4>
			<div id="userNameBox" class="boxDiv">
				<label>이름</label><span class="splitSpan">:</span>
				<input type="text" name="addressBookName" id="addressBook_name" class="inputItems" value="${bookVo.addressBookName }">
			</div>
			<div id="telBox" class="boxDiv">
				<label>번호</label><span class="splitSpan">:</span>
				<input type="text" name="addressBookTel" id="addressBook_tel" class="inputItems" value="${bookVo.addressBookTel }"><br>
				<span id="updateInfoSpan">※ 하이픈(-) 없이 입력하세요.(예: 01033338888)</span>
			</div>
			<div id="emailBox" class="boxDiv">
				<label>메일</label><span class="splitSpan">:</span>
				<input type="text" name="addressBookMaile" id="addressBook_maile" class="inputItems" value="${bookVo.addressBookMaile }">
			</div>
			<div id="positionBox"class="boxDiv">
				<label>직위</label><span class="splitSpan">:</span>
				<input type="text" name="addressBookPosition" id="addressBook_position" class="inputItems" value="${bookVo.addressBookPosition }">
				<label style="margin-left:22px;">성별</label><span class="splitSpan">:</span>
				<select name="addressBookGender" class="selectItem1" >
					<option value=""></option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			</div>
			<div id="officeNameInputBox"class="boxDiv">
				<label>회사</label><span class="splitSpan">:</span>
				<input type="text" name="addressBookOfficeName" id="addressBook_officeName" class="inputItems" value="${bookVo.addressBookOfficeName }">
			</div>
			<div id="officeNameInputBox"class="boxDiv">
				<label>회사번호</label><span class="splitSpan">:</span>
				<input type="text" name="addressBookOfficeTel" id="addressBook_officeTel" class="inputItems" value="${bookVo.addressBookOfficeTel }">
			</div>
			<div id="InputBox"class="boxDiv">
				<label>카테고리</label><span class="splitSpan">:</span>
				<select name="addressFolderNo" class="selectItem2">
					<option value="">선택하세요.</option>
					<c:forEach var="bookFol" items="${bookFolList}">
						<option value="${bookFol.addressFolderNo}">${bookFol.addressFolderName}</option>
					</c:forEach>
				</select>
				<button type="button" class="btn btn-outline-secondary folBtn" id="searchBtn">카테고리 수정</button>
			</div>
			<div id="btnItems">
				<input type="submit"id="bookWriteSubmit"value="수정">
				<button class="bookCancleBtn" type="button">취소</button>
			</div>
		</div>
	</form>
</body>