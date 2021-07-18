<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<style type="text/css">
#topNavButton{
	margin-left: 11px;
}
#red{
	font-size: 1.1em;
	color: red;
	font-weight: bold;
}
.modalLabel{
	margin-left: 10px;
}
.buttonGroup{
	width: 300px;
	padding: 5px;
	margin-left: 75px;
}
#btcloseModal{
	margin-top: 10px;
}
#emptyList td{
	color : blue;
	font-weight: bold;
}
.searchBox{
	width: 500px;
	margin-left: 40px;
}
.searchBox select{
	text-align-last: center;
   	text-align: center;
}
</style>

<script type="text/javascript">
	$(function() {
		$("tbody #btLeave").click(function(){
			$('#leaveModal').modal('show');
			var delEmpNo = $(this).parent().prev().prev().prev().prev().prev().text();	
			$('#modalEmpNo').val(delEmpNo);
			
		});
		
	});
</script>
	<div id="bookMainDiv">
		<h3>사원목록</h3>
		<br>
		<div class="input-group mb-4 searchBox">
			<div class="col-md-3 center">
				<select class="form-control">
					<option>-선택-</option>
					<option>이름</option>
					<option>전화번호</option>
					<option>이메일</option>
					<option>부서</option>
					<option>직급</option>
				</select>
			</div>
			<input type="text" class="form-control select2-offscreen textBox" placeholder="Search keyword" id="searchBox">
			<button class="btn_ btn-primary btn-sm" type="button" id="btn_search"><i class="fa fa-search"></i></button>
			</div>
		<table>
		    <colgroup>
		       <col style="width:5%;" />
		       <col style="width:15%;" />
		       <col style="width:9%;" />
		       <col style="width:15%;" />
		       <col style="width:15%;" />
		       <col style="width:15%;" />      
		       <col style="width:12%;" />      
		       <col style="width:15%;" />      
		    </colgroup>
	        <thead>
			    <tr id="thStyle">
		            <th><input type="checkbox" name="chkAllMain"></th>
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
				            <td><input type="checkbox" id="multiSelect"> </td>
				            <td id="userNameTd"><img src="<c:url value='/resources/img/undraw_profile.svg'/>"> <span id="userNameSpan">${empVo.empName }</span></td>
				            <td id="empNoTd" name="">${empVo.empNo }</td>
				           	<td id="telTd" >${empVo.empTel }</td>
				            <td class="emailTd" id="emailTd<>">${empVo.empEmail }</td>
				            <td id="" >${empVo.departmentName }</td>
				            <td id="" >${empVo.positionName }</td>
				            <td id="" >
				            	<a href="<c:url value="/emp/empEdit?empNo=${empVo.empNo }"/>"><button type="button" class="btn btn-success" value="수정"><i class="fas fa-user-edit"></i></button></a>
				            	<button type="button" class="btn btn-danger" id="btLeave" value="삭제"><i class="fas fa-user-minus"></i></button>
				            </td>
					    </tr>
					 </c:forEach>
				</c:if>
	        </tbody>
		</table>
		
	<div id="pagingDiv">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
	</div>
	
	<!-- 퇴사등록 Modal -->
	<div class="modal" id="leaveModal" data-bs-backdrop="static">
	  <div class="modal-dialog ">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">사원정보삭제</h4>
	        <button type="button" class="close" data-bs-dismiss="modal" id="modalClose">&times;</button>
	      </div>
	
	      <!-- Modal body -->
 		 <div class="modal-body">
		    <form name="findPwdfrm" id="findPwdfrm" method="post" action="<c:url value="/emp/leaveEmp?empNo="/>">
     	        <div class="row">
     	        	<div class="col-md-12">
     		        	<label class="form-label modalLabel" for="empNo">사원번호</label> 
	                	<input class="form-control" type="text" name="empNo" id="modalEmpNo" placeholder="Enter employee number">
	                </div>
                </div>
                <div class="row">
                	 <div class="col-md-12">
	                 	<label class="form-label modalLabel" for="modalEmpEmail">관리자번호</label> 
	                 	<input class="form-control" type="email" name="empEmail" id="modalEmpEmail" name="empName" value="${sessionScope.empNo }" readonly="readonly">
	                 </div>
                </div>
                <div class="row">
                	 <div class="col-md-12">
	                 	<label class="form-label modalLabel" for="modalAdminPwd">관리자비밀번호</label> 
	                 	<input class="form-control" type="email" name="empEmail" id="modalAdminPwd" name="empPwd" placeholder="Enter password" readonly="readonly">
	                 </div>
                </div>
                <br>
			<div class="row px-3">
			   	<span id ="red">사원정보가 삭제됩니다. 신중히 클릭해주세요.</span>
			</div><hr>
			<div class="row px-3 buttonGroup">
				<button type="submit" class="btn btn-info" id="btfindPwd">찾기</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btcloseModal">취소</button>
		    </div>
            </form>
		  </div>
	    </div>
	  </div>
	</div>	

<%@ include file="../inc/bottom.jsp" %>