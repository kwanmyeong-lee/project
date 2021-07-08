<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Blank</title>

<!-- Custom fonts for this template-->
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
	rel="stylesheet">

</head>

<style>
#timeSize {
	font-size: 20px;
}

#mainTopText {
	text-decoration: underline;
	font-weight: bolder;
	font-size: 20px;
}

.topNavText {
	font-size: 25px;
}

#topNavButton {
	margin-left: 11px;
}

.btnSchAdd {
	width: 93%;
}
</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$('#testBt').click(function(){ 
		$('#accordionSidebar').html('<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="index"><div class="sidebar-brand-icon rotate-n-15"></div><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><button type="button"class="btn btn-light btnSchAdd"id="testBotton">새결재작성하기</button></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="#"><i class="fas fa-fw fa-table"></i><span>자주쓰는양식</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item"><a class="nav-link collapsed"href="#"data-toggle="collapse"data-target="#collapseOne"aria-expanded="true"aria-controls="collapseOne"><i class="fas fa-fw fa-cog"></i><span>결재</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="#">결재대기문서</a><a class="collapse-item"href="#">결재수신문서</a><a class="collapse-item"href="#">결재예정문서</a></div></div></li><li class="nav-item"><a class="nav-link collapsed"href="#"data-toggle="collapse"data-target="#collapseTwo"aria-expanded="true"aria-controls="collapseTwo"><i class="fas fa-fw fa-cog"></i><span>내문서함</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="#">기안문서함</a><a class="collapse-item"href="#">임시저장함</a><a class="collapse-item"href="#">결재완료문서</a></div></div></li>');
	});
});
	
</script>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
			id="accordionSidebar">
			
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index">
				<div class="sidebar-brand-icon rotate-n-15"></div>
				<div class="sidebar-brand-text mx-3">메인으로 이동</div>
			</a>
			
			<div class="card" >
				<img src="<c:url value ="/resources/img/아이유1.jpg"/>"
					class="card-img-top" alt="...">
				<ol class="breadcrumb mt-3">
					<li class="breadcrumb-item">오늘받은 메일</li>
					<li class="breadcrumb-item"><a href="#">3개</a></li>
				</ol>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">오늘 일정</li>
					<li class="breadcrumb-item"><a href="#">10개</a></li>
				</ol>
				<div class="card-body">
					<button type="button" class="btn btn-outline-info btn-lg w-100">
						<a href="#" class="card-link">메일 쓰기</a> <br>
					</button>
					<button type="button"
						class="btn btn-outline-info btn-lg w-100 mt-3">
						<a href="#" class="card-link">일정 등록</a> <br>
					</button>
	
				</div>
			</div>
			<div class="card" >
				<div class="card-header">근태 관리</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">오늘 일한 시간
						<p class="card-text" id="timeSize">12시간 50분</p>
					</li>
					<li class="list-group-item">출근 시간
						<p class="card-text" id="timeSize">12시간 50분</p>
					</li>

					<li class="list-group-item">퇴근 시간
						<p class="card-text" id="timeSize">12시간 50분</p>
					</li>
				</ul>
			</div>





			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
			

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<span id="mainTopText">저기 힘차게 떠오르는 태양처럼 오늘도 힘차게 아자아자!</span>
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item topNavText"><a class="nav-link" href="#"
							id="testBt" role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">전자 결제</span>
						</a></li>
						<li class="nav-item topNavText"><a class="nav-link" href="#"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">메일</span>
						</a></li>

						<li class="nav-item topNavText"><a class="nav-link" href="#"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">근태</span>
						</a></li>

						<li class="nav-item topNavText"><a class="nav-link" href="#"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">캘린더</span>
						</a></li>
						<li class="nav-item topNavText"><a class="nav-link" href="#"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">주소록</span>
						</a></li>
						<li class="nav-item topNavText"><a class="nav-link" href="#"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">게시판</span>
						</a></li>
						<li class="nav-item topNavText"><a class="nav-link" href="#"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">예약</span>
						</a></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-user fa-2x"></i><span
								class="mr-2 d-none d-lg-inline text-gray-600 small topNavText">
									아이디 들어갈자리</span>
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">