<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>사원등록</title>

<!-- Custom fonts for this template-->
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


</head>
<script type="text/javascript"
   src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<style>
.maincontainer{
   width: 100%;
}

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
.emailSide{
   margin-top: 10px;
   font-size: 14px;
}
.btnSchAdd {
   width: 93%;
}

#empWrite {
   margin-left: 11px;
}

.btnSchAdd {
   width: 93%;
}
.sidebar-divider{
   color: black;
}
#adminMain{
   height: 40px;
   text-align: center;
   text-decoration: none;
   color: white;
   font-weight: 300;
   font-size: 1em;
}
.white{
   background: white;
}

</style>
<script>
	$(function(){
		$('#bt_empList').click(function(){
			var admin = '<%=(String)session.getAttribute("empAdminLev")%>';
			console.log(admin);
			if(admin!=1 && admin !=2){
				alert('권한이 없습니다.');
				event.preventDefault();
			}
		});
	});
	
	
</script>

<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">

<!--Sidebar-->
<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
	<!--Sidebar-Brand-->
	<a class="sidebar-brand d-flex align-items-center justify-content-center " href="<c:url value=" /index"/>">
	<div class="sidebar-brand-text mx-3">
		메인으로이동
	</div>
	</a>
	<hr class="sidebar-divider d-none d-md-block white">
	<!--Heading-->
	<a class="adminMain" id="adminMain" href="<c:url value=" /admin"/>">
	<div class="sidebar-brand-text mx-3 ">
		관리자메인
	</div>
	</a>
	<!--Divider-->
	<!--Nav Item-Pages Collapse Menu-->
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#collapseOne" data-bs-toggle="collapse" role="button" aria-expanded="ture" aria-controls="collapseOne"><i class="fas fa-user-circle"></i><span>사원관리</span></a>
	<div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<a id="bt_emp1" class="collapse-item" href="<c:url value='/emp/empList'/>">사원목록</a>
			<a id="bt_emp2" class="collapse-item" href="<c:url value='/emp/empWrite'/>">사원등록</a>
		</div>
	</div>
	</li>
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#collapseTwo" data-bs-toggle="collapse" role="button" aria-expanded="true"><i class="fas fa-clipboard-list"></i><span>게시판관리</span></a>
	<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<a id="bt_board" class="collapse-item" href="<c:url value='/adminBoard/main'/>">카테고리 관리</a>
		</div>
	</div>
	</li>
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#collapseThree" data-bs-toggle="collapse" role="button" aria-expanded="true"><i class="far fa-edit"></i><span>근태관리</span></a>
	<div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<a id="bt_ass1" class="collapse-item" href="<c:url value='/assiduity/excess'/>">초과근무승인</a>
		</div>
	</div>
	</li>
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#collapseFour" data-bs-toggle="collapse" role="button" aria-expanded="true"><i class="far fa-edit"></i><span>예약관리</span></a>
	<div id="collapseFour" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<a id="bt_book1" class="collapse-item" href="<c:url value='/booking/rent'/>">예약승인</a>
			<a id="bt_book2" class="collapse-item" href="<c:url value='/booking/property'/>">자산관리</a>
		</div>
	</div>
	</li>
</ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">

         <!-- Main Content -->
         <div id="content">

            <!-- Topbar -->
            <nav
               class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


               <!-- Topbar Navbar -->
               <ul class="navbar-nav ml-auto">
                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value="/electronic/electronicMain"/>" id="testBt"
                     role="button"> <span
                        class="mr-2 d-none d-lg-inline text-gray-600 small">전자 결제</span>
                  </a></li>
                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value="/email/emailMain"/>" role="button"> <span
                        class="mr-2 d-none d-lg-inline text-gray-600 small">메일</span>
                  </a></li>

                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value="/assiduity/main"/>" role="button"> <span
                        class="mr-2 d-none d-lg-inline text-gray-600 small">근태</span>
                  </a></li>

                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value='/schedule/scheduleMain'/>" role="button">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">일정</span>
                  </a></li>
                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value="/addressBook/addressBookMain"/>"
                     role="button"> <span
                        class="mr-2 d-none d-lg-inline text-gray-600 small">주소록</span>
                  </a></li>

                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value="/board/boardMain"/>" role="button"> <span
                        class="mr-2 d-none d-lg-inline text-gray-600 small">게시판</span>
                  </a></li>
                  <li class="nav-item topNavText"><a class="nav-link"
                     href="<c:url value='/booking/main'/>" role="button"> <span
                        class="mr-2 d-none d-lg-inline text-gray-600 small">예약</span>
                  </a></li>

                  <div class="topbar-divider d-none d-sm-block"></div>

                  <!-- Nav Item - User Information -->
                  <li class="nav-item dropdown no-arrow"><a
                     class="nav-link dropdown-toggle" href="#" id="userDropdown"
                     role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user fa-2x"></i><span
                        class="mr-2 d-none d-lg-inline text-gray-600 small topNavText">
                           ${empName}</span>
                  </a> <!-- Dropdown - User Information -->
                     <div
                        class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#"> <i
                           class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내정보
                        </a>
                        <c:if test="${empAdminLev==1||empAdminLev==2}">
                           <a class="dropdown-item" href="<c:url value='/emp/empList'/>"> <i
                              class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 사원관리
                           </a>
                        </c:if>

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<c:url value="/login/logout"/>" data-toggle="modal"
                           data-target="#logoutModal"> <i
                           class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                           로그아웃
                        </a>
                     </div></li>

               </ul>

            </nav>
            <!-- End of Topbar -->
               <aside class="ori" id="ori">
               <h3>
                  <span class="ori-span1"> <span id="ori-toggle"
                     class="fas fa-chevron-up ori-span2"></span>
                  </span>
               </h3>
               <div class="ori-div1">
                  <div class="ori-from" action="">
                     <input class="ori-input-text1" type="text" placeholder="이름" id="oriName" name="oriName"
                        title="이름">
                  </div>
               </div>
               <div class="ori-div2" id="ori-div2">
                  <div class="ori-div3">
                     <div class="ori-div4">
                        <c:import url="/inc/organizationChart"></c:import>
                     </div>
                  </div>
               </div>
            </aside>

            <!-- Begin Page Content -->
            <div class="container-fluid">
            <!-- Begin Page Content -->
            <div class="container-fluid maincontainer">