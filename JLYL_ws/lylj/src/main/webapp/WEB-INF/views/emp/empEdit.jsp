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
</style>

	<div class="panel mainPanel">
		<h4>사원정보수정</h4>
		<hr>

		<!-- 사원등록 form -->
		<form class="row g-3" method="post" action="<c:url value='/emp/empWrite'/>">
		   <div></div>
		   <div class="row">
			  <div class="col-md-6">
			  	<label for="empName" class="form-label">이름</label>
			    <input type="text" class="form-control" id="empName" name="empName" value="${empVo.empName }" readonly="readonly">
			  </div>
		   </div>
		   <div></div>
		   <div class="row">
			  <div class="col-md-4">
			  	<label for="empPwd" class="form-label">비밀번호</label>
			    <input type="text" class="form-control" placeholder="password" aria-label="PWD" name="empPwd" id="empPwd">
			  </div>
			  <div class="col-md-4">
			  	<label for="chkPwd" class="form-label">비밀번호확인</label>
			    <input type="text" class="form-control" placeholder="check password" aria-label="chkPwd" id="chkPwd">
			  </div>
			  <div class="col-md-4">
			  	<button type="button" class="btn btn-secondary btChangePwd">비밀번호변경하기</button>
			  </div>
		    </div>
	  		 <div class="col-md-11">
	    		<label for="empTel" class="form-label">전화번호</label>
	    		<input type="tel" class="form-control" id="empTel" name="empTel" value="${empVo.empTel }">
	  		</div>
			 <div class="col-md-11">
	    		<label for="empEmail" class="form-label">Email</label>
	    		<input type="email" class="form-control" id="empEmail" name="empEmail" value="${empVo.empEmail }" >
	  		</div>
	  	  	<div class="col-md-11">
				<label for="empPhoto" class="form-label">사진첨부</label>
			    <input type="file" class="form-control" id="empPhoto" name="empPhoto" value="${empVo.empPhoto }">
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
		    <c:if test="${empAdminLev==1 ||empAdminLev==2 }">
		  	<div>
		  		<hr>
		  		<h5>추가정보</h5>
		  		<br>
		  	</div>
		  	<div class="row">
			  	<div class="col-md-6">
					<label for="empRegdate" class="form-label">입사일</label>
				    <input type="text" class="form-control" id="empRegdate" name="empRegdate" placeholder="Regdate" value='<fmt:formatDate value="${empVo.empRegdate }" pattern="YYYY-MM-dd"/>'>
			  	</div>
			  	<div class="col-md-6">
			  		<label for="empBirth" class="form-label">생일</label>
				    <input type="text" class="form-control" id="empBirth" name="empBirth" placeholder="birth day" value='<fmt:formatDate value="${empVo.empBirth }" pattern="YYYY-MM-dd"/>'>
			  	</div>
		  	</div>
		  	<div></div>
		  	<div class="row">
			  	<div class="col-md-4">
					<label for="empSalary" class="form-label">봉급</label>
				    <input type="text" class="form-control" id="empSalary" name="empSalary" placeholder="Salary" value="${empVo.empSalary }">
				    
			  	</div>
			   	<div class="col-md-4">
					<label for="empAccount" class="form-label">계좌번호</label>
				    <input type="text" class="form-control" id="empAccount" name="empAccount" placeholder="Account" value="${empVo.empAccount }" >
			  	</div>
		  	</div>
		  	<div></div>
		  	<div class="row">
				<div class="col-md-2">
					<label class="form-label">관리자</label>
				    <select class="form-control" name="empAdminLev" id="empAdminLev">
				    	<option value="3" <c:if test="${empVo.empAdminLev==3}"> selected</c:if> 
				    	>사원</option>
				    	<option value="2" <c:if test="${empVo.empAdminLev==2}"> selected</c:if>
				    	>팀장</option>
				    	<option value="1" <c:if test="${empVo.empAdminLev==1}"> selected</c:if>
				    	>관리자</option>
				    </select>
			  	</div>
		  	  <div class="col-md-2">
			  	<label class="form-label" for="departmentNo">부서</label>
				    <select class="form-control" id="departmentNo" name="departmentNo" >
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
				    <select class="form-control" id="positionNo" name="positionNo" >
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
			</c:if>
			<div></div>
			<div class="btGroup">
				<button class="btn btn-secondary " type="submit">수정</button>
				<button class="btn btn-secondary " type="button" >취소</button>
			</div>
		</form>
	</div>
	

<%@include file="../inc/bottom.jsp" %>