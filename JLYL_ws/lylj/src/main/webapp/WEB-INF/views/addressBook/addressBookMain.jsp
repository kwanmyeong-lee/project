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
		/* 취소 버튼 */
		$(".bookCancleBtn").click(function() {
			$(".addressBookModal").hide();
		});
		
		/* 등록 유효성 */
		$('#bookWriteSubmit').click(function(){
			var telRules = /^\d{2,3}-\d{3,4}-\d{4}$/;
			var ofTelRules = /^\d{2,3}-\d{3,4}-\d{4}$/;
			
			if($('#addressBookName').val() == ''){
				alert('이름을 입력하세요.');
				return false;
			}else if($('#addressBookTel').val() == ''){
				alert('번호를 입력하세요.');
				return false;
			}else if($('#addressFolderNo').val() == ''){
				alert('카테고리를 선택하세요.');
				return false;
			}else if(!telRules.test($('#addressBook_tel1').val())){
				alert('잘못된 \'전화번호\'입니다. 숫자, -를 포함한 숫자만 입력하세요.');
				$('#addressBook_tel').focus();
				return false;
			}else if($('#addressBook_officeTel1').val().length > 0){
				if(!ofTelRules.test($('#addressBook_officeTel1').val())){
					alert('잘못된 \'회사번호\'입니다. 숫자, -를 포함한 숫자만 입력하세요.');
					$('#addressBook_officeTel').focus();
					return false;
				}
			}
		});
		
		
		/* 카테고리 수정 클릭 이벤트 */
		$('.folBtn').click(function(){
			window.open('<c:url value="/bookFolInfo/main"/>','카테고리 정보','width=600, height=470, toolbar=no, menubar=no, scrollbars=no, resizable=no');
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
		
		/* 삭제 버튼 */
		$('#deleteBtn').click(function(){
			var confirm1 = confirm('선택한 주소록을 삭제하시겠습니까?');
			if(!confirm1){
				return false;
			}else{
				folderDeleteClick();
			}
		});
		
	});
	/* 페이징 처리 */
	function pageProc(curPage){
	    $('input[name=currentPage]').val(curPage);
	    $('form[name=frmPage]').submit();   
	 }
	
	/* 선택 삭제 */
	function folderDeleteClick(){
	    var checkBoxArr = []; 
	    $("tbody td input[type=checkbox]:checked").each(function() {
	    checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 담기
	    console.log(checkBoxArr);
	})

	    $.ajax({
	        type: "POST",
	        url: "<c:url value='/addressBook/delete'/>",
	        data: {
	        checkBoxArr : checkBoxArr        // folder seq 값을 가지고 있음.
	        },
	        success: function(result){
	      	  location.reload();
	        },
	        error: function(xhr, status, error) {
	      	  alert('주소록을 선택하지 않거나, 삭제 처리 중 오류가 발생하였습니다.');
	       }  
	    });
	} 
</script>

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
				<option value="addressBook_officeName"
				<c:if test="${param.searchCondition == 'addressBook_officeName' }">               
	                  selected="selected"
	            </c:if>
	            >회사</option>
			</select>
			<input type="text" name="searchKeyword" id="searchTextBox" value="${param.searchKeyword }">
			<button type="submit" class="btn btn-outline-secondary" style="height: 32px;padding: 0 20px;">검색</button>
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
		<button id="deleteBtn" type="button">삭제</button>
	</div>
	<table>
	    <colgroup>
	       <col style="width:5%;" />
	       <col style="width:17.5%;" />
	       <col style="width:10%;" />
	       <col style="width:15%;" />
	       <col style="width:10%;" />
	       <col style="width:12.5%;" />
	       <col style="width:15%;" />      
	       <col style="width:18%;" />      
	    </colgroup>
        <thead>
		    <tr id="thStyle">
	            <th><input type="checkbox" name="chkAllMain" id="chkAllMain"></th>
	            <th><span style="padding-left: 15px;">이름</span></th>
	            <th>전화번호</th>
	            <th>이메일</th>
	            <th>직위</th>
	            <th>회사</th>
	            <th>회사번호</th>
	            <th>카테고리</th>
		    </tr>
        </thead>
        <tbody>
	        <c:forEach var="map" items="${bookList }">
			    <tr class="tdStyle">
		            <td><input type="checkbox" class="chkBox" value="${map['ADDRESSBOOK_NO']}"> </td>
		            <td id="userNameTd" class="userNameClick">
		            	<c:if test="${map['ADDRESSBOOK_GENDER'] == null}">
		            		<img alt="" src="<c:url value='/resources/img/profile_o.jpg'/>">
		            	</c:if>
		            	<c:if test="${map['ADDRESSBOOK_GENDER'] == '남자'}">
		            		<img alt="남자" src="<c:url value='/resources/img/profile_m.png'/>">
		            	</c:if>
		            	<c:if test="${map['ADDRESSBOOK_GENDER'] == '여자'}">
		            		<img alt="여자" src="<c:url value='/resources/img/profile_f.png'/>">
		            	</c:if>
		            	<a href="<c:url value='/addressBook/addressBookEdit?addressBookNo=${map["ADDRESSBOOK_NO"]}'/>" id="nameA">${map['ADDRESSBOOK_NAME']}</a> 
	            	</td>
		           	<td class="telTd" >${map['ADDRESSBOOK_TEL']}</td>
		            <td class="emailTd" >${map['ADDRESSBOOK_MAILE']}</td>
		            <td class="positionTd" >${map['ADDRESSBOOK_POSITION']}</td>
		            <td class="officeNameTd" >${map['ADDRESSBOOK_OFFICENAME']}</td>
		           	<td class="officeTelTd" >${map['ADDRESSBOOK_OFFICETEL']}</td>
		            <td class="bookFolTd" >${map['ADDRESS_FOLDER_NAME']}</td>
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