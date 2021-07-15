<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/summerNote_css/summernote-lite.css'/>">
<script src="<c:url value='/resources/js/summernote-lite.js'/>"></script>
<script src="<c:url value='/resources/js/lang/summernote-ko-KR.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	      	width: 955,
	   		height: 500,
	   		toolbar: [
	   			['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link','video']],
			],
   			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		});
		
	});
</script>
<form method="post" class="writeForm" action="<c:url value='/board/boardEdit'/>">
    <div class="wrtieDiv">
    	<input type="hidden" name="boardNo" value="${param.boardNo }">
        <select name="boardFolderNo" id="boardSelect" >
            <option value="">게시판을 선택해주세요.</option>
            <c:forEach var="fol" items="${boFol }">
	            <option value="${fol.boardFolderNo}"
	            <c:if test='${vo.boardFolderNo == fol.boardFolderNo}'>
	            	selected="selected"
	            </c:if>
	            >${fol.boardFolderName}</option>
	            
	            
            </c:forEach>
            <!-- 게시판을 추가하면 자동으로 추가되게끔 size 또는 length 받아옴 -->
        </select>
        <input type="submit" value="수정" id="submitUp"><br>
        <br>
        <label for="titleLb" id="writeTitle">제목 : </label>
        <input type="text" name="boardTitle" id="title" value="${vo.boardTitle }"> 
		<button id="writeCancleBtn">취소</button>
        <textarea id="summernote" name="boardContent" class="summernote">${vo.boardContent }</textarea>
        <div class="input-group">
		  <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">취소</button>
		</div>
        <div class="input-group">
		  <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">취소</button>
		</div>
        <div class="input-group">
		  <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">취소</button>
		</div>
    </div>
</form>
<%@ include file="../inc/bottom.jsp" %>

