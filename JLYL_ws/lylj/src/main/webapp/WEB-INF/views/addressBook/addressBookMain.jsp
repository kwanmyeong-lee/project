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
		$('.tdStyle').hover(function(){
			$(this).css("background","rgb(240, 240, 240)");
		}, function(){
			$(this).css("background","none");
		});
		
		$(".userNameClick").click(function() {
			$(".addressBookEditModal").fadeIn();
		});
		$(".bookCancleBtn").click(function() {
			$(".addressBookEditModal").hide();
		});
		
		/*전체 선택 처리*/
		$('#userNameTd').click(function(){
			$('#tdStyle td input[type=checkbox]').prop('checked',this.checked);			
		});
		
	});
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
						<input type="text" name="addressBook_tel" id="addressBook_tel" class="inputItems">
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
			<select>
				<option></option>
				<option>이름</option>
				<option>전화번호</option>
				<option>이메일</option>
				<option>부서</option>
				<option>직급</option>
			</select>
			<input type="text" id="searchTextBox">
			<input type="submit" value="검색">
		</div>
		<div id="serviceDiv">
			<button id="deleteBtn">삭제</button>
			<button id="addMail">메일발송</button>
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
		            <th>이름</th>
		            <th>전화번호</th>
		            <th>이메일</th>
		            <th>부서</th>
		            <th>직급</th>
			    </tr>
	        </thead>
	        <tbody>
		        <c:forEach var="i" begin="1" end="20">
				    <tr class="tdStyle">
			            <td><input type="checkbox" class="chkBox"> </td>
			            <td id="userNameTd" class="userNameClick">
			            	<img src="<c:url value='/resources/img/undraw_profile.svg'/>"> 
			            	<span id="userNameSpan">테스트</span> 
		            	</td>
			           	<td id="telTd" >010-3333-8888</td>
			            <td id="emailTd" >yooh0201@gmail.com</td>
			            <td id="" >웹 백엔드</td>
			            <td id="" >사원</td>
				    </tr>
			    </c:forEach>
	        </tbody>
		</table>
		
		<div id="pagingDiv">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
	</div>

<%@ include file="../inc/bottom.jsp" %>