<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<div id="mainBodyDiv" class="boardMain">
	<div id="noticeView">
		<h5 class="boardMainH">공지사항</h5>
		<br>
		<a href="<c:url value='/board/boardList?boardFolderNo=1'/>"><div class="moreBtn">더보기</div></a> 
		<table>
		    <colgroup>
		       <col style="width:20%;" />
		       <col style="width:70%;" />
		       <col style="width:10%;" />
		    </colgroup>
	        <thead>
			    <tr id="thStyle">
		            <th>작성자</th>
		            <th>제목</th>
		            <th>작성일</th>
			    </tr>
	        </thead>
	        <tbody>
	        	<c:if test="${empty noticeList }">
	        		<tr id="tdStyle">
	        			<td colspan="3" class="tdCenter">등록된 게시글이 없습니다.</td>
	        		</tr>
	        	</c:if>
	        	<c:if test="${!empty noticeList }">
	        	<c:forEach var="vo" items="${noticeList}">
				    <tr id="tdStyle">
			            <td class="userNameTd">${vo.boardWriter }</td>
			            <td>
			            	<a href="<c:url value='/board/boardDetail?boardNo=${vo.boardNo }'/>" class="titleA">${vo.boardTitle }</a> 
			            	<span>[6]</span>
			            	<span class="newSpan">new</span>
			            </td>
			            <td class="regdateTd"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/></td>
				    </tr>
			    </c:forEach>
			    </c:if>
	        </tbody>
		</table>
	</div>
	<div id="div2">
		<div id="ArchivesView">
			<h5 class="boardMainH" >자료실</h5>
			<br>
			<a href="<c:url value='/board/boardList?boardFolderNo=2'/>"><div class="moreBtn">더보기</div></a>
			<table>
			    <colgroup>
			       <col style="width:20%;" />
			       <col style="width:70%;" />
			    </colgroup>
		        <thead>
				    <tr id="thStyle">
			            <th>작성자</th>
			            <th>제목</th>
				    </tr>
		        </thead>
		        <tbody>
		        	<c:if test="${empty referenceList }">
		        		<tr id="tdStyle">
		        			<td colspan="2" class="tdCenter">등록된 게시글이 없습니다.</td>
		        		</tr>
		        	</c:if>
		        	<c:if test="${!empty referenceList }">
				        <c:forEach var="vo" items="${referenceList }">
						    <tr id="tdStyle">
					            <td class="userNameTd">${vo.boardWriter }</td>
					            <td>
					            	<a href="<c:url value='/board/boardDetail?boardNo=${vo.boardNo }'/>" class="titleA">${vo.boardTitle }</a> 
					            	<span>[6]</span>
					            	<span class="newSpan">new</span>
					            </td>
						    </tr>
					    </c:forEach>
				    </c:if>
		        </tbody>
			</table>
		</div>
		<div id="freeBoardView">
			<h5 class="boardMainH">커뮤니티</h5>
			<br>
			<a href="<c:url value='/board/boardList?boardFolderNo=1'/>"><div class="moreBtn">더보기</div></a>
			<table>
			    <colgroup>
			       <col style="width:20%;" />
			       <col style="width:70%;" />
			    </colgroup>
		        <thead>
				    <tr id="thStyle">
			            <th>작성자</th>
			            <th>제목</th>
				    </tr>
		        </thead>
		        <tbody>
			        <c:if test="${empty communityList }">
		        		<tr id="tdStyle">
		        			<td colspan="2" class="tdCenter">등록된 게시글이 없습니다.</td>
		        		</tr>
		        	</c:if>
		        	<c:if test="${!empty communityList }">
				        <c:forEach var="vo" items="${communityList }">
						    <tr id="tdStyle">
					            <td class="userNameTd">${vo.boardWriter }</td>
					            <td>
					            	<a href="<c:url value='/board/boardDetail?boardNo=${vo.boardNo }'/>" class="titleA">${vo.boardTitle }</a> 
					            	<span>[6]</span>
					            	<span class="newSpan">new</span>
					            </td>
						    </tr>
					    </c:forEach>
				    </c:if>
		        </tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>