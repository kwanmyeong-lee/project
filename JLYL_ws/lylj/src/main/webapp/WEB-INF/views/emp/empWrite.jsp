<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 카카오우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		/* 전체 유효성검사 */
		$('#btAddEmp').click(function(){
	          if($('#empName').val().length<1){
	             alert('이름을 입력하세요');
	             $('#empName').focus();
	             event.preventDefault();
	          }else if($('#empPwd').val().length<1){
	             alert('비밀번호를 입력하세요.');
	             $('#empPwd').focus();
	             event.preventDefault();
	          }else if($('#empPwd').val().length<8){
		         alert('비밀번호는 8자리, 최소 하나의 문자가 포함되어야 합니다.');
		         $('#empPwd').focus();
		         event.preventDefault();
	          }else if($('#empPwd').val()!=$('#chkPwd').val()){
		         alert('비밀번호 확인해주세요!!');
		         $('#chkPwd').focus();
		         event.preventDefault(); 
		      }else if($('#empPwd').val()!=$('#chkPwd').val()){
		         alert('비밀번호 확인해주세요!!');
		         $('#chkPwd').focus();
		         event.preventDefault();
			  }else if($('#empTel').val().length<1){
				  alert('전화번호를 입력하세요');
			      $('#empTel').focus();
			      event.preventDefault();
			  }else if($('#empEmail').val().length<1){
				  alert('이메일입력하세요');
			      $('#empEmail').focus();
			      event.preventDefault(); 
			  }else if($('#empPhoto').val().length<1){
				  alert('사진을업로드해주세요');
			      $('#empPhoto').focus();
			      event.preventDefault(); 
			  }else if($('#empZipcode').val().length<1){
				  alert('주소를 입력하세요');
			      $('#empAddress').focus();
			      event.preventDefault(); 
			  }else if($('#empAddressdetail').val().length<1){
				  alert('상세주소를 입력하세요');
			      $('#empAddressdetail').focus();
			      event.preventDefault(); 
			  }else if($('#empRegdate').val().length<1){
				  alert('입사일을 등록하세요');
			      $('#empRegdate').focus();
			      event.preventDefault(); 
			  }else if($('#empBirth').val().length<1){
				  alert('사원 생일을 등록하세요');
			      $('#empBirth').focus();
			      event.preventDefault(); 
			  }else if($('#empSalary').val().length<1){
				  alert('급여를 등록하세요');
			      $('#empSalary').focus();
			      event.preventDefault(); 
			  }else if($('#empAccount').val().length<1){
				  alert('계좌번호를 입력하세요');
			      $('#empAccount').focus();
			      event.preventDefault(); 
			  }else if($('#empSalary').val().length<1){
				  alert('급여를 등록하세요');
			      $('#empSalary').focus();
			      event.preventDefault(); 
			  }else if($('#empAdminLev').val()==0){
				  alert('관리권한을 선택하세요');
			      $('#empAdminLev').focus();
			      event.preventDefault(); 
			  }else if($('#departmentNo').val()==0){
				  alert('부서를 선택하세요');
			      $('#departmentNo').focus();
			      event.preventDefault(); 
			  }else if($('#positionNo').val()==0){
				  alert('직급을 선택하세요');
			      $('#positionNo').focus();
			      event.preventDefault(); 
			  }
	          
	  		/* 스플릿하여 이미지확장자가 아닐 시 alert 해주기 */
	  		if( $("#empPhoto").val() != "" ){
	  			var ext = $('#empPhoto').val().split('.').pop().toLowerCase();
	  		     if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
	  				 alert('이미지 파일만 업로드 할수 있습니다.');
				      $('#empPhoto').focus();
				      event.preventDefault(); 
	  				 return false;
	  			}
	  		}
	      
		});
		
		/* 비밀번호 유효성 알림 */
		$("#chkPwd").keyup(function(){
			if($('#empPwd').val().length>8){
			 	if($('#empPwd').val()!=$('#chkPwd').val()){
			 		$('#pwdInfo1').html('');
			 		$('#pwdInfo1').html('비밀번호가 일치하지 않습니다.');
			 	}else{
			 		$('#pwdInfo1').html('');
			 		$('#pwdInfo1').html('비밀번호가 일치합니다.');
			 	}
			}
		});
	});

	/* 비밀번호체크 ajax */
	function pwdCheck(empPwd){
		$.ajax({
			url:"<c:url value='/emp/pwdCheck'/>",
			type:"POST",
			data: {empPwd:empPwd},
			success:function(res){
				if(res==true){
					$('#pwdInfo1').html("유효합니다.");
				}else{
					$('#pwdInfo1').html("최소 8자, 최소 하나의 문자가 포함되어야 합니다.");
					
				}
			},
			error:function(xhr,status,error){
				alert("에러");
			}
		});
	}
	
	/* 핸드폰번호 - 자동생성 '-'포함 총 13자리 기준
	   idx : 01234567890
	   번호 : 01012341234
	*/
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
			phone += number.substr(0, 3); // 010
			phone += "-"; 				  // 010- 
			phone += number.substr(3, 4); // 010-1234
			phone += "-"; 				  // 010-1234-
			phone += number.substr(7);    // 010-1234-1234
		} 
			obj.value = phone; 
			
	}

	/* 카카오 우편번호 API */
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
	
