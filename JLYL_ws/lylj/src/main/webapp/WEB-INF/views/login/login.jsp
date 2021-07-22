<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>IT그룹웨어 - 로그인</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
<link rel="stylesheet" href="<c:url value="/resources/css/login/login.css"/>"> 
<style type="text/css">
.form-check #emp{
	width: 30px;
}
.form-check #admin{
	width: 30px;
}
.logo{
	height: 50px;
}
.buttonGroup{
	padding: 10px;
}
.textGroup{
	width:  500px; 
}
</style>
<script type="text/javascript">
	$(function(){
		$('#findPwd').click(function(){
			console.log('클릭');
			$('#findPwdModal').modal('show');
			$('#modalEmpNo').val("");
			$('#modalEmpEmail').val("");
		});
		
		$('#modalClose').click(function(){
			$('#findPwdModal').modal('hide');
		});
		
		$('#btcloseModal').click(function(){
			$('#findPwdModal').modal('hide');
		});
		
		$('#btfindPwd').click(function(){
			if($('#modalEmpNo').val().length<1){
				alert('사원번호를 입력하세요');
				$('#modalEmpNo').focus();
				event.preventDefault();
				return false;
			}
			
			if($('#modalEmpEmail').val().length<1){
				alert('이메일을입력하세요');
				$('#modalEmpEmail').focus();
				event.preventDefault();
				return false;
			}
			
		});
		
		$('#btLongin').click(function(){
			if($('#empNo').val().length<1){
				alert('사원번호를 입력하세요');
				$('#empNo').focus();
				event.preventDefault();
			}else if($('#empPwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#empPwd').focus();
				event.preventDefault();
			}
			
		});
		
	});
</script>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
		<div class="card card0 border-0">
			<div class="row d-flex">
				<div class="col-lg-6">
					<div class="card1 pb-5">
						<div class="row">
							<img src="<c:url value="/resources/img/logo.png"/>" class="logo">
						</div>
						<div class="row px-3 justify-content-center mt-4 mb-5 border-line">
							<img src="<c:url value='/resources/img/office.png'/>" class="image">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<form class="loginFrm" method="post" action="<c:url value="/login/login"/>">
						<div class="card2 card border-0 px-4 py-5">
							<div class="row mb-4 px-3">
							</div>
							<div class="row mb-4 px-3">
							</div>
							<div class="row px-3 mb-4">
							</div>
							<div class="row px-3">
								<label class="mb-1">사원번호</label> 
								<input class="mb-4 textGroup" type="text" name="empNo" id="empNo" placeholder="Enter employee number" value="${cookie.ck_empNo.value }">
							</div>
							<div class="row px-3">
								<label class="mb-1">비밀번호</label> 
								<input class="mb-4 textGroup" type="password" name="empPwd" id="empPwd" placeholder="Enter password">
							</div>
							<div class="row px-3 mb-4">
								<div class="custom-control custom-checkbox custom-control-inline">
									<input id="chk1" type="checkbox" name="chkSave" class="custom-control-input" <c:if test="${!empty cookie.ck_empNo}"> checked="checked" </c:if>>
									<label for="chk1" id="chkSave" class="custom-control-label text-sm">아이디 저장하기</label>
								</div>
								<a href="#" id="findPwd" class="ml-auto mb-0 text-sm" >비밀번호찾기</a>
							</div>
							<div class="row mb-3 px-3">
								<button type="submit" class="btn btn-blue text-center" id="btLongin">로그인</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="bg-blue py-4">
				<div class="row px-3">
					<small class="ml-4 ml-sm-5 mb-2">Copyright &copy; IntranetUserInterface</small>
				</div>
			</div>
		</div>
	</div> 
	
	<!-- 비밀번호찻기 Modal -->
	<div class="modal" id="findPwdModal" data-bs-backdrop="static">
	  <div class="modal-dialog ">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호찾기</h4>
	        <button type="button" class="close" data-bs-dismiss="modal" id="modalClose">&times;</button>
	      </div>
	
	      <!-- Modal body -->
 		 <div class="modal-body">
		    <form name="findPwdfrm" id="findPwdfrm" method="post" action="<c:url value="login/findPwd"/>">
     	        <div class="row px-3">
     		        <label class="mb-1" for="empNo">사원번호</label> 
	                <input class="mb-4" type="text" name="empNo" id="modalEmpNo" placeholder="Enter employee number">
                </div>
                <div class="row px-3">
	                 <label class="mb-1" for="empEmail">E-mail</label> 
	                 <input type="email" name="empEmail" id="modalEmpEmail" placeholder="Enter password">
                </div><br>
			<div class="row px-3">
			   	<span>등록한 E-mail로 임시비밀번호가 전송됩니다.</span>
			</div><hr>
			<div class="row px-3 buttonGroup">
				<button type="submit" class="btn btn-info" id="btfindPwd">찾기</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btcloseModal">취소</button>
		    </div>
            </form>
		  </div>
	    </div>
	  </div>
	</div>
	
	</body>
</html>