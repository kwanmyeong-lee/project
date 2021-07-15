<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<div id="listBodyDiv">
	<h4 class="listTitle">${boFol.boardFolderName }</h4>
	<br>
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
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>	
	</div>
	<div id="searchDiv">
		<select>
			<option ></option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="searchKeyword" id="searchTextBox">
		<button>검색</button>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>