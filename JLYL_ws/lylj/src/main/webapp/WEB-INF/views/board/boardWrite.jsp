<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp" %>
<!-- summernote - include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- summernote - include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	      	width: 1000,
	   		height: 500,
	   		toolbar: [
	   			['fontname', ['fontname']],
	    		['fontsize', ['fontsize']],
	    		['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    		['color', ['forecolor','color']],
	    		['para', ['ul', 'ol', 'paragraph']],
			],
   			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		});
	});
</script>
<form method="post" class="writeForm">
    <div class="wrtieDiv">
        <select name="boardSelect" id="boardSelect">
            <option value="freeBoard">안내게시판</option>
            <option value="freeBoard">자유게시판</option>
            <option value="freeBoard">팀원게시판</option>
            <option value="freeBoard">자유게시판</option>
            <!-- 게시판을 추가하면 자동으로 추가되게끔 size 또는 length 받아옴 -->
        </select>
        <input type="submit" value="업로드" id="submitUp"><br>
        <br>
        <label for="titleLb">제목 : </label>
        <input type="text" name="title" id="title"> 
        <input type="checkbox" name="chkNotice" id="chkNotice"> <span class="noticeSpan">공지사항</span>
        <textarea id="summernote" name="content" class="summernote"></textarea>
        <input type="file" name="file1" class="upfile">
        <input type="file" name="file2" class="upfile">
        <input type="file" name="file3" class="upfile">
    </div>
</form>
<%@ include file="../inc/bottom.jsp" %>