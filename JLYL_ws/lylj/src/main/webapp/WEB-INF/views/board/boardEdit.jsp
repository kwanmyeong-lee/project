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
		
		/* 삭제 버튼 */
		$('#fileDelBtn').click(function(){
			var confirm1 = confirm('선택한 파일을 삭제하시겠습니까?');
			if(!confirm1){
				return false;
			}else{
				fileDeleteClick();
			}
		});
	});
	
	/* 선택 삭제 */
	function fileDeleteClick(){
	    var checkBoxArr = []; 
	    $("#fileList input[type=checkbox]:checked").each(function() {
		    checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 담기
		    console.log(checkBoxArr);
		});

	    $.ajax({
	        type: "POST",
	        url: "<c:url value='/board/boardFileDel'/>",
	        data: {
	        checkBoxArr : checkBoxArr        // folder seq 값을 가지고 있음.
	        },
	        success: function(result){
	      	  location.reload();
	        },
	        error: function(xhr, status, error) {
	      	  alert('체크박스를 선택하지 않거나, 삭제 처리 중 오류가 발생하였습니다.');
	       }  
	    });
	} 
</script>
<form enctype="multipart/form-data" method="post" class="writeForm" action="<c:url value='/board/boardEdit'/>">
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
		  <input multiple="multiple" type="file" class="form-control" name="upfile" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" value="${fileList }">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04"><i class="fas fa-trash-alt"></i></button>
		</div>
		<span style="margin-left:5px;font-size:14px;">※&nbsp; 파일크기 제한 : 50MB</span>
		<c:if test="${!empty fileList}">
			<br><br>
			<span style="margin-left:10px;margin-top:7px;background-color:#36b9cc;color:white;width:100px;padding:5px 0;display: inline-block;text-align: center;font-weight: bold;border-radius: 5px;">기존파일</span><button class="btn btn-outline-secondary" type="button" id="fileDelBtn" style="float:right;margin-right:10px;margin-top:20px;;height:30px;width:100px;padding:3px;">선택삭제</button>
			<div style="border: 1px solid #bdbcbc; padding:10px;margin-top:15px;">
				<c:forEach var="file" items="${fileList}">
					<div id="fileList">
						<input type="checkbox" value="${file.boardFileNo}">
						<span>${file.originalFileName }</span>
					</div>
				</c:forEach>
			</div>
		</c:if>
    </div>
</form>
<%@ include file="../inc/bottom.jsp" %>

