<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>IT그룹웨어 - 로그인</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
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
</style>

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
							<img src="<c:url value='/resources/img/loginimg.gif'/>" class="image">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card2 card border-0 px-4 py-5">
						<div class="row mb-4 px-3">
						</div>
						<div class="row mb-4 px-3">
						</div>
						<div class="row px-3 mb-4">
						</div>
						<div class="row px-3">
							<label class="mb-1">
								사원번호
							</label> <input class="mb-4" type="text" name="email" placeholder="Enter a valid email employee number">
						</div>
						<div class="row px-3">
							<label class="mb-1">
								비밀번호
							</label> 
							<input type="password" name="password" placeholder="Enter password">
						</div>
						<div class="row px-3 mb-4">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input id="chk1" type="checkbox" name="chkSave" class="custom-control-input"> 
								<label for="chk1"class="custom-control-label text-sm">아이디 저장하기</label>
							</div>
							<a href="#" class="ml-auto mb-0 text-sm">비밀번호찾기</a>
						</div>
						<div class="row mb-3 px-3">
							<button type="submit" class="btn btn-blue text-center">로그인</button>
						</div>
					</div>
				</div>
			</div>
			<div class="bg-blue py-4">
				<div class="row px-3">
					<small class="ml-4 ml-sm-5 mb-2">Copyright &copy; IntranetUserInterface</small>
				</div>
			</div>
		</div>
	</div>
	<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
	<script type='text/javascript'></script>
</body>
</html>