<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.selectItemEdit').click(function(){
			var folNo = $('.selectItemEdit').val();
			
			$('#folderInsertDiv').hide();
			$('form[name="frmFolEdit"]').show();
			$('#addressFolderNo').val(folNo);
		});
		
		/* + 버튼 클릭 이벤트 */
		$('#plusBtn').click(function(){
			$('form[name="frmFolEdit"]').hide();
			$('#folderInsertDiv').show();
		});
		
		/* 카테고리 수정 버튼 */
		$('#folderEditBtn').click(function(){
			var folNo = $('#addressFolderNo').val();
			if(folNo == ''){
				alert('카테고리를 선택하세요.');
				return false;
			}
			$('#folEditFrm').attr("action","<c:url value='/bookFolInfo/update'/>").submit();
		});

		/* 삭제 버튼 */
		$('#folderDeleteBtn').click(function(){
			var folNo = $('#addressFolderNo').val();
			if(folNo == ''){
				alert('카테고리를 선택하세요.');
				return false;
			}
			$('#folEditFrm').attr("action","<c:url value='/bookFolInfo/delete'/>").submit();
		});
		
		/* 확인 버튼 */
		$('#selectBtn').click(function(){
			opener.document.location.reload();
			self.close();
		});
	});
	
</script>
</head>
<body>
	<div id="editBgDiv">
		<div id="editDiv">
			<h2>카테고리</h2><br>
			<span id="warSpan">※ 확인버튼을 누르면 새로고침 되어 '주소록 등록'창의 경우<br> 입력한 정보가 삭제 되오니 주의하시기 바랍니다.</span><br>
			<br>
			<select name="addressFolderNo" class="selectItemEdit">
				<option value="">선택하세요.</option>
				<c:forEach var="bookFol" items="${bookFolList}">
					<option value="${bookFol.addressFolderNo}">${bookFol.addressFolderName}</option>
				</c:forEach>
			</select>
			<button type="button" id="plusBtn">+</button>
			
			<br><br><hr>
			
			<form name="frmFolEdit" id="folEditFrm" hidden="hidden">
				<h4>카테고리 수정</h4>
				<input type="hidden" name="empNo" value="${empNo }">
				<input type="hidden" name="addressFolderNo" id="addressFolderNo">
				<input type="text" name="addressFolderName" id="addressFolderName1" class="folderName">
				<button type="button" id="folderEditBtn" class="editBtn">수정</button>
				<button type="button" id="folderDeleteBtn" class="editBtn">삭제</button>
			</form>
			
			<div id="folderInsertDiv" hidden="hidden">
				<form action="<c:url value='/bookFolInfo/insert'/>">
					<h4>카테고리 추가</h4>
					<input type="hidden" name="empNo" value="${empNo }">
					<input type="text" name="addressFolderName" id="addressFolderName2" class="folderName">
					<input type="submit" value="추가" id="folderInsertBtn" class="editBtn">
				</form>
			</div>
			<br>
			<input type="button" value="확인" id="selectBtn">
		</div>
	</div>
</body>
</html>