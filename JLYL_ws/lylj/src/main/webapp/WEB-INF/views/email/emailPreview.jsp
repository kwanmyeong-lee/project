<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미리보기</title>
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
	rel="stylesheet">
<style>
	.align_center {
		text-align: center;
	}
	div[name=mailContent]{
		min-height: 200px;
	}
</style>	
</head>
<body>
<div class="container emailContainer">
	<div class="panel emailPanel">
		<br>
		<span class="title">미리보기</span>
				<br>
				<hr>
				<div class="form-group firstFrm row">
			    	<label for="mailTake" class="col-sm-1 control-label">보낸사람</label>
			    	<div class="col-sm-11">
                        <input type="text" class="form-control select2-offscreen textBox" id="mailsend" name="mailsend" tabindex="-1" readonly="readonly" value="${vo.mailSend}">
					</div>                        
			    </div>
				<div class="form-group firstFrm row">
			    	<label for="mailTake" class="col-sm-1 control-label">받는사람:</label>
			    	<div class="col-sm-11">
                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1" readonly="readonly" value="${vo.mailTake}">
					</div>                        
			    </div>
				<div class="form-group row">
			    	<label for="mailTitle" class="col-sm-1 control-label">제목:</label>
			    	<div class="col-sm-11">
                         <input type="text" class="form-control select2-offscreen textBox tx" id="mailTitle" name="mailTitle" tabindex="-1" readonly="readonly" value="${vo.mailTitle }">
			    	</div>
			  	</div>
			   
          <!-- 	<form class="form-horizontal writefrm" id="emailFileFrm" name="emailFileFrm" method="post"> 
				  	<div class="form-group row">
				    	<label for="uploadFile" class="col-sm-1 control-label">파일첨부:</label>
				    	<div class="col-sm-11">
							<button class="btn btn-primary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
							   <i class="far fa-file"></i>
							</button>
						</div>
						<br><br>
						<div class="collapse form-control select2-offscreen fileBox" id="collapseExample">
		                      <div id="dropZone">
		                      	<span id="dropZoneSpan" >파일을 드래그 하세요.</span>
						      	<p id="fileDiv"></p>
		                      </div>
						</div>
				  	</div>
				</form> -->
					<div class="form-group">
						<label for="summernote" class="col-sm-1 control-label">내용:</label>
						<div class="form-control message" name="mailContent" readonly="readonly">${vo.mailContent }</div>
					</div>
				  <!--   <div class="form-group row">
				    	<div class="col-sm-11 row" id="setDate" >
					    	<span>전송시간 : </span> 
					   </div>
				  	</div> -->
			<div class="form-group align_center">	
				<button type="button" class="btn btn-secondary" id="bt_confirm" onclick="self.close()">확인</button>
			</div>
		</div>	
</div>
</body>
</html>