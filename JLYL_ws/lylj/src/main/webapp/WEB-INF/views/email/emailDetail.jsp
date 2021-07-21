<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style type="text/css">
.emailContainer{
	margin-left: 20px;
}
.emailPanel{
	padding: 40px;
	width: 1300px;
	background: white;
}
.textBox{
	width: 90%;
	float:left;
}
.title{
	float: left;
	font-size: 1.2em;
	font-weight: bold;
	padding: 5px;
}

.emailcc{
	width: 1100px;
}

.searchbox{
	float: right;
	width: 300px;
}
#startDate{
	width: 120px;

}
#startTime{
	width: 120px;
}
#sendDate{
	float:right;
}
#downloadFile{
	float: right;
}
.emailContent{
	border: 1px solid gray;
	padding: 10ppx;
	height: 450px;
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
			     <label for="inputEmail3" class="col-sm-1 col-form-label">보낸사람 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="inputEmail3">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="inputEmail3" class="col-sm-1 col-form-label">받는사람 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="inputEmail3">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="inputEmail3" class="col-sm-1 col-form-label">참조 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="inputEmail3">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="inputEmail3" class="col-sm-1 col-form-label">제목 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="inputEmail3">
 			     </div>
 			   </div>
 			   <hr>
				<div class="form-group">
			    	<div class="emailContent">
				    	<div id="fileDiv">
				    		<!-- 첨부파일 -->
					    	<button id="downloadFile" type="button" class="btn btn-info" data-bs-toggle="dropdown" >첨부파일</button>
					    	<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink" id="upFileList">
					            <li><a class="dropdown-item fileA" href="<c:url value=''/>" ><i class="fas fa-save"></i>&nbsp;&nbsp;파일명</a></li>
				        	</ul>
				        </div>
				        
			        </div>
				</div>
				
		</div>	
</div>

<%@include file="../inc/bottom.jsp" %>