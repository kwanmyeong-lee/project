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
</style>

<script type="text/javascript">
	$(function() {
		$("tbody #btLeave").click(function(){
			$('#leaveModal').modal('show');
		});
	});
</script>
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
		</div>
		<table>
		    <colgroup>
		       <col style="width:5%;" />
		       <col style="width:18%;" />
		       <col style="width:18%;" />
		       <col style="width:18%;" />
		       <col style="width:20%;" />      
		       <col style="width:10%;" />      
		       <col style="width:11%;" />      
		    </colgroup>
	        <thead>
			    <tr id="thStyle">
		            <th><input type="checkbox" name="chkAllMain"></th>
		            <th>이름</th>
		            <th>전화번호</th>
		            <th>이메일</th>
		            <th>부서</th>
		            <th>직급</th>
		            <th>수정/삭제</th>
			    </tr>
	        </thead>
	        <tbody>
		        <c:forEach var="i" begin="1" end="20">
				    <tr id="tdStyle">
			            <td><input type="checkbox"> </td>
			            <td id="userNameTd"><img src="<c:url value='/resources/img/undraw_profile.svg'/>"> <span id="userNameSpan">테스트</span></td>
			           	<td id="telTd" >010-3333-8888</td>
			            <td id="emailTd" >yooh0201@gmail.com</td>
			            <td id="" >웹 백엔드</td>
			            <td id="" >사원</td>
			            <td id="" >
			            	<a href="<c:url value="/emp/empEdit"/>"><button type="button" class="btn btn-success" value="수정"><i class="fas fa-user-edit"></i></button></a>
			            	<button type="button" class="btn btn-danger" id="btLeave" value="삭제"><i class="fas fa-user-minus"></i></button>
			            </td>
				    </tr>
			    </c:forEach>
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
		    <form name="findPwdfrm" id="findPwdfrm" method="post" action="<c:url value="/emp/leaveEmp"/>">
     	        <div class="row">
     	        	<div class="col-md-12">
     		        	<label class="form-label modalLabel" for="empNo">사원번호</label> 
	                	<input class="form-control" type="text" name="empNo" id="modalEmpNo" placeholder="Enter employee number">
	                </div>
                </div>
                <div class="row">
                	 <div class="col-md-12">
	                 	<label class="form-label modalLabel" for="modalEmpEmail">관리자번호</label> 
	                 	<input class="form-control" type="email" name="empEmail" id="modalEmpEmail" name="empName" value="${empNo }" readonly="readonly">
	                 </div>
                </div>
                <div class="row">
                	 <div class="col-md-12">
	                 	<label class="form-label modalLabel" for="modalAdminPwd">관리자비밀번호</label> 
	                 	<input class="form-control" type="email" name="empEmail" id="modalAdminPwd" name="empPwd" placeholder="Enter password">
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