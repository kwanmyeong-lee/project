<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">
<script type="text/javascript" 
   src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	function pageProc(curPage){
	    $('input[name=currentPage]').val(curPage);
	    $('form[name=frmPage]').submit();   
	 }
</script>

<div id="listBodyDiv">
	<h4 class="listTitle">${boFol.boardFolderName }</h4>
	<br>
	<c:if test="${!empty param.searchKeyword }">
	   <p id="searchP">검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord} 건 검색되었습니다.</p>
	</c:if>
	<!-- 페이징 처리를 위한 form -->
	<form action="<c:url value='/board/boardList'/>" 
	   name="frmPage" method="post">
	   <input type="hidden" name="currentPage"><br>
	   <input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	   <input type="hidden" name="searchKeyword" value="${param.searchKeyword}"><br>   
	</form>
	<table>
	    <colgroup>
	       <col style="width:20%;" />
	       <col style="width:60%;" />
	       <col style="width:10%;" />
	       <col style="width:10%;" />      
	    </colgroup>
        <thead>
		    <tr id="thStyle">
	            <th>작성자</th>
	            <th>제목</th>
	            <th>작성일</th>
	            <th>조회수</th>
		    </tr>
        </thead>
        <tbody>
        <c:if test="${empty list}">
		    <tr id="tdStyle">
	            <td colspan="4" class="userNameTd">등록된 게시글이 없습니다.</td>
    		</tr>    	
        </c:if>
        <c:if test="${!empty list}">
	        <c:forEach var="vo" items="${list}">
			    <tr id="tdStyle">
		            <td class="userNameTd">${vo.boardWriter}</td>
		            <td>
		            	<a href="<c:url value='/board/countUpdate?boardNo=${vo.boardNo }'/>" class="titleA">${vo.boardTitle}</a> 
		            	<span>[6]</span> <!-- [ ] 안에 댓글 수 (###########) -->
		            	<span class="newSpan">new</span> <!-- 시간계산으로 new 처리 !!!! -->
		            </td>
		            <td class="regdateTd"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/></td>
		            <td class="readCountTd">${vo.boardHits }</td> <!-- 조회수 컬럼 추가!!!! -->
			    </tr>
		    </c:forEach>
        </c:if>
        </tbody>
	</table>
	
	<div id="pagingDiv">
		<nav aria-label="Page navigation example">
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
			    	<li class="page-item"  style="text-decoration: none;background-color:lightgray;"><a class="page-link" href="#">i</a></li>
			    </c:if>
			    <c:if test="${i!=pagingInfo.currentPage }">
			    	<li class="page-item"><a class="page-link" href="#">i</a></li>
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
	<div id="searchDiv">
		<form name="frmSearch" method="post" 
         action='<c:url value="/board/boardlist"/>'>
			<select name="searchCondition">
				<option ></option>
				<option value="boardTitle"
				<c:if test="${param.searchCondition == 'boardTitle' }">               
	                  selected="selected"
	            </c:if>
	            >제목</option>
				<option value="boardContent"
				<c:if test="${param.searchCondition == 'boardContent' }">               
	                  selected="selected"
	            </c:if>
	            >내용</option>
				<option value="boardWriter"
				<c:if test="${param.searchCondition == 'boardWriter' }">               
	                  selected="selected"
	            </c:if>
	            >작성자</option>
			</select>
			<input type="text" name="searchKeyword" id="searchTextBox" value="${param.searchKeyword }">
			<input type="submit" value="검색">
		</form>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>