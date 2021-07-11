<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/board/style.css'/>">

<div id="listBodyDiv">
	<h4>?? 게시판</h4>
	<br>
	<div id="writeBtnDiv">글쓰기</div>
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
	        <c:forEach var="i" begin="1" end="10">
			    <tr id="tdStyle">
		            <td class="userNameTd">유혁</td>
		            <td>
		            	<a href="https://www.youtube.com/" class="titleA">테스트용 제목</a> 
		            	<span>[6]</span> <=[ ] 안에 댓글 수 
		            	<span class="newSpan">new</span>
		            </td>
		            <td class="regdateTd">2021-07-11</td>
		            <td class="readCountTd">85</td>
			    </tr>
		    </c:forEach>
        </tbody>
	</table>
	
	<div id="pagingDiv">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
	<div id="searchDiv">
		<select>
			<option></option>
			<option>제목</option>
			<option>내용</option>
			<option>작성자</option>
		</select>
		<input type="text" id="searchTextBox">
		<button>검색</button>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>