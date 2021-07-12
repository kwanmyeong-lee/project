<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="emptop.jsp" %>
<!-- 카카오우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">
 .mainPanel{
 	width: 1250px;
 	padding: 20px;
 	background: white;
 }
#btZipcode{
	margin-top: 30px;
}

</style>

	<div class="panel mainPanel">
		<h4>사원등록</h4>
		<br>
		<!-- 사원등록 form -->
		<form class="row g-3">
		   <div class="row">
			  <div class="col">
			  	<label for="name" class="form-label">이름</label>
			    <input type="text" class="form-control" placeholder="name" aria-label="NAME">
			  </div>
			  <div class="col">
			  	<label for="pwd" class="form-label">사원번호</label>
			    <input type="text" class="form-control" placeholder="emp no" aria-label="EMPNO">
			  </div>
		   </div>
		   <div></div>
		   <div class="row">
			  <div class="col">
			  	<label for="pwd" class="form-label">비밀번호</label>
			    <input type="text" class="form-control" placeholder="password" id="pwd" aria-label="PWD">
			  </div>
			  <div class="col">
			  	<label for="chkPwd" class="form-label">비밀번호확인</label>
			    <input type="text" class="form-control" placeholder="check password" aria-label="chkPwd">
			  </div>
		    </div>
	  		 <div class="col-md-11">
	    		<label for="tel" class="form-label">전화번호</label>
	    		<input type="tel" class="form-control" id="tel">
	  		</div>
			 <div class="col-md-11">
	    		<label for="email" class="form-label">Email</label>
	    		<input type="email" class="form-control" id="email">
	  		</div>
	  	  	<div class="col-md-11">
				<label for="photo" class="form-label">사진첨부</label>
			    <input type="file" class="form-control"  aria-label="adressDetail">
		  	</div>
	  		<div class="col-md-6">
	    		<label for="zipcode" class="form-label">우편번호</label>
	    		<input type="text" class="form-control sample6_postcode" id="zipcode" aria-label="zipcode" readonly="readonly">
	  		</div>
	  		<div class="col-md-4">
		  		<input type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()" id="btZipcode" value="우편번호 찾기">
		  	</div>

		  	<div class="col-md-6">
				<label for="chkPwd" class="form-label">주소</label>
			    <input type="text" class="form-control" placeholder="address" aria-label="address">
		  	</div>
		   	<div class="col-md-6">
				<label for="chkPwd" class="form-label">상세주소</label>
			    <input type="text" class="form-control" placeholder="addressDetail" aria-label="adressDetail">
		  	</div>
		  	<div><hr>
		  		<span>추가정보</span>
		  	</div>
		  	<div class="col-md-6">
				<label for="joindate" class="form-label">입사일</label>
			    <input type="text" class="form-control" placeholder="join date" aria-label="joindate">
		  	</div>
		  	<div></div>
		  	<div class="row">
			  	<div class="col-md-6">
					<label for="salary" class="form-label">봉급</label>
				    <input type="text" class="form-control" placeholder="join date" aria-label="salary">
			  	</div>
			   	<div class="col-md-6">
					<label for="salary" class="form-label">계좌번호</label>
				    <input type="text" class="form-control" placeholder="join date" aria-label="salary">
			  	</div>
		  	</div>
		</form>
	</div>
	

<%@include file="empbottom.jsp" %>