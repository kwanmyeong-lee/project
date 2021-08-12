<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">
<script type="text/javascript" 
   src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('form[name="frmSearch"]').submit(function(){
			if($('select[name="searchCondition"]').val()==''){
				$('#searchTextBox').val('');
			}
		});
	});
	
	function pageProc(curPage){
	    $('input[name=currentPage]').val(curPage);
	    $('form[name=frmPage]').submit();   
	 }
</script>

<div id="listBodyDiv">
	<h4 class="listTitle">${boFol.boardFolderName }</h4>
	<br>
	<!-- 페이징 처리를 위한 form -->
	<form action="<c:url value='/board/boardList?boardFolderNo=${param.boardFolderNo}'/>" 
	   name="frmPage" method="post" id="frmPage">
	   <input type="hidden" name="boardFolderNo" value="${param.boardFolderNo }"><br>
	   <input type="hidden" name="currentPage" value=${pagingInfo.currentPage }><br>
	   <input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	   <input type="hidden" name="searchKeyword" value="${param.searchKeyword}"><br>   
	</form>
	<br>
	<div id="searchDiv">
		<form name="frmSearch" method="post" 
         action='<c:url value="/board/boardList?boardFolderNo=${param.boardFolderNo }"/>'>
			<select name="searchCondition" id="searchCondition">
				<option value=""></option>
				<option value="board_Title"
				<c:if test="${param.searchCondition == 'board_Title' }">               
	                  selected="selected"
	            </c:if>
	            >제목</option>
				<option value="board_Content"
				<c:if test="${param.searchCondition == 'board_Content' }">               
	                  selected="selected"
	            </c:if>
	            >내용</option>
				<option value="board_Writer"
				<c:if test="${param.searchCondition == 'board_Writer' }">               
	                  selected="selected"
	            </c:if>
	            >작성자</option>
			</select>
			<input type="text" name="searchKeyword" id="searchTextBox" value="${param.searchKeyword }">
			<input type="submit" value="검색" id="searchBtn">
		</form>
	</div>
	<table>
	    <colgroup>
	       <col style="width:7%;" />
	       <col style="width:63%;" />
	       <col style="width:10%;" />
	       <col style="width:10%;" />
	       <col style="width:10%;" />      
	    </colgroup>
        <thead>
		    <tr id="thStyle">
	            <th>번호</th>
	            <th>제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th>조회수</th>
		    </tr>
        </thead>
        <tbody>
        <c:if test="${empty list}">
		    <tr id="tdStyle">
	            <td colspan="5" class="userNameTd">등록된 게시글이 없습니다.</td>
    		</tr>    	
        </c:if>
        <c:if test="${!empty list}">
	        <c:forEach var="vo" items="${list}">
			    <tr id="tdStyle">
		            <td class="no" style="text-align: center;">${vo.boardNo}</td>
		            <td>
		            	<a href="<c:url value='/board/countUpdate?boardNo=${vo.boardNo }'/>" class="titleA" style="margin-left:20px;">
			            	<c:if test="${fn:length(vo.boardTitle) > 60 }">
				        		${fn:substring(vo.boardTitle,0, 60)}...
				        	</c:if>
				        	<c:if test="${fn:length(vo.boardTitle) < 61 }">
				        		${vo.boardTitle}
				        	</c:if>
		            	</a> 
		            	<c:if test="${vo.commentCnt > 0}">
		            		<span class="commCnt2" style="float: inherit;">[${vo.commentCnt }]</span>
		            	</c:if>
		            	<c:if test="${vo.newImgTerm<24}">
		            		<span class="newSpan">new</span>
		            	</c:if>
		            </td>
		            <td class="userNameTd">${vo.boardWriter}</td>
		            <td class="regdateTd"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/></td>
		            <td class="readCountTd">${vo.boardHits }</td>
			    </tr>
		    </c:forEach>
        </c:if>
        </tbody>
	</table>
	
	<div id="pagingDiv">
		<nav aria-label="Page navigation example" id="pagingNav">
		  <ul class="pagination">
		  	<!-- 이전 블럭 -->
		  	<c:if test="${pagingInfo.firstPage>1 }">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous" onclick="pageProc(${pagingInfo.firstPage-1})">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
		    </c:if>
		    
		    <!-- 페이지 번호 -->
		    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			    <c:if test="${i==pagingInfo.currentPage }">
			    	<li class="page-item active" aria-current="page">
			    	<a class="page-link" href="#" style="background-color: #30a8b9;border-color: #f8f9fc;">${i }</a></li>
			    </c:if>
			    <c:if test="${i!=pagingInfo.currentPage }">
			    	<li class="page-item">
			    	<a class="page-link" href="#" onclick="pageProc(${i})" style="color:#a2a2a2;">${i }</a></li>
			    </c:if>
		    </c:forEach>
		    
		    <!-- 다음 블럭 -->
		    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next" onclick="pageProc(${pagingInfo.lastPage+1})">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
		    </c:if>
		  </ul>
		</nav>	
	</div>
	
</div>

<%@ include file="../inc/bottom.jsp" %>