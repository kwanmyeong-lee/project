<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript">
$(function() {
	/* 등록 모달 이벤트 */
	$('#newAddressBook').click(function(){
		alert('주소록 수정 중에는 등록을 할 수 없습니다.');	
	});
	
	/* 수정버튼 클릭 이벤트 */
	$('form[name=frmBookUpdate]').submit(function(){
		var telRules = /^\d{3}-\d{3,4}-\d{4}$/;
		var ofTelRules = /^\d{2,3}-\d{3,4}-\d{4}$/;

		if($('#addressBook_name').val() == ''){
			alert('이름을 입력하세요.');	
			return false;			
		}else if($('#addressBook_tel').val() == ''){
			alert('번호를 입력하세요.');	
			return false;			
		}else if($('.selectItem2').val() == ''){
			alert('카테고리를 선택하세요.');	
			return false;			
		}else if(!telRules.test($('#addressBook_tel').val())){
			alert('잘못된 \'전화번호\'입니다. 숫자, -를 포함한 숫자만 입력하세요.');
			$('#addressBook_tel').focus();
			return false;
		}else if($('#addressBook_officeTel').val() > 0){
			if(!ofTelRules.test($('#addressBook_officeTel').val())){
				alert('잘못된 \'회사번호\'입니다. 숫자, -를 포함한 숫자만 입력하세요.');
				$('#addressBook_officeTel').focus();
				return false;
			}
		}
	});
	
	/* 취소버튼 클릭 이벤트*/
	$('.bookCancleBtn').click(function() {
		history.back();
	});
	
	/* 카테고리 수정 클릭 이벤트 */
	$('.folBtn').click(function(){
		window.open('<c:url value="/bookFolInfo/main"/>','카테고리 정보','width=600, height=470, toolbar=no, menubar=no, scrollbars=no, resizable=no');
	});
	
});
</script>

<form name="frmBookUpdate" action="<c:url value='/addressBook/update'/>">
	<div id="bookUpdateDiv">
		<input type="hidden" name="addressBookNo" value="${bookVo.addressBookNo }">
		<h4>주소록 수정</h4>
		<div id="userNameBox" class="boxDiv">
			<label>이름</label><span class="splitSpan">:</span>
			<input type="text" name="addressBookName" id="addressBook_name" class="inputItems" value="${bookVo.addressBookName }">
		</div>
		<div id="telBox" class="boxDiv">
			<label>전화번호</label><span class="splitSpan">:</span>
			<input type="text" name="addressBookTel" id="addressBook_tel" class="inputItems" value="${bookVo.addressBookTel }"><br>
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
			<select name="addressFolderNo" class="selectItem2" id="addressFolderNo">
				<option value="">선택하세요.</option>
				<c:forEach var="bookFol" items="${bookFolList}">
					<option value="${bookFol.addressFolderNo}"
						<c:if test="${bookFol.addressFolderNo == bookVo.addressFolderNo   }">
							selected="selected"
						</c:if>
					>${bookFol.addressFolderName}</option>
				</c:forEach>
			</select>
			<button type="button" class="btn btn-outline-secondary folBtn" id="searchBtn">카테고리 수정</button>
		</div>
		<div id="btnItems">
			<input type="submit" id="bookWriteSubmit" value="수정">
			<button class="bookCancleBtn" type="button">취소</button>
		</div>
	</div>
</form>
<%@ include file="../inc/bottom.jsp" %>