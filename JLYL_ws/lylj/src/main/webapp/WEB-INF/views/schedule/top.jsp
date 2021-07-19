<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <!-- 여기서부터 왼쪽 -->
                <!-- 이 부분 부터 메인 top에 넣을 소스 -->
                <!--Sidebar-Brand-->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/index"/>">
                    <div class="sidebar-brand-text mx-3">메인으로이동</div>
                </a><!--Heading-->            
                <div class="scheduleAdd" id="divscheduleAdd">
                    <button type="button" class="btn btn-light btnSchAdd">일정등록</button>
                </div><!--Nav Item-Pages Collapse Menu-->
                
                <div id="scFolList">
                <c:forEach var="i" items="${sfList}">
                <li class="nav-item">
                    <a class="nav-link" href="#"><input type="checkbox" class="ckSch" checked="checked"><span class="list-span">${i.scheduleFolderName }</span>
                    <input type="hidden" id="scFolNo${i.scheduleFolderNo }" value="${i.scheduleFolderNo }">
                    </a>
                    
                </li>
                </c:forEach>
                </div>
                <!--Divider--><hr class="sidebar-divider"><li class="nav-item">
                    <a class="nav-link" id="cal-add" href="#">
                        <i class="fas fa-plus"></i>
                        <span>일정목록추가</span>
                    </a>
                    <a class="nav-link" id="cal-edit" href="#">
                        <i class="far fa-edit"></i>
                        <span>일정목록수정</span>
                    </a>
                    <a class="nav-link" id="cal-delete" href="#">
                        <i class="far fa-trash-alt"></i>
                        <span>일정목록삭제</span>
                    </a>
                </li><!--일정목록추가Modal--><div class="modal modal2" id="myModaladd" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog2">
                        <div class="modal-content"><!--Modal Header--><div class="modal-header">
                                <h4 class="modal-title">일정목록추가</h4>
                                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                            </div><!--Modal body--><div class="modal-body">
                                <form name="ScFolderVO" id="listAdd">
                                    <label class="labelTime3">일정목록명</label><input type="text" class="scFolderText" name="scheduleFolderName" ><br>
                                	<label class="labelTime3">색상</label><input type="color" name="scheduleFolderColor" value="#4ea0ec">
                                	<input type="hidden" value="${sessionScope.empNo }" name="empNo" >    
                                </form>
                            </div><!--Modal footer--><div class="modal-footer">
                                <button type="button" class="btn btn-info" id="btnAdd">추가</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div><!--일정목록수정Modal--><div class="modal modal2" id="myModaledit" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog2">
                        <div class="modal-content"><!--Modal Header--><div class="modal-header">
                                <h4 class="modal-title">일정목록수정</h4>
                                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                            </div><!--Modal body--><div class="modal-body">
                                <form name="list-edit-form" id="listEd">
                                    <label class="labelTime3 ">일정목록</label>
                                    <select class="edit-select" name="scheduleFolderNo">
                                    	<c:forEach var="i" items="${sfList }">
                                        <option value="${i.scheduleFolderNo }">${i.scheduleFolderName}</option>
                                        </c:forEach>
                                    </select><br><label class="labelTime3">일정목록명</label><input type="text" class="scFolderText" name="scheduleFolderName"><br>
                                    <label class="labelTime3">색상</label><input type="color" name="scheduleFolderColor" value="#4ea0ec"> 
                                    <input type="hidden" value="${sessionScope.empNo }" name="empNo" >
                                    </form>
                            </div><!--Modal footer--><div class="modal-footer">
                                <button type="button" class="btn btn-info" id="btnEdit">수정</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div><!--일정목록삭제Modal--><div class="modal modal2" id="myModaldelete" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog2 ">
                        <div class="modal-content"><!--Modal Header--><div class="modal-header">
                                <h4 class="modal-title">일정목록삭제</h4>
                                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                            </div><!--Modal body--><div class="modal-body">
                                <form name="list-del-form" id="listDel">
                                    <label class="labelTime3">일정목록</label>
                                    <select class="del-select" name="scheduleFolderNo">
                                        <c:forEach var="i" items="${sfList }">
                                        <option value="${i.scheduleFolderNo }">${i.scheduleFolderName}</option>
                                        </c:forEach>
                                    </select><br>
                                    <input type="hidden" value="${sessionScope.empNo }" name="empNo" >
                                    
                                </form>
                            </div><!--Modal footer--><div class="modal-footer">
                                <button type="button" class="btn btn-info" id="btnDelete">삭제</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div><!--Sidebar Toggler(Sidebar)--><div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
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