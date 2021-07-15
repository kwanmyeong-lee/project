<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
.mainPanel {
    width: 1100px;
    padding: 20px;
    background: white;
    margin-left: 150px;
}
.mainPanel label{
 	font-weight: bold;
}
.mainPanel div{
	padding: 3px;
} 
.mainPanel .row{
	padding: 10px;
}
#btZipcode{
	margin-top: 30px;
}
.btGroup{
	text-align: center;
}
.imgInfo{
	float: right;
	border: 1px solid #d1d3e2;
	margin-right: 50px;
	width: 280px;
	line-height: 280px;
	text-align: center;
}
.imgInfo img{
	width: 250px;
	vertical-align: middle;	
}
</style>

	<div class="panel mainPanel">
		<h4>사원정보</h4>
		<hr>
		 <div class="imgInfo">
		 	<img src="<c:url value='/resources/img/아이유1.jpg'/>">
		 </div>
		  <div class="col-md-6">
		  	<label for="empName" class="form-label">이름</label>
		    <input type="text" class="form-control" placeholder="name" id="empName" name="empName" readonly="readonly">
		 </div>
  		 <div class="col-md-6">
    		<label for="empTel" class="form-label">전화번호</label>
    		<input type="tel" class="form-control" id="empTel" name="empTel" readonly="readonly">
  		</div>
  		<div class="col-md-6">
		  	<label for="empNo" class="form-label">사원번호</label>
		    <input type="text" class="form-control"  id="empNo" name="empNo" readonly="readonly">
		 </div>
		 <div class="col-md-6">
    		<label for="empEmail" class="form-label">Email</label>
    		<input type="email" class="form-control" id="empEmail" name="empEmail" readonly="readonly">
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
		    <input type="text" class="form-control" id="empAddress" name="empAddress" aria-label="address" readonly="readonly">
	  	</div>
	  	<div></div>
	   	<div class="row">
	   		<div class="col-md-6">
				<label for="empAddressdetail" class="form-label">상세주소</label>
		    	<input type="text" class="form-control" id="empAddressdetail" name="empAddressdetail" placeholder="상세주소" aria-label="adressDetail" readonly="readonly">
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
		  	<div class="col-md-5">
				<label for="empRegdate" class="form-label">입사일</label>
			    <input type="date" class="form-control" id="empRegdate" name="empRegdate" readonly="readonly">
		  	</div>
		  	<div class="col-md-5">
		  		<label for="empBirth" class="form-label">생일</label>
			    <input type="date" class="form-control" id="empBirth" name="empBirth" readonly="readonly">
		  	</div>
	  	</div>
		   	<div class="col-md-5">
				<label for="empAccount" class="form-label">계좌번호</label>
			    <input type="text" class="form-control" id="empAccount" name="empAccount" readonly="readonly">
		  	</div>
	  	<div class="row">
			<div class="col-md-2">
				<label class="form-label">관리자</label>
			    <input type="text" class="form-control" name="empAdminLev" id="empAdminLev" readonly="readonly">
		  	</div>
		  	<div class="col-md-2">
		  	<label class="form-label" for="departmentNo">부서</label>
			    <input type="text" class="form-control" id="departmentNo" name="departmentNo" readonly="readonly">
			 </div>
			<div class="col-md-2">
		  		<label class="form-label" for="positionNo" >직급</label>
			    <input type="text" class="form-control" id="positionNo" name="positionNo" readonly="readonly">
			 </div>
		  </div>
		<div></div>
		<div class="btGroup">
			<a href="<c:url value='/emp/empEdit'/>"><button class="btn btn-secondary " type="submit">수정</button></a>
			<c:if test="${empAdminLev==1 || empAdminLev==2}">
				<button class="btn btn-secondary " type="submit">퇴사처리</button>
				<button class="btn btn-secondary " type="button" >사원목록으로</button>
			</c:if>
			<c:if test="${empAdminLev==3}">
				<a href="<c:url value="/index"/>"><button class="btn btn-secondary" type="submit">메인으로</button></a>
			</c:if>
		</div>
	</div>
	

<%@include file="../inc/bottom.jsp" %>