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
	min-height: 300px;
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
				 <a href="<c:url value='/email/emailWrite?mailNo=${param.mailNo }&type=re'/>"><button type="button" class="btn btn-secondary">답장</button></a>
				 <a href="<c:url value='/email/emailWrite?mailNo=${param.mailNo }&type=fw'/>"><button type="button" class="btn btn-secondary">전달</button></a>
				 <button type="button" class="btn btn-secondary">삭제</button>
				 <span id="sendDate">보낸시간 : ${emailVo.mailSenddate}</span>
			   </div>
			   <div class="row mb-3">
			     <label for="sender" class="col-sm-1 col-form-label">보낸사람 :</label>
			     <div class="col-sm-11">
			       <input type="text" class="form-control" id="sender" value="${emailVo.mailSend }@lylj.net" disabled="disabled">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="receiver" class="col-sm-1 col-form-label">받는사람 :</label>
			     <div class="col-sm-11">
			       <input type="text" class="form-control" id="receiver" value="${emailVo.mailTake }@lylj.net" disabled="disabled">
 			     </div>
 			   </div>
 			   <div class="row mb-3">
			     <label for="subject" class="col-sm-1 col-form-label">제목 :</label>
			     <div class="col-sm-11">
			       <input type="email" class="form-control" id="subject" value="${emailVo.mailTitle }" disabled="disabled">
 			     </div>
 			   </div>
 			   <hr>
				<div class="form-group">
			    	<div class="emailContentPanel">
				    	<div id="fileDiv">
				    		<!-- 첨부파일 -->
					    	<button id="downloadFile" type="button" class="btn btn-info" data-bs-toggle="dropdown" >첨부파일</button>
					    	<ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink" id="upFileList">
					    		<c:if test="${empty emailFileList}">
					            	<li>&nbsp;첨부된 파일이 없습니다</li>
					            </c:if>
					            <c:if test="${!empty emailFileList}">
					            	<c:forEach var="file" items="${emailFileList}">
					            		<li><a class="dropdown-item fileA" href="<c:url value='/email/mailFileDown?fileNo=${file.fileNo}&fileOriginName=${file.fileOriginName} '/>" ><i class="fas fa-save"></i>&nbsp; ${file.fileOriginName}</a></li>
					            	</c:forEach>
					            </c:if>
				        	</ul>
				        </div>
				        <div class="emailContent" >${emailVo.mailContent}</div>
			        </div>
				</div>
				
		</div>	
</div>

<%@include file="../inc/bottom.jsp" %>