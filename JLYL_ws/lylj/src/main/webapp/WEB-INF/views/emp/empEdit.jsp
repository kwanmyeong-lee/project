<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 카카오우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function bt_zipcode(){
		 new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("dong").value = extraAddr;
                
                } else {
                    document.getElementById("dong").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('empZipcode').value = data.zonecode;
                document.getElementById("empAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("empAddressdetail").focus();
            }
        }).open();
	}
	
	$(function(){
		/* modal */
		$('#bt_edit').click(function(){
			$('#editModal').modal('show');
		});
		
		$('#bt_editOk').click(function(){
			if($('#empTel').val().length<1){
				alert('핸드폰번호를 입력하세요');
				$('#editModal').modal('hide');
				$('#empTel').focus();
				event.preventDefault();
				return false;
			}else if($('#empEmail').val().length<1){
				alert('이메일주소를 입력하세요');
				$('#editModal').modal('hide');
				$('#empEmail').focus();
				event.preventDefault();
				return false;
			}else if($('#empAddress').val().length<1){
				alert('주소를 입력하세요');
				$('#editModal').modal('hide');
				$('#empEmail').focus();
				event.preventDefault();
				return false;
			}else if($('#empAddressdetail').val().length<1){
				alert('상세주소 입력하세요');
				$('#editModal').modal('hide');
				$('#empAddressdetail').focus();
				event.preventDefault();
				return false;
			}else if($('#empSalary').val().length<1){
				alert('급여를 입력하세요');
				$('#editModal').modal('hide');
				$('#empSalary').focus();
				event.preventDefault();
				return false;
			}else if($('#empAccount').val().length<1){
				alert('계좌번호를 입력하세요');
				$('#editModal').modal('hide');
				$('#empAccount').focus();
				event.preventDefault();
				return false;
			}else if($('#modalEmpPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				event.preventDefault();
				return false;
			}else{
				$('#editModal').modal('hide');
				
				var modalEmpNo = $('#modalEmpNo').val();
				var modalEmpPwd = $('#modalEmpPwd').val();
				var loginEmpNo = $('#loginEmpNo').val();
				
				$('#mEmpNo').val(modalEmpNo);
				$('#mEmpPwd').val(modalEmpPwd);
				$('#hiLoginEmpNo').val(loginEmpNo);
				
				$('form[name=frmEdit_to]').prop('action','<c:url value="/emp/empEdit"/>');
				$('form[name=frmEdit_to]').submit();
				
			}
			
		});
		
		$('#bt_changePwd').click(function(){
			$('#changePwdModal').modal('show');
			$('#empPwd').val("");
			$('#CheckChangePwd').val("");
		});
	});
	
	/* 핸드폰번호 - 자동생성 */
	function chkHp(obj) { 
		var number = obj.value.replace(/[^0-9]/g, ""); 
		var phone = ""; 
		if(number.length < 4) { 
			return number; 
		} else if(number.length < 7) { 
			phone += number.substr(0, 3); 
			phone += "-"; 
			phone += number.substr(3);
		} else if(number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-"; phone += number.substr(3, 3);
			phone += "-"; phone += number.substr(6);
		} else { 
			phone += number.substr(0, 3); 
			phone += "-"; 
			phone += number.substr(3, 4); 
			phone += "-"; phone += number.substr(7); 
		} 
			obj.value = phone; 
	}
	
	
	/* 비밀번호 유효성 알림 */
	$(function(){
		$("#CheckChangePwd").keyup(function(){
			if($('#changeEmpPwd').val().length>8){
			 	if($('#changeEmpPwd').val()!=$('#CheckChangePwd').val()){
			 		$('#checkPwd2').html('');
			 		$('#checkPwd2').html('비밀번호가 일치하지 않습니다.');
			 	}else{
			 		$('#checkPwd2').html('');
			 		$('#checkPwd2').html('비밀번호가 일치합니다.');
			 	}
			}
		});
	});

	
	/* 비밀번호체크 ajax */
	function pwdCheck(changeEmpPwd){
		$.ajax({
			url:"<c:url value='/emp/pwdCheck'/>",
			type:"POST",
			data: {empPwd:changeEmpPwd},
			success:function(res){
				if(res==true){
					$('#checkPwd').html("유효합니다.");
				}else{
					$('#checkPwd').html("최소 8자, 최소 하나의 문자가 포함되어야 합니다.");
					
				}
			},
			error:function(xhr,status,error){
				alert("ajax에러");
			}
		});
	}
</script>

<style type="text/css">
 .mainPanel{
    margin-left: 120px;
 	width: 1100px;
 	padding: 20px;
 	background: white;
 }
 
 .mainPanel label{
 	font-weight: bold;
 }
#btZipcode{
	margin-top: 30px;
}
.btGroup{
	text-align: center;
}
.btChangePwd{
	margin-top: 30px;
}
.red{
	color: red;
}
#ofName{
	color: blue;
	margin-left: 100px;
	font-size: 0.9em;
}
.modalPWd{
	color: blue;
	font-size: 0.9em;
}
</style>

	<div class="panel mainPanel">
		<h4>사원정보수정</h4>
		<hr>

		<!-- 사원수정 form -->
		<form class="row g-3" name="frmEdit_to" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mEmpNo" id="mEmpNo" >
			<input type="hidden" name="mEmpPwd" id="mEmpPwd" >
			<input type="hidden" name="empNo" value="${empVo.empNo }" >
			<input type="hidden" name="loginEmpNo" id="hiLoginEmpNo">
		   <div></div>
		   <div class="row">
			  <div class="col-md-6">
			  	<label for="empName" class="form-label">이름</label>
			    <input type="text" class="form-control" id="empName" name="empName" value="${empVo.empName }" readonly="readonly">
			  	<c:if test="${empVo.empNo == sessionScope.empNo }">
			  		<button type="button" class="btn btn-secondary btChangePwd" id="bt_changePwd">비밀번호변경하기</button>
			  	</c:if>
			  </div>
		   </div>
		   <div></div>
	  		 <div class="col-md-6">
	    		<label for="empTel" class="form-label">핸드폰번호</label>
	    		<input type="tel" class="form-control" id="empTel" name="empTel" onkeyup="chkHp(this)" value="${empVo.empTel }">
	  		</div>
			 <div class="col-md-6">
	    		<label for="empEmail" class="form-label">Email</label>
	    		<input type="email" class="form-control" id="empEmail" name="empEmail" value="${empVo.empEmail }" >
	  		</div>
	  	  	<div class="col-md-11">
				<label for="empPhoto" class="form-label">사진첨부</label>
			    <input type="file" class="form-control" id="empPhotoUrl" name="uploadFile" value="${empVo.empPhoto }" accept=".gif, .jpg, .png">
			    <input type="hidden" id="ofName" name="oldFileName" value="${empVo.empPhoto }">
		  	</div>
	  		<div class="col-md-6">
	    		<label for="empZipcode" class="form-label">우편번호</label>
	    		<input type="text" class="form-control sample6_postcode" id="empZipcode" name="empZipcode" value="${empVo.empZipcode }" aria-label="zipcode"  readonly="readonly">
	  		</div>
	  		<div class="col-md-4">
		  		<input type="button" class="btn btn-secondary" onclick="bt_zipcode()" id="btZipcode" value="우편번호 찾기">
		  	</div>

		  	<div class="col-md-8">
				<label for="empAddress" class="form-label">주소</label>
			    <input type="text" class="form-control" id="empAddress" name="empAddress"  value="${empVo.empAddress }" readonly="readonly">
		  	</div>
		  	<div></div>
		   	<div class="row">
		   		<div class="col-md-6">
					<label for="empAddressdetail" class="form-label">상세주소</label>
			    	<input type="text" class="form-control" id="empAddressdetail" name="empAddressdetail" value="${empVo.empAddress }" >
		  		</div>
		  		<div class="col-md-2">
					<label for="dong" class="form-label">(동/읍/면)</label>
			    	<input type="text" class="form-control" id="dong" placeholder="(동/읍/면)" readonly="readonly">
		  		</div>
		  	</div>
		 <div class="addInfo">	
		  	<div>
		  		<hr>
		  		<h5>추가정보</h5>
		  	</div>
		  	<div class="row">
			  	<div class="col-md-6">
					<label for="empRegdate" class="form-label">입사일</label>
				    <input type="text" class="form-control" id="empRegdate" name="empRegdate" placeholder="Regdate" value='<fmt:formatDate value="${empVo.empRegdate }" pattern="YYYY-MM-dd"/>' readonly="readonly">
			  	</div>
			  	<div class="col-md-6">
			  		<label for="empBirth" class="form-label">생일</label>
				    <input type="text" class="form-control" id="empBirth" name="empBirth" placeholder="birth day" value='<fmt:formatDate value="${empVo.empBirth }" pattern="YYYY-MM-dd"/>' readonly="readonly">
			  	</div>
		  	</div>
		  	<div><br></div>
		  	<div class="row">
			  	<div class="col-md-4">
					<label for="empSalary" class="form-label">봉급</label>
				    <input type="text" class="form-control" id="empSalary" name="empSalary" placeholder="Salary" value="${empVo.empSalary }" <c:if test="${sessionScope.empAdminLev==4 }">  readonly="readonly"</c:if>>
				    
			  	</div>
			   	<div class="col-md-4">
					<label for="empAccount" class="form-label">계좌번호</label>
				    <input type="text" class="form-control" id="empAccount" name="empAccount" placeholder="Account" value="${empVo.empAccount }" <c:if test="${sessionScope.empAdminLev==4 }">  readonly="readonly"</c:if>>
			  	</div>
		  	</div>
		  	<div><br></div>
		  	<div class="row">
				<div class="col-md-2">
					<label class="form-label">관리자</label>
				    <select class="form-control" name="empAdminLev" id="empAdminLev" <c:if test="${sessionScope.empAdminLev==4 }">  readonly="readonly"</c:if>>
				    	<option value="4" <c:if test="${empVo.empAdminLev==4}"> selected</c:if> 
				    	>일반</option>
				    	<option value="3" <c:if test="${empVo.empAdminLev==2}"> selected</c:if>
				    	>총무팀장</option>
				    	<option value="2" <c:if test="${empVo.empAdminLev==2}"> selected</c:if>
				    	>인사팀장</option>
				    	<option value="1" <c:if test="${empVo.empAdminLev==1}"> selected</c:if>
				    	>관리자</option>
				    </select>
			  	</div>
		  	  <div class="col-md-2">
			  	<label class="form-label" for="departmentNo">부서</label>
				    <select class="form-control" id="departmentNo" name="departmentNo" <c:if test="${sessionScope.empAdminLev==4 }">  readonly="readonly"</c:if> >
			    		<option value='1'
			    			<c:if test="${empVo.departmentNo=='1' }"> selected</c:if>
							>전략기획팀</option>
			    		<option value='2'
			    			<c:if test="${empVo.departmentNo=='2' }"> selected</c:if>
			    			>영업팀</option>
			    		<option value='3'
			    			<c:if test="${empVo.departmentNo=='3' }"> selected</c:if>
			    			>마케팅팀</option>
			    		<option value='4'
			    			<c:if test="${empVo.departmentNo=='4' }"> selected</c:if>
			    			>개발팀</option>
			    		<option value='5'
			    			<c:if test="${empVo.departmentNo=='5' }"> selected</c:if>
			    			>인사팀</option>
			    		<option value='6'
			    			<c:if test="${empVo.departmentNo=='6' }"> selected</c:if>
			    			>총무회계팀</option>
				    </select>
				</div>
				<div class="col-md-2">
				 	<label class="form-label" for="positionNo" >직급</label>
				    <select class="form-control" id="positionNo" name="positionNo" <c:if test="${sessionScope.empAdminLev==4 }"> readonly="readonly"</c:if>>
				    		<option value="1" 
				    			<c:if test="${empVo.positionNo=='1' }"> selected</c:if>
				    		>사장</option>
				    		<option value="2" 
				    			<c:if test="${empVo.positionNo=='2' }"> selected</c:if>
				    		>부장</option>
				    		<option value="3" 
				    			<c:if test="${empVo.positionNo=='3' }"> selected</c:if>
				    		>과장</option>
				    		<option value="4" 
				    			<c:if test="${empVo.positionNo=='4' }"> selected</c:if>
				    		>대리</option>
				    		<option value="5" 
				    			<c:if test="${empVo.positionNo=='5' }"> selected</c:if>
				    		>주임</option>
				    		<option value="6" 
				    			<c:if test="${empVo.positionNo=='6' }"> selected</c:if>
				    		>사원</option>
				    </select>
			 	</div>
			</div>
		</div>
			<div></div>
			<div class="btGroup">
				<button class="btn btn-secondary " type="button" id="bt_edit">수정</button>
				<a href="<c:url value='/emp/empInfo?empNo=${empVo.empNo}'/>"><button class="btn btn-secondary " type="button" >취소</button></a>
			</div>
		</form>
	</div>
	
	
	<!-- 수정확인 modal -->
	<div class="modal" id="editModal" data-bs-backdrop="static">
	  <div class="modal-dialog ">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">사원정보 수정</h4>
	        <button type="button" class="close" data-bs-dismiss="modal" id="modalClose">&times;</button>
	      </div>
	
	      <!-- Modal body -->
 		 <div class="modal-body">
 	        <div class="row">
			   	<span id ="red">정보를 수정하시겠습니까?<br></span>
			</div>
			<div></div>
		    <form name="frmEditModal" id="frmEditModal" method="post" action="">
     	        <div class="row">
     	        	<div class="col-md-12">
     		        	<label class="form-label modalLabel" for="empNo">사원번호 </label> 
	                	<input class="form-control" type="text" name="modalEmpNo" id="modalEmpNo" value="${empVo.empNo }" readonly="readonly">
	                </div>
                </div>
                <div class="row">
     	        	<div class="col-md-12">
     		        	<label class="form-label modalLabel" for="empNo">로그인 사원번호</label> 
	                	<input class="form-control" type="text" name="loginEmpNo" id="loginEmpNo" value="${sessionScope.empNo }" readonly="readonly">
	                </div>
                </div>
                <div class="row">
                	 <div class="col-md-12">
	                 	<label class="form-label modalLabel" for="modalEmpPwd">비밀번호</label> 
	                 	<input class="form-control" type="password" name="modalempPwd" id="modalEmpPwd">
	                 </div>
                </div>
                <br>
				<hr>
			<div class="row px-3 buttonGroup">
				<button type="button" class="btn btn-info" id="bt_editOk">수정</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btcloseModal">취소</button>
		    </div>
            </form>
		  </div>
	    </div>
	  </div>
	</div>
	
	<!-- 비밀번호 수정 modal -->
	<div class="modal" id="changePwdModal" data-bs-backdrop="static">
	  <div class="modal-dialog ">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호수정하기</h4>
	        <button type="button" class="close" data-bs-dismiss="modal" id="modalClose">&times;</button>
	      </div>
	
	      <!-- Modal body -->
 		 <div class="modal-body">
 	        <div class="row">
			   	<span >변경하실 비밀번호를 입력하세요<br><br></span>
			</div>
			<div></div>
		    <form name="frmChangePwd" id="frmChangePwd" method="post" action="<c:url value="/emp/changePwd"/>">
     	        <div class="row">
     	        	<div class="col-md-12">
     		        	<label class="form-label modalLabel" for="empNo">사원번호 </label> 
	                	<input class="form-control" type="text" name="empNo" id="empNo" value="${empVo.empNo }" readonly="readonly">
	                </div>
                </div>
                <div class="row">
	              	<div class="col-md-12">
	                	<label class="form-label modalLabel" for="empPwd">비밀번호</label> 
	                	<input class="form-control" type="password" name="empPwd" id="empPwd">
	                </div>
                </div>
                <div class="row">
	            	<div class="col-md-12">
		               	<label class="form-label modalLabel" for="modalEmpPwd">변경할 비밀번호</label> 
		               	<input class="form-control" type="password" name="changeEmpPwd" id="changeEmpPwd" oninput="pwdCheck(changeEmpPwd.value)">
		               	<span id="checkPwd" class="modalPWd"></span>
		            </div>
	            </div>
	            <div class="row">
		            <div class="col-md-12">
		               	<label class="form-label modalLabel" for="modalEmpPwd">변경할 비밀번호 확인</label> 
		               	<input class="form-control" type="password" name="CheckChangePwd" id="CheckChangePwd" >
		               	<span id="checkPwd2" class="modalPWd"></span>
		            </div>
	            </div>
                <br>
				<hr>
			 <div class="row px-3 buttonGroup">
				<button type="submit" class="btn btn-info" id="bt_changePwdOk">변경</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="bt_closeModal">취소</button>
		     </div>
            </form>
		  </div>
	    </div>
	  </div>
	</div>

<%@include file="../inc/bottom.jsp" %>