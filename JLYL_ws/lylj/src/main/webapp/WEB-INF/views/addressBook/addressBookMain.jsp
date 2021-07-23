<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript">
	$(function() {
		/* 주소록 등록 모달*/
		$("#newAddressBook").click(function() {
			$(".addressBookModal").fadeIn();
		});
		$(".bookCancleBtn").click(function() {
			$(".addressBookModal").hide();
		});
		
		/* 주소록 수정 모달 */
		$(".userNameClick").click(function() {
			$(".addressBookEditModal").fadeIn();
		});
		$(".bookCancleBtn").click(function() {
			$(".addressBookEditModal").hide();
		});

		/* 주소록 마우스 이벤트 */
		$('.tdStyle').hover(function(){
			$(this).css("background","rgb(240, 240, 240)");
		}, function(){
			$(this).css("background","none");
		});
		
		
		/* 전체 선택 처리 */
		$('#chkAllMain').click(function(){
			$('tbody td input[type=checkbox]').prop('checked',this.checked);			
		});
		
		/* 검색 처리 */
		$('form[name="frmSearch"]').submit(function(){
				if($('select[name="searchCondition"]').val()==''){
					$('#searchTextBox').val('');
				}
		});
		
	});
	/* 페이징 처리 */
	function pageProc(curPage){
	    $('input[name=currentPage]').val(curPage);
	    $('form[name=frmPage]').submit();   
	 }
</script>

<div class="addressBookEditModal" id="topNavButton">
	<div class="editModal_content">
		<form name="frmBookWrite" action="#">
			<div id="bookWriteDiv">
					<h4>주소록 수정</h4>
					<p>설명을 어쩌규 저쩌구 할것임 ㅇㅇ</p>
					<div id="userNameInputDiv" class="boxDiv">
						<label>이름</label><span class="splitSpan">:</span>
						<input type="text" name="addressBook_name" id="addressBook_name" class="inputItems">
					</div>
					<div id="telInputDiv" class="boxDiv">
						<label>번호</label><span class="splitSpan">:</span>
						<input type="text" name="addressBook_tel" id="addressBook_tel" class="inputItems"><br>
						<span class="infoSpan">※ 하이픈(-) 없이 입력하세요.(예: 01033338888)</span>
					</div>
					<div id="emailInputDiv" class="boxDiv">
						<label>메일</label><span class="splitSpan">:</span>
						<input type="text" name="addressBook_maile" id="addressBook_maile" class="inputItems">
					</div>
					<div id="InputDiv" class="boxDiv">
						<label>부서</label><span class="splitSpan">:</span>
						<select name="boooo" id="" class="selectItem">
							<option>부서1</option>
							<option>부서2</option>
						</select>
					</div>
					<div id="positionInputDiv" class="boxDiv">
						<label>직급</label><span class="splitSpan">:</span>
						<select name="boooo" id="" class="selectItem">
							<option>사원</option>
							<option>팀장</option>
							<option>관리자</option>
							<option>관리자</option>
						</select>
						
					</div>
					<div id="btnItems">
						<input type="submit" id="bookWriteSubmit" value="수정">
						<button class="bookCancleBtn">취소</button>
					</div>
			</div>
		</form>
	</div>
</div>
	
	<div id="bookMainDiv">
		<h3>주소록</h3>
		<br>
		<div id="searchDiv">
			<form name="frmSearch" method="post" 
	         action='<c:url value="/addressBook/addressBookMain?empNo=${param.empNo }"/>'>
				<select name="searchCondition" id="searchCondition">
					<option value=""></option>
					<option value="addressBook_name"
					<c:if test="${param.searchCondition == 'addressBook_name' }">               
		                  selected="selected"
		            </c:if>
		            >이름</option>
					<option value="addressBook_tel"
					<c:if test="${param.searchCondition == 'addressBook_tel' }">               
		                  selected="selected"
		            </c:if>
		            >전화번호</option>
					<option value="addressBook_maile"
					<c:if test="${param.searchCondition == 'addressBook_maile' }">               
		                  selected="selected"
		            </c:if>
		            >이메일</option>
				</select>
				<input type="text" name="searchKeyword" id="searchTextBox" value="${param.searchKeyword }">
				<input type="submit" value="검색">
			</form>
		</div>
		<!-- 페이징 처리를 위한 form -->
		<form action="<c:url value='/addressBook/addressBookMain?empNo=${param.empNo}'/>" 
		   name="frmPage" method="post" id="frmPage" hidden="hidden">
		   <input type="hidden" name="empNo" value="${empNo }"><br>
		   <input type="hidden" name="currentPage" value=${pagingInfo.currentPage }><br>
		   <input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
		   <input type="hidden" name="searchKeyword" value="${param.searchKeyword}"><br>   
		</form>
		
		<div id="serviceDiv">
			<button id="deleteBtn">삭제</button>
		</div>
		<table>
		    <colgroup>
		       <col style="width:5%;" />
		       <col style="width:22%;" />
		       <col style="width:22%;" />
		       <col style="width:22%;" />
		       <col style="width:20%;" />      
		       <col style="width:14%;" />      
		    </colgroup>
	        <thead>
			    <tr id="thStyle">
		            <th><input type="checkbox" name="chkAllMain" id="chkAllMain"></th>
		            <th><span style="padding-left: 15px;">이름</span></th>
		            <th>전화번호</th>
		            <th>이메일</th>
		            <th>부서</th>
		            <th>직급</th>
			    </tr>
	        </thead>
	        <tbody>
		        <c:forEach var="bookVo" items="${bookList }">
				    <tr class="tdStyle">
			            <td><input type="checkbox" class="chkBox"> </td>
			            <td id="userNameTd" class="userNameClick">
			            	<span id="userNameSpan">${bookVo.addressBookName }</span> 
		            	</td>
		            	<c:set var="hp" value="${bookVo.addressBookTel }"></c:set>
			           	<td class="telTd" >${fn:substring(hp,0,3)}-${fn:substring(hp,4,8)}-${fn:substring(hp,9,12)}</td>
			            <td class="emailTd" >${bookVo.addressBookMaile }</td>
			            <td class="" >사원</td>
			            <td class="position" >${bookVo.addressBookPosition }</td>
				    </tr>
			    </c:forEach>
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