<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<div id="mainBodyDiv" class="boardMain">
	<div id="noticeView">
		<h5>공지사항</h5>
		<br>
		<div class="moreBtn">더보기</div>
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
		        <c:forEach var="i" begin="1" end="5">
				    <tr id="tdStyle">
			            <td class="userNameTd">유혁</td>
			            <td>
			            	<a href="https://www.youtube.com/" class="titleA">테스트용 제목</a> 
			            	<span>[6]</span> <=[ ] 안에 댓글 수 
			            	<span class="newSpan">new</span>
			            </td>
			            <td class="regdateTd">2021-07-11</td>
				    </tr>
			    </c:forEach>
	        </tbody>
		</table>
	</div>
	<div id="ArchivesView">
		<h5>자료실</h5>
		<br>
		<div class="moreBtn">더보기</div>
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
		        <c:forEach var="i" begin="1" end="5">
				    <tr id="tdStyle">
			            <td class="userNameTd">유혁</td>
			            <td>
			            	<a href="https://www.youtube.com/" class="titleA">테스트용 제목</a> 
			            	<span>[6]</span> <=[ ] 안에 댓글 수 
			            	<span class="newSpan">new</span>
			            </td>
				    </tr>
			    </c:forEach>
	        </tbody>
		</table>
	</div>
	<div id="freeBoardView">
		<h5>자유게시판</h5>
		<br>
		<div class="moreBtn">더보기</div>
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
		        <c:forEach var="i" begin="1" end="5">
				    <tr id="tdStyle">
			            <td class="userNameTd">유혁</td>
			            <td>
			            	<a href="https://www.youtube.com/" class="titleA">테스트용 제목</a> 
			            	<span>[6]</span> <=[ ] 안에 댓글 수 
			            	<span class="newSpan">new</span>
			            </td>
				    </tr>
			    </c:forEach>
	        </tbody>
		</table>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>