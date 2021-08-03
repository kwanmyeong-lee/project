<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/resources/css/addressBook/style.css'/>">
<style type="text/css">
#topNavButton {
	margin-left: 11px;
}

#red {
	font-size: 1.1em;
	color: red;
	font-weight: bold;
}

.modalLabel {
	margin-left: 10px;
}

.buttonGroup {
	width: 300px;
	padding: 5px;
	margin-left: 75px;
}

#btcloseModal {
	margin-top: 10px;
}

#emptyList td {
	color: blue;
	font-weight: bold;
}

.searchBox {
	width: 100%;
	margin-left: 40px;
}

.textBox {
	width: 300px;
	float: left;
}

.searchBox select {
	text-align-last: center;
	text-align: center;
}

.frmSearch {
	width: 500px;
}

.selectSearch {
	float: left;
}

#btn_search {
	height: 38px;
}

#listAll {
	float: right;
	margin-right: 44px;
}

#pagingDiv {
	float: left;
	margin-left: 40px;
}
</style>

<script type="text/javascript">
	$(function() {
		$("tbody #btLeave").click(function(){
			$('#leaveModal').modal('show');
			$('#modalAdminPwd').val("");
			var delEmpNo = $(this).parent().prev().prev().prev().prev().prev().text();	
			$('#modalEmpNo').val(delEmpNo);
			
		});
		
		$('#btn_search').click(function(){
			console.log('검색');
			if($('select[name=searchCondition]').val()=='' || $('select[name=searchCondition]').val()==null){
				alert('검색조건을 선택하세요');
				event.preventDefault();
				return false;
			}
		});
		
		
		$('#btdeleteModal').click(function(){
			if($('#modalAdminPwd').val().length<1){
				alert("관리자 비밀번호를 입력하세요");
				$('#modalAdminPwd').focus();
				event.preventDefault();
				return false;
			}
		});
		
	});
	
	function pagingProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
</script>

<div id="bookMainDiv">
	<h3>사원목록</h3>
	<br>
	<div class="input-group mb-4 searchBox">
		<form class="frmSearch" name="frmSearch" method="post"
			action='<c:url value="/emp/empList"/>'>
			<div class="col-md-3 selectSearch">
				<select class="form-control" name="searchCondition">
					<option value="">-선택-</option>
					<option value="emp_Name">이름</option>
					<option value="emp_Tel">전화번호</option>
					<option value="emp_Email">이메일</option>
					<option value="department_Name">부서</option>
					<option value="position_Name">직급</option>
				</select>
			</div>
			<input type="text" class="form-control select2-offscreen textBox"
				placeholder="Search keyword" id="searchBox" name="searchKeyword">
			<button class="btn_ btn-primary btn-sm" type="submit" id="btn_search">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
	<table>
		<colgroup>
			<col style="width: 15%;" />
			<col style="width: 9%;" />
			<col style="width: 15%;" />
			<col style="width: 15%;" />
			<col style="width: 15%;" />
			<col style="width: 12%;" />
			<col style="width: 15%;" />
		</colgroup>
		<thead>
			<tr id="thStyle">
				<th>이름</th>
				<th>사원번호</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>부서</th>
				<th>직급</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty empList }">
				<tr id="emptyList">
					<td colspan="6"></td>
				</tr>
			</c:if>
			<c:if test="${!empty empList }">
				<c:forEach var="empVo" items="${empList }">
					<tr id="tdStyle">
						<td id="userNameTd"><img
							src="<c:url value ="/resources/emp_images/${empVo.empPhoto }"/>"
							class="rounded-circle" style="width: 35px; height: 35px; object-fit: cover; object-position: 100% 0;" ><span
							id="userNameSpan"><a
								style="text-decoration: none; color: #858796;"
								href="<c:url value="/emp/empInfo?empNo=${empVo.empNo }"/>">${empVo.empName }</a></span></td>
						<td id="empNoTd" name="">${empVo.empNo }</td>
						<td id="telTd">${empVo.empTel }</td>
						<td class="emailTd" id="emailTd<>">${empVo.empEmail }</td>
						<td id="">${empVo.departmentName }</td>
						<td id="">${empVo.positionName }</td>
						<td id=""><a
							href="<c:url value="/emp/empEdit?empNo=${empVo.empNo }"/>"><button
									type="button" class="btn btn-success" value="수정">
									<i class="fas fa-user-edit"></i>
								</button></a>
							<button type="button" class="btn btn-danger" id="btLeave"
								value="삭제">
								<i class="fas fa-user-minus"></i>
							</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- 페이징 -->
	<!-- 페이징 처리 form -->
	<form action="<c:url value='/emp/empList'/>" name="frmPage"
		method="post">
		<span><input type="hidden" name="currentPage"> <input
			type="hidden" name="searchCondition" value="${param.searchCondition}">
			<input type="hidden" name="searchKeyword"
			value="${param.searchKeyword }"> </span>
	</form>
	<div id="pagingDiv">
		<ul class="pagination">
			<c:if test="${pagingInfo.firstPage>1 }">
				<li class="page-item"><a class="page-link" href="#"
					onclick="pagingProc(${pagingInfo.firstPage-1})">이전</a></li>
			</c:if>

			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pagingProc(${i})" style="color: blue;">${i }</a></li>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<li class="page-item"><a class="page-link" href="#"
						onclick="pagingProc(${i})">${i }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
				<li class="page-item"><a class="page-link" href="#"
					onclick="pagingProc(${pagingInfo.lastPage+1})">다음</a></li>
			</c:if>
		</ul>
	</div>
	<a href="<c:url value="/emp/empList"/>"><button type="button"
			class="btn_ btn-primary btn-sm" id="listAll">전체목록</button></a>
</div>

<!-- 퇴사등록 Modal -->
<div class="modal" id="leaveModal" data-bs-backdrop="static">
	<div class="modal-dialog ">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">사원정보삭제</h4>
				<button type="button" class="close" data-bs-dismiss="modal"
					id="modalClose">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form name="findPwdfrm" id="findPwdfrm" method="post"
					action="<c:url value="/emp/leaveEmp"/>">
					<div class="row">
						<div class="col-md-12">
							<label class="form-label modalLabel" for="empNo">사원번호</label> <input
								class="form-control" type="text" name="modalEmpNo"
								id="modalEmpNo" placeholder="Enter employee number"
								readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label class="form-label modalLabel" for="modalEmpEmail">관리자번호</label>
							<input class="form-control" type="email" name="modalAdmin"
								id="adminEmpNo" value="${sessionScope.empNo }"
								readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label class="form-label modalLabel" for="modalAdminPwd">관리자비밀번호</label>
							<input class="form-control" type="password" name="modalAdminPwd"
								id="modalAdminPwd" placeholder="Enter password">
						</div>
					</div>
					<br>
					<div class="row px-3">
						<span id="red">사원정보가 삭제됩니다. 신중히 클릭해주세요.</span>
					</div>
					<hr>
					<div class="row px-3 buttonGroup">
						<button type="submit" class="btn btn-info" id="btdeleteModal">삭제</button>
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal" id="btcloseModal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>