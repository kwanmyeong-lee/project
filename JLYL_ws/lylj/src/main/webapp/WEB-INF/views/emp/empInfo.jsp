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
.caption span{
	font-size: 1.1em;
}
</style>

	<div class="panel mainPanel">
		 
		<h3>사원정보</h3>
		<hr>
		 <div class="imgInfo">
		 	<div class="row">
	             <div class="thumbnail">
	                  <img src="<c:url value='/resources/emp_images/${vo.empPhoto }'/>" >
	               <div class="caption">
	                  <h4>${vo.empName }</h4>
	               </div>
	           </div>
	       </div>
		 </div>
		  <div class="col-md-6">
		  	<label for="empName" class="form-label">이름</label>
		    <input type="text" class="form-control" placeholder="name" id="empName" name="empName" value="${vo.empName}" readonly="readonly">
		 </div>
  		 <div class="col-md-6">
    		<label for="empTel" class="form-label">전화번호</label>
    		<input type="tel" class="form-control" id="empTel" name="empTel" value="${vo.empTel }" readonly="readonly">
  		</div>
  		<div class="col-md-6">
		  	<label for="empNo" class="form-label">사원번호</label>
		    <input type="text" class="form-control"  id="empNo" name="empNo" value="${vo.empNo }" readonly="readonly">
		 </div>
		 <div class="col-md-6">
    		<label for="empEmail" class="form-label">Email</label>
    		<input type="email" class="form-control" id="empEmail" name="empEmail" value="${vo.empEmail }" readonly="readonly">
  		</div>
  		<div class="col-md-6">
    		<label for="empZipcode" class="form-label">우편번호</label>
    		<input type="text" class="form-control sample6_postcode" id="empZipcode" name="empZipcode" value="${vo.empZipcode }"  readonly="readonly">
  		</div>
  		<div class="col-md-4">
	  		<input type="button" class="btn btn-secondary" onclick="bt_zipcode()" id="btZipcode" value="우편번호 찾기">
	  	</div>

	  	<div class="col-md-8">
			<label for="empAddress" class="form-label">주소</label>
		    <input type="text" class="form-control" id="empAddress" name="empAddress" value="${vo.empAddress }" aria-label="address" readonly="readonly">
	  	</div>
	  	<div></div>
	   	<div class="row">
	   		<div class="col-md-6">
				<label for="empAddressdetail" class="form-label">상세주소</label>
		    	<input type="text" class="form-control" id="empAddressdetail" name="empAddressdetail" value="${vo.empAddressdetail }" aria-label="adressDetail" readonly="readonly">
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
			    <input type="text" class="form-control" id="empRegdate" name="empRegdate" value='<fmt:formatDate value="${vo.empRegdate }" pattern="YYYY-MM-dd"/>' readonly="readonly">
		  	</div>
		  	<div class="col-md-5">
		  		<label for="empBirth" class="form-label">생일</label>
			    <input type="text" class="form-control" id="empBirth" name="empBirth" value='<fmt:formatDate value="${vo.empBirth }" pattern="YYYY-MM-dd"/>' readonly="readonly">
		  	</div>
	  	</div>
		   	<div class="col-md-5">
				<label for="empAccount" class="form-label">계좌번호</label>
			    <input type="text" class="form-control" id="empAccount" name="empAccount" value="${vo.empAccount }"  readonly="readonly">
		  	</div>
		  	
	  	<div class="row">
			<c:if test="${vo.empAdminLev==1 }">
				<div class="col-md-2">
					<label class="form-label">관리자</label>
				    <select class="form-control" name="empAdminLev" id="empAdminLev" disabled>
				    	<option value="3" <c:if test="${vo.empAdminLev==3}"> selected</c:if> 
				    	>사원</option>
				    	<option value="2" <c:if test="${vo.empAdminLev==2}"> selected</c:if>
				    	>팀장</option>
				    	<option value="1" <c:if test="${vo.empAdminLev==1}"> selected</c:if>
				    	>관리자</option>
				    </select>
			  	</div>
			</c:if>
		  	<div class="col-md-2">
			  	<label class="form-label" for="departmentNo">부서</label>
				    <select class="form-control" id="departmentNo" name="departmentNo"  disabled>
			    		<option value='1'
			    			<c:if test="${vo.departmentNo=='1' }"> selected</c:if>
							>전략기획팀</option>
			    		<option value='2'
			    			<c:if test="${vo.departmentNo=='2' }"> selected</c:if>
			    			>영업팀</option>
			    		<option value='3'
			    			<c:if test="${vo.departmentNo=='3' }"> selected</c:if>
			    			>마케팅팀</option>
			    		<option value='4'
			    			<c:if test="${vo.departmentNo=='4' }"> selected</c:if>
			    			>개발팀</option>
			    		<option value='5'
			    			<c:if test="${vo.departmentNo=='5' }"> selected</c:if>
			    			>인사팀</option>
			    		<option value='6'
			    			<c:if test="${vo.departmentNo=='6' }"> selected</c:if>
			    			>총무회계팀</option>
				    </select>
				 </div>
			 <div class="col-md-2">
			 	<label class="form-label" for="positionNo" >직급</label>
			    <select class="form-control" id="positionNo" name="positionNo" disabled>
			    		<option value="1" 
			    			<c:if test="${vo.positionNo=='1' }"> selected</c:if>
			    		>사장</option>
			    		<option value="2" 
			    			<c:if test="${vo.positionNo=='2' }"> selected</c:if>
			    		>부장</option>
			    		<option value="3" 
			    			<c:if test="${vo.positionNo=='3' }"> selected</c:if>
			    		>과장</option>
			    		<option value="4" 
			    			<c:if test="${vo.positionNo=='4' }"> selected</c:if>
			    		>대리</option>
			    		<option value="5" 
			    			<c:if test="${vo.positionNo=='5' }"> selected</c:if>
			    		>주임</option>
			    		<option value="6" 
			    			<c:if test="${vo.positionNo=='6' }"> selected</c:if>
			    		>사원</option>
			    </select>
			 </div>
		  </div>

		<div></div>
		<div class="btGroup">
			<a href="<c:url value='/emp/empEdit?empNo=${vo.empNo }'/>"><button class="btn btn-secondary " type="submit">수정</button></a>
			<c:if test="${vo.empAdminLev==1 }">
				<a href=""><button class="btn btn-secondary " type="submit">퇴사처리</button></a>
			</c:if>
			<button class="btn btn-secondary " type="button" >사원목록으로</button>
			<a href="<c:url value="/index"/>"><button class="btn btn-secondary" type="submit">메인으로</button></a>
		</div>
	</div>
	

<%@include file="../inc/bottom.jsp" %>