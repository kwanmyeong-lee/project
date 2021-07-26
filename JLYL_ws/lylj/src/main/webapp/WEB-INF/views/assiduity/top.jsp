<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin 2 - Blank</title>
        <!-- Custom fonts for this template-->
        <link href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
        <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
    </head>
    <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
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
        #divscheduleAdd {
            margin-left: 11px;
        }
        .btnSchAdd {
            width: 93%;
        }
        .sidebar-divider {
            color: black;
        }
    </style>
    <body
        id="page-top">
        <!-- Page Wrapper -->
        <div
            id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">
                <!--Sidebar-Brand-->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/index"/>">
                    <div class="sidebar-brand-text mx-3">메인으로이동</div>
                </a>
				<div id="clockDate">					
				</div>
				<div id="clockTime">
				</div>
		
				<div>
					<ul class="commute-ul">
						<li class="commute-li"><dl class="commute-dl"><dt>출근시간</dd>
						<c:choose>
							<c:when test="${empty attendDayVo}">
								<dd id="comeTime">--:--:--</dd></dl></li>
							</c:when>
							<c:otherwise>
								<dd id="comeTime"><fmt:formatDate value="${attendDayVo.attendanceDayOnHour}" pattern="HH:mm:ss"/></dd></dl></li>
							</c:otherwise>
						</c:choose>
						<li class="commute-li"><dl class="commute-dl"><dt>퇴근시간</dd>
						<c:choose>
							<c:when test="${empty attendDayVo.attendanceDayOffHour}">
								<dd id="leaveTime">--:--:--</dd></dl></li>
							</c:when>
							<c:otherwise>
								<dd id="leaveTime"><fmt:formatDate value="${attendDayVo.attendanceDayOffHour}" pattern="HH:mm:ss"/></dd></dl></li>
							</c:otherwise>
						</c:choose>						
						<li class="commute-li"><dl class="commute-dl"><dt>금일 근무시간</dd>
						<c:choose>
							<c:when test="${empty attendDayVo.attendanceDayWorkHour}">
								<dd id="dayWorkTime">--:--:--</dd></dl></li>
							</c:when>
							<c:otherwise>
								<dd id="dayWorkTime"><fmt:formatDate value="${attendDayVo.attendanceDayWorkHour}" pattern="HH:mm:ss"/></dd></dl></li>
							</c:otherwise>
						</c:choose>	
						
					</ul>
				</div>
				
				<div class="commute-div">
					<c:choose>
							<c:when test="${empty attendDayVo}">
								<button type="button" class="btn btn-light btn-commute" id="btnCome">출근하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light btn-commute" id="btnCome" disabled="disabled">출근하기</button>
							</c:otherwise>
					</c:choose>
					<c:choose>
							<c:when test="${empty attendDayVo.attendanceDayOffHour}">
								<button type="button" class="btn btn-light btn-commute" id="btnLeave">퇴근하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light btn-commute" id="btnLeave" disabled="disabled">퇴근하기</button>
							</c:otherwise>
					</c:choose>
				</div>
				<br>
				
				<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-bs-toggle="collapse" data-bs-target="#collapse1"> 
				<i class="far fa-calendar-minus"></i> <span>근태관리</span>
			</a>  <div id="collapse1" class="collapse ">
                    <div class="bg-white py-2 collapse-inner rounded ">
                        <a class="collapse-item" href="<c:url value='/assiduity/main'/>">내 근태 현황</a>
                        <a class="collapse-item" href="<c:url value='/assiduity/annual'/>">내 연차 내역</a>
                    </div>
                </div> </li>
                
                <li class="nav-item"><a class="nav-link collapsed" href="#"
				data-bs-toggle="collapse" data-bs-target="#collapse2"> 
				<i class="far fa-calendar-minus"></i> <span>부서 근태관리</span>
			</a>  <div id="collapse2" class="collapse">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/assiduity/condition'/>">부서 근태현황</a>
                        <a class="collapse-item" href="<c:url value='/assiduity/stats'/>">부서 근태통계</a>
                    </div>
                </div> </li>
            </ul>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div
                id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div
                    id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <span id="mainTopText">저기 힘차게 떠오르는 태양처럼 오늘도 힘차게 아자아자!</span>
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="<c:url value="/electronic/electronicMain"/>" id="testBt" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">전자 결제</span>
                                </a>
                            </li>
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="<c:url value="/email/emailMain"/>" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">메일</span>
                                </a>
                            </li>
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">근태</span>
                                </a>
                            </li>
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="<c:url value='/schedule/scheduleMain'/>" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">일정</span>
                                </a>
                            </li>
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">주소록</span>
                                </a>
                            </li>
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="<c:url value='board/boardMain'/>" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">게시판</span>
                                </a>
                            </li>
                            <li class="nav-item topNavText">
                                <a class="nav-link" href="<c:url value='/booking/main'/>" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">예약</span>
                                </a>
                            </li>
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-user fa-2x"></i>
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small topNavText">
                                        아이디 들어갈자리</span>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">