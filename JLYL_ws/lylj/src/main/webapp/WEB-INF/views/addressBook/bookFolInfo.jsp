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
		
	});
</script>
</head>
<body>
	<h2>카테고리 수정</h2>
	<div id="editDiv">
		<label class="editLabel">카테고리</label><span class="editSplitSpan">:</span>
		<select name="addressFolderNo" class="selectItemEdit">
			<option value="">선택하세요.</option>
			<c:forEach var="bookFol" items="${bookFolList}">
				<option value="${bookFol.addressFolderNo}">${bookFol.addressFolderName}</option>
			</c:forEach>
		</select>
	</div>
	<div id="btnItems">
		<input type="submit"id="bookWriteSubmit"value="수정">
		<button class="bookCancleBtn" type="button">취소</button>
	</div>
</body>
</html>