</script>
<style>
.mainPanel{
 	width: 1250px;
 	padding: 20px;
 	background: white;
 	margin-left: 110px;
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
.pwdInfo{
	color: blue;
	font-size: 0.9em;
}
</style>

	<div class="panel mainPanel">
		<h4>사원등록</h4>
		<hr>

		<!-- 사원등록 form -->
		<form class="row g-3 frmEmpWrite"  method="post" enctype="multipart/form-data" action="<c:url value='/emp/empWrite'/>" >
		   <div></div>
		   <div class="row">
			  <div class="col-md-6">
			  	<label for="empName" class="form-label">이름</label>
			    <input type="text" class="form-control infoGroup" placeholder="name" id="empName" name="empName">
			  </div>
		   </div>
		   <div></div>
		   <div class="row">
			  <div class="col">
			  	<label for="empPwd" class="form-label">비밀번호</label>
			    <input type="password" class="form-control infoGroup" placeholder="password" name="empPwd" id="empPwd" oninput="pwdCheck(empPwd.value)">
			    <span class="pwdInfo" id="pwdInfo1"></span>
			  </div>
			  <div class="col">
			  	<label for="chkPwd" class="form-label">비밀번호확인</label>
			    <input type="password" class="form-control infoGroup" placeholder="check password" aria-label="chkPwd" id="chkPwd">
			    <span class="pwdInfo" id="pwdInfo2"></span>
			  </div>
		    </div>
	  		 <div class="col-md-11">
	    		<label for="empTel" class="form-label">핸드폰번호</label>
	    		<input type="tel" class="form-control infoGroup phoneNumber" onkeyup="chkHp(this)" maxlength="13" id="empTel" name="empTel" placeholder="phone">
	  		</div>
			 <div class="col-md-11">
	    		<label for="empEmail" class="form-label">Email</label>
	    		<input type="email" class="form-control infoGroup" id="empEmail" name="empEmail" placeholder="e-mail">
	  		</div>
	  	  	<div class="col-md-11">
				<label for="empPhoto" class="form-label">사원사진첨부</label>
			    <input type="file" class="form-control infoGroup" id="empPhoto" name="uploadFile" accept=".gif, .jpg, .png">
		  	</div>
	  		<div class="col-md-6">
	    		<label for="empZipcode" class="form-label">우편번호</label>
	    		<input type="text" class="form-control sample6_postcode" id="empZipcode" name="empZipcode" aria-label="zipcode" readonly="readonly">
	  		</div>
	  		<div class="col-md-4">
		  		<input type="button" class="btn btn-secondary" onclick="bt_zipcode()" id="btZipcode" value="우편번호 찾기">
		  	</div>

		  	<div class="col-md-8">
				<label for="empAddress" class="form-label">주소</label>
			    <input type="text" class="form-control infoGroup" id="empAddress" name="empAddress" aria-label="address" readonly="readonly">
		  	</div>
		  	<div></div>
		   	<div class="row">
		   		<div class="col-md-6">
					<label for="empAddressdetail" class="form-label">상세주소</label>
			    	<input type="text" class="form-control infoGroup" id="empAddressdetail" name="empAddressdetail" placeholder="상세주소" aria-label="adressDetail">
		  		</div>
		  		<div class="col-md-2">
					<label for="dong" class="form-label">동</label>
			    	<input type="text" class="form-control" id="dong" aria-label="adressDetail" readonly="readonly">
		  		</div>
		  	</div>
		  	<div>
		  		<hr>
		  		<h5>추가정보</h5>
		  		<br>
		  	</div>
		  	<div class="row">
			  	<div class="col-md-6">
					<label for="empRegdate" class="form-label">입사일</label>
				    <input type="date" class="form-control" id="empRegdate" name="empRegdate" placeholder="Regdate">
			  	</div>
			  	<div class="col-md-6">
			  		<label for="empBirth" class="form-label">생일</label>
				    <input type="date" class="form-control" id="empBirth" name="empBirth" placeholder="birth day">
			  	</div>
		  	</div>
		  	<div></div>
		  	<div class="row">
			  	<div class="col-md-4">
					<label for="empSalary" class="form-label">급여</label>
				    <input type="text" class="form-control" id="empSalary" name="empSalary" placeholder="Salary">
				    
			  	</div>
			   	<div class="col-md-4">
					<label for="empAccount" class="form-label">계좌번호</label>
				    <input type="text" class="form-control" id="empAccount" name="empAccount" placeholder="Account" >
			  	</div>
		  	</div>
		  	<div></div>
		  	<div class="row">
				<div class="col-md-2">
					<label class="form-label">관리자</label>
				    <select class="form-control" name="empAdminLev" id="empAdminLev">
				    	<option value="0">-선택하세요-</option>
				    	<option value="4">일반</option>
				    	<option value="3">총무팀장</option>
				    	<option value="2">인사팀장</option>
				    	<option value="1">관리자</option>
				    </select>
			  	</div>
			  	<div class="col-md-2">
			  	<label class="form-label" for="departmentNo">부서</label>
				    <select class="form-control" id="departmentNo" name="departmentNo">
				    	<option value="0">-선택하세요-</option>
				    	<c:forEach var="departmentVo" items="${departmentList}">
				    		<option value='${departmentVo.departmentNo}'>${departmentVo.departmentName }</option>
				    	</c:forEach>
				    </select>
				 </div>
				<div class="col-md-2">
			  	<label class="form-label" for="positionNo" >직급</label>
				    <select class="form-control" id="positionNo" name="positionNo">
				    	<option value="0">-선택하세요-</option>
				    	<c:forEach var="positionVo" items="${positionList}">
				    		<option value="${positionVo.positionNo}">${positionVo.positionName }</option>
				    	</c:forEach>
				    </select>
				 </div>
			  </div>
			<div></div>
			<div class="btGroup">
				<button class="btn btn-secondary " id="btAddEmp" type="submit">사원등록</button>
				<button class="btn btn-secondary " type="button" >취소</button>
			</div>
		</form>
	</div>
	

<%@include file="../inc/bottom.jsp" %>