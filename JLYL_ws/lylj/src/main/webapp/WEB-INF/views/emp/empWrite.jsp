<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="emptop.jsp" %>
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
                document.getElementById('EMP_ZIPCODE').value = data.zonecode;
                document.getElementById("EMP_ADDRESS").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("EMP_ADDRESSDETAIL").focus();
            }
        }).open();
	}
</script>

<style type="text/css">
 .mainPanel{
 	width: 1250px;
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
</style>

	<div class="panel mainPanel">
		<h4>사원등록</h4>
		<hr>

		<!-- 사원등록 form -->
		<form class="row g-3" method="post" action="">
		   <div></div>
		   <div class="row">
			  <div class="col">
			  	<label for="name" class="form-label">이름</label>
			    <input type="text" class="form-control" placeholder="name" aria-label="NAME" name="EMP_NAME">
			  </div>
			  <div class="col">
			  	<label for="pwd" class="form-label">사원번호</label>
			    <input type="text" class="form-control" placeholder="emp no" aria-label="EMPNO" name="EMP_NO">
			  </div>
		   </div>
		   <div></div>
		   <div class="row">
			  <div class="col">
			  	<label for="pwd" class="form-label">비밀번호</label>
			    <input type="text" class="form-control" placeholder="password" aria-label="PWD" name="EMP_PWD">
			  </div>
			  <div class="col">
			  	<label for="chkPwd" class="form-label">비밀번호확인</label>
			    <input type="text" class="form-control" placeholder="check password" aria-label="chkPwd" id="chkPwd">
			  </div>
		    </div>
	  		 <div class="col-md-11">
	    		<label for="tel" class="form-label">전화번호</label>
	    		<input type="tel" class="form-control" id="tel" name="EMP_TEL">
	  		</div>
			 <div class="col-md-11">
	    		<label for="email" class="form-label">Email</label>
	    		<input type="email" class="form-control" id="email" name="EMP_EMAIL">
	  		</div>
	  	  	<div class="col-md-11">
				<label for="photo" class="form-label">사진첨부</label>
			    <input type="file" class="form-control"  aria-label="adressDetail" name="EMP_PHOTO">
		  	</div>
	  		<div class="col-md-6">
	    		<label for="EMP_ZIPCODE" class="form-label">우편번호</label>
	    		<input type="text" class="form-control sample6_postcode" id="EMP_ZIPCODE" name="EMP_ZIPCODE" aria-label="zipcode" readonly="readonly">
	  		</div>
	  		<div class="col-md-4">
		  		<input type="button" class="btn btn-secondary" onclick="bt_zipcode()" id="btZipcode" value="우편번호 찾기">
		  	</div>

		  	<div class="col-md-8">
				<label for="EMP_ADDRESS" class="form-label">주소</label>
			    <input type="text" class="form-control" id="EMP_ADDRESS" name="EMP_ADDRESS" aria-label="address" readonly="readonly">
		  	</div>
		  	<div></div>
		   	<div class="row">
		   		<div class="col-md-6">
					<label for="EMP_ADDRESSDETAIL" class="form-label">상세주소</label>
			    	<input type="text" class="form-control" id="EMP_ADDRESSDETAIL" name="EMP_ADDRESSDETAIL" placeholder="상세주소" aria-label="adressDetail">
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
					<label for="joindate" class="form-label">입사일</label>
				    <input type="date" class="form-control" name="EMP_REGDATE" placeholder="join date" aria-label="joindate">
			  	</div>
			  	<div class="col-md-6">
			  		<label for="joindate" class="form-label">생일</label>
				    <input type="date" class="form-control" name="EMP_BIRTH" placeholder="join date" aria-label="joindate">
			  	</div>
		  	</div>
		  	<div></div>
		  	<div class="row">
			  	<div class="col-md-4">
					<label for="salary" class="form-label">봉급</label>
				    <input type="text" class="form-control" name="EMP_SALARY" placeholder="join date" aria-label="salary">
				    
			  	</div>
			  	<div class="col-md-2">
					<label for="salary" class="form-label">은행</label>
				    <select class="form-control">
				    	<option>-선택하세요-</option>
				    	<option value="NongHyup">농협</option>
				    	<option value="ShinHan">신한</option>
				    	<option value="KookMin">국민</option>
				    	<option value="Woori">우리</option>
				    	<option value="etc">기타</option>
				    </select>
			  	</div>
			   	<div class="col-md-4">
					<label for="salary" class="form-label">계좌번호</label>
				    <input type="text" class="form-control" name="EMP_ACCOUNT" placeholder="join date" aria-label="salary">
			  	</div>
		  	</div>
		  	<div></div>
		  	<div class="row">
				<div class="col-md-2">
					<label class="form-label">관리자</label>
				    <select class="form-control" name="EMP_ADMIN_LEV">
				    	<option>-선택하세요-</option>
				    	<option value="emp">사원</option>
				    	<option value="teamLeader">팀장</option>
				    	<option value="admin">관리자</option>
				    </select>
			  	</div>
			  	<div class="col-md-2">
			  	<label class="form-label">부서</label>
				    <select class="form-control"  name="DEPARTMENT_NO">
				    	<option>-선택하세요-</option>
				    	<option value="1">영업</option>
				    	<option value="2">마케팅</option>
				    	<option value="3">개발</option>
				    	<option value="4">인사</option>
				    	<option value="5">총무/회계</option>
				    </select>
				 </div>
				<div class="col-md-2" name=>
			  	<label class="form-label">직급</label>
				    <select class="form-control" name="POSITION_NO">
				    	<option>-선택하세요-</option>
				    	<option value="6">사원</option>
				    	<option value="5">주임</option>
				    	<option value="4">대리</option>
				    	<option value="3">과장</option>
				    	<option value="2">부장</option>
				    	<option value="1">사장</option>
				    </select>
				 </div>
			  </div>
			<div></div>
			<div class="btGroup">
				<button class="btn btn-secondary " type="submit">사원등록</button>
				<button class="btn btn-secondary " type="button" >취소</button>
			</div>
		</form>
	</div>
	

<%@include file="empbottom.jsp" %>