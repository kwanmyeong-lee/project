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
        <link href="<c:url value="/resources/css/sb-admin-2.min.css"/>" rel="stylesheet">
    </head>
    <style>
        #divscheduleAdd {
            margin-left: 11px;
        }
        .btnSchAdd {
            width: 93%;
        }
    </style>
    <body
        id="page-top">
        <!-- Page Wrapper -->
        <div
            id="wrapper">
            <!-- Sidebar -->
            <ul
                class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">
                <!--Sidebar-Brand-->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/index"/>">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3">메인으로이동</div>
                </a><!--Heading--><div class="scheduleAdd" id="divscheduleAdd">
                    <button type="button" class="btn btn-light btnSchAdd btnRentAdmin">예약/대여</button>
                </div><!--Nav Item-Pages Collapse Menu--><li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
                        <i class="far fa-calendar-minus"></i>
                        <span>본사1층회의실</span>
                    </a>
                    <div id="collapse1" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="assetInfo">대회의실</a>
                            <a class="collapse-item" href="buttons">소회의실</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="true" aria-controls="collapse2">
                        <i class="far fa-calendar-minus"></i>
                        <span>본사5층회의실</span>
                    </a>
                    <div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="buttons">대회의실</a>
                            <a class="collapse-item" href="buttons">소회의실</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
                        <i class="far fa-calendar-minus"></i>
                        <span>차량</span>
                    </a>
                    <div id="collapse3" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="buttons">7498아반떼</a>
                            <a class="collapse-item" href="buttons">3929아반떼</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true" aria-controls="collapse4">
                        <i class="far fa-calendar-minus"></i>
                        <span>빔프로젝터</span>
                    </a>
                    <div id="collapse4" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="buttons">1번빔프로젝터</a>
                            <a class="collapse-item" href="buttons">2번빔프로젝터</a>
                        </div>
                    </div>
                </li><!--Divider--><hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" id="asset-add" href="#">
                        <i class="fas fa-plus"></i>
                        <span>자산추가</span>
                    </a>
                    <a class="nav-link" id="asset-edit" href="#">
                        <i class="far fa-edit"></i>
                        <span>자산수정</span>
                    </a>
                    <a class="nav-link" id="asset-delete" href="#">
                        <i class="far fa-trash-alt"></i>
                        <span>자산삭제</span>
                    </a>
                </li>
                <!-- 일정 목록 추가 Modal -->
                <div class="modal modal2" id="myModaladd" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog2">
                        <div
                            class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">자산 추가</h4>
                                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form name="list-add-form">
                                    <label class="labelTime labelTime2">자산 수정</label><input type="text" id="addTitle">
                                    <br>
                                </form>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info" id="btnAdd">추가</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 일정 목록 수정 Modal -->
                <div class="modal modal2" id="myModaledit" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog2">
                        <div
                            class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">자산 삭제</h4>
                                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form name="list-edit-form">
                                    <label class="labelTime labelTime2">일정 목록</label>
                                    <select>
                                        <option>(기본)내 일정</option>
                                        <option>zzz</option>
                                        <option>zzz</option>
                                    </select>
                                    <br>
                                    <label class="labelTime labelTime2">일정명</label><input type="text" id="editTitle">
                                    <br>
                                </form>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info" id="btnEdit">수정</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 일정 목록 삭제 Modal -->
                <div class="modal modal2" id="myModaldelete" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog2 ">
                        <div
                            class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">일정 목록 삭제</h4>
                                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form name="list-del-form">
                                    <label class="labelTime labelTime2">일정 목록</label>
                                    <select>
                                        <option>(기본)내 일정</option>
                                        <option>zzz</option>
                                        <option>zzz</option>
                                    </select>
                                    <br>
                                </form>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info" id="btnDelete">삭제</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
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
                    <nav
                        class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">전자 결제</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">메일</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">근태</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">캘린더</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">주소록</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">게시판</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" role="button">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">예약</span>
                                </a>
                            </li>
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                        아이디
                                        									들어갈자리</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
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