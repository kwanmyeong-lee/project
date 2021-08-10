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
	
	window.onbeforeunload = function() {};
	$(function(){
		$('#inputGroupFileAddon04').click(function(){
			$('#inputGroupFile04').val('');
		});
		
		$('#writeCancleBtn').click(function(){
			window.history.back();
		});
		
		$('form[name="writeForm"]').submit(function(){
			//유효성 검사
			if($('#boardSelect').val()==''){
				alert('게시판을 선택하세요.');
				return false;
			}else if($('#title').val().length > 60){
				alert('제목의 글자수는 60자 이하로 입력하세요.');
				return false;
			}else if($('#title').val()==''){
				alert('제목을 입력하세요.');
				return false;
			}else if($('#summernote').val()==''){
				alert('내용을 입력하세요.');
				return false;
			}
		});
	});
</script>
<form enctype="multipart/form-data" method="post" class="writeForm" 
	name="writeForm" action="<c:url value='/board/boardWrite'/>">
	<input type="hidden" name="empNo" value="${empNo }"><!-- 사원번호 -->
	<input type="hidden" name="boardWriter" value="${empName }"><!-- 사원이름 -->
    <div class="wrtieDiv">
        <select name="boardFolderNo" id="boardSelect">
            <option value="">게시판을 선택해주세요.</option>
            <c:forEach var="fol" items="${boFol }">
	            <option value="${fol.boardFolderNo}">${fol.boardFolderName}</option>
            </c:forEach>
            <!-- 게시판을 추가하면 자동으로 추가되게끔 size 또는 length 받아옴 -->
        </select>
        <input type="submit" value="업로드" id="submitUp"><br>
        <br>
        <label for="titleLb" id="writeTitle">제목 : </label>
        <input type="text" name="boardTitle" id="title"> 
        <div id="writeCancleBtn">취소</div>
        <textarea id="summernote" name="boardContent" class="summernote"></textarea>
        <div class="input-group">
		  <input multiple="multiple" type="file" class="form-control" name="upfile" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04"><i class="fas fa-trash-alt"></i></button>
		</div>
		<span style="margin-left:5px;font-size:14px;">※&nbsp; 파일크기 제한 : 50MB</span>
    </div>
</form>
<%@ include file="../inc/bottom.jsp" %>

