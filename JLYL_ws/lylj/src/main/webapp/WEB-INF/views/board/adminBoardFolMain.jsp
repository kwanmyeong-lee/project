<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">
<script type="text/javascript">
$(function(){
	$('.nameSpan').click(function(){
		$(this).hide();
		$(this).next().show();
	});
	
	$('.xBoxBtn').click(function(){
		var conf = confirm('카테고리를 삭제하시겠습니까?');
		if(!conf){
			return false;
		}
	});
	
	$('#plusBtn').click(function(){
		var name1 = $.trim($(this).prev().val());
		if(name1 == ''){
			alert('카테고리명을 입력하세요.');
			$(this).prev().focus();
			return false;
		}
	});
	
	$('.adminEditBtn').click(function(){
		var name2 = $.trim($(this).prev().val());
		if(name2 == ''){
			alert('카테고리명을 입력하세요.');
			$(this).prev().focus();
			return false;
		}
	});
});
</script>
<div id="adminBoardFolDiv">
	<h3>카테고리 관리</h3>
	<br><br>
	<table id="adminBoardTable">
		<colgroup>
			<col style="width:15%;" />
	        <col style="width:85%;" />
		</colgroup>
		<thead>
			<tr id="thStyle">
				<th>번호</th>
				<th>카테고리명</th>
			</tr>
		</thead>
			
		<tbody>
			<c:if test="${empty boFol }">
				<tr>
					<td colspan="2">게시판 카테고리가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty boFol }">
				<c:forEach var="boFol" items="${boFol }">
					<tr id="tdStyle">
						<td id="noTd">${boFol.boardFolderNo }</td>
						<td>
							<div class="nameSpan">
								<a href="#">${boFol.boardFolderName }</a>
							</div>
							<div style="display: none;">
								<form action="<c:url value='/adminBoard/update'/>">
									<input type="hidden" name="boardFolderNo" value="${boFol.boardFolderNo }">
									<input type="text" name="boardFolderName" value="${boFol.boardFolderName }">
									<button class="btn btn-success adminEditBtn"><i class="fas fa-check"></i></button>
								</form>
							</div>
						</td>
						<td><a href="<c:url value='/adminBoard/delete?boardFolderNo=${boFol.boardFolderNo}'/>" class="xBoxBtn"><button type="button" class="btn btn-danger" id="xBoxBtn">X</button></a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div id="adminInsert">
		<h5>카테고리 추가</h5>
		<form action="<c:url value='/adminBoard/insert'/>">
			<input type="text" name="boardFolderName" id="boardFolderName">
			<button class="btn btn-primary" id="plusBtn">+</button>
		</form>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>