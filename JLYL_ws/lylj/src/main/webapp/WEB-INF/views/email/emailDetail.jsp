<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 

<style type="text/css">
.emailContainer{
	margin-left: 20px;
}
.emailPanel{
	padding: 40px;
	width: 1400px;
	background: white;
}

.title{
	float: left;
	font-size: 1.2em;
	font-weight: bold;
	padding: 5px;
}


#sendDate{
	float:right;
}
#downloadFile{
	float: right;
	margin-top: 1%;
	margin-right: 1%;	
}
.emailContentPanel{
	border: 1px solid #dedee2;
	height: 300px;
}
.emailContent{
	padding: 10px;
}

</style>

<div class="container emailContainer">
	<div class="panel emailPanel">
		<p class="title">메일함</p>
				<br>
				<hr>
			  <div class="form-group">	
				 <button type="button" class="btn btn-secondary">답장</button>
				 <button type="button" class="btn btn-secondary">삭제</button>
				 <span id="sendDate">보낸시간</span>
			   </div>
			   <div class="row mb-3">
			     <label for="sender" class="col-sm-1 col-form-label">보낸사람 :</label>
			     <div class="col-sm-11">
			       <input type="text" class="form-control" id="sender">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="receiver" class="col-sm-1 col-form-label">받는사람 :</label>
			     <div class="col-sm-11">
			       <input type="text" class="form-control" id="receiver">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="refer" class="col-sm-1 col-form-label">참조 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="refer">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="subject" class="col-sm-1 col-form-label">제목 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="subject">
 			     </div>
 			   </div>
 			   <hr>
				<div class="form-group">
			    	<div class="emailContentPanel">
				    	<div id="fileDiv">
				    		<!-- 첨부파일 -->
					    	<button id="downloadFile" type="button" class="btn btn-info" data-bs-toggle="dropdown" >첨부파일</button>
					    	<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink" id="upFileList">
					            <li><a class="dropdown-item fileA" href="<c:url value=''/>" ><i class="fas fa-save"></i>&nbsp;&nbsp;파일명</a></li>
				        	</ul>
				        </div>
				        <div class="emailContent">메일내용들어갈 자리</div>
			        </div>
				</div>
				
		</div>	
</div>

<%@include file="../inc/bottom.jsp" %>