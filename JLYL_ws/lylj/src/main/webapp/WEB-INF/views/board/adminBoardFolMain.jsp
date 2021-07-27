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
	
});
</script>
<div id="adminBoardFolDiv">
	<h3>게시판 관리</h3>
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
							<span class="nameSpan"><a href="#">${boFol.boardFolderName }</a></span>
							<div style="display: none;">
								<form action="<c:url value='/adminBoard/update'/>">
									<input type="hidden" name="boardFolderNo" value="${boFol.boardFolderNo }">
									<input type="text" name="boardFolderName" value="${boFol.boardFolderName }">
									<input type="submit" value="수정">
								</form>
							</div>
						</td>
						<td><a href="<c:url value='/adminBoard/delete?boardFolderNo=${boFol.boardFolderNo}'/>"><input type="button" value="X" id="xBoxBtn"></a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div id="adminInsert">
		<h5>카테고리 추가</h5>
		<form action="<c:url value='/adminBoard/insert'/>">
			<input type="text" name="boardFolderName" id="boardFolderName">
			<input type="submit" value="+" id="plusBtn">
		</form>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>