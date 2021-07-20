<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function(){
	
});
</script>
<div id="commentBodyDiv">
    <h4>댓글</h4>
    <hr>
    <div class="commentDiv">
    <!-- commList가 없을 때 -->
    	
    <!-- commList가 있을 때 -->
    <!-- 반복 시작 -->
    	<!-- stepNo=0 -->
        <span id="userNameComm">작성자</span> <button id="replyBtn">답변</button>
        <button id="detialMenu2" type="button" data-bs-toggle="dropdown">
            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
        </button>
        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
            <li><a class="dropdown-item" href="#">삭제</a></li>
        </ul><br><br>
        <span class="contentComm">냉요내용내안녕하세요 으아아아아아ㅏ 아ㅏ...안돼,.!</span><br><br>
        <span id="regdateComm">2021-07-05 23:38:55</span>
        <hr>
        <!-- 답변 클릭시 보여지는 div -->
        <div class="replyAddDiv">
			<form name="frmReplyAdd" method="post" action="<c:url value='/board/insertComment'/>">
				<input type="text" name="boardCommentWriter" value="tttt">
				<input type="text" name="boardNo" value="${param.boardNo }">
				<input type="text" name="boardCommentGroupNo" value="${vo.boardNo }">
				<input type="text" name="boardCommentStepNo" value="1">
		    	<textarea name="boardCommentContent" id="commentTa" cols="129" rows="3"></textarea>
		    	<button type="submit" class="btn btn-primary" id="commentUp">등록</button>
	        </form>	
        </div>
        <hr class="replyDivHr" style="margin-top: 10px;">
    	<!-- stepNo>0 -->
    	<div class="replyDiv">
    		<div class="replyImg" style="width:55px;"><i class="fas fa-angle-double-right"></i></div>
    		<div>
		        <span class="userNameComm" style="flex-wrap: wrap;">답변한사람</span>
		        <button id="detialMenu2" type="button" data-bs-toggle="dropdown" style="flex-wrap: wrap;">
		            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
		        </button>
		        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
		            <li><a class="dropdown-item" href="#">삭제</a></li>
		        </ul>
		        <br><br>
		        <span class="contentComm" style="flex-wrap: wrap;">답변 합니다~~~~!~!~!~!~!~!~!~!</span><br><br>
		        <span id="regdateComm" style="flex-wrap: wrap;">2021-07-05 23:38:55</span>
	        </div>
	    </div>
        <hr class="replyDivHr" style="margin-top: 10px;">
    	
    <!-- 반복 끝 -->
    </div>
	<form name="frmCommentAdd" method="post">
		<input type="text" name="boardCommentWriter" value="tttt">
		<input type="text" name="boardNo" value="${param.boardNo }">
    	<textarea name="boardCommentContent" id="commentTa" cols="140" rows="3"></textarea>
    	<button type="submit" class="btn btn-primary" id="commentUp">등록</button>
	</form>
</div>