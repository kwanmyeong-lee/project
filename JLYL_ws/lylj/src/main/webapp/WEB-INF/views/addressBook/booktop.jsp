<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--Sidebar-Brand-->
	<a class="sidebar-brand d-flex align-items-center justify-content-center"
	 href="<c:url value="/index"/>">
	 	<div class="sidebar-brand-text mx-3">메인으로이동</div></a>
	<!--Heading-->
	<div class="scheduleAdd" id="topNavButton">
		<a href="<c:url value="/addressBook/addressBookWrite"/>">
			<button type="button" class="btn btn-light btnSchAdd" id="newDocument">주소록 등록</button>
		</a>
	</div>
	<!--Divider-->
	<hr class="sidebar-divider d-none d-md-block">
	<!--Nav Item-Tables-->
	<li class="nav-item"><a class="nav-link"
		href="<c:url value="/board/boardMain"/>"><i
			class="fas fa-fw fa-table"></i><span>전체 목록</span></a></li>
	<!--Nav Item-Pages Collapse Menu-->
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="#collapseOne" data-bs-toggle="collapse" role="button"
		aria-expanded="ture" aria-controls="collapseOne">
		<i class="fas fa-fw fa-table"></i><span>개발팀</span></a>
	<div id="collapseOne" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item"
					href="#">프론트엔드</a><a
					class="collapse-item"
					href="#">백엔드</a><a
					class="collapse-item"
					href="#">데이터</a>
			</div>
		</div></li>
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="#collapseTwo" data-bs-toggle="collapse" role="button"
		aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>어디게..?</span></a>
	<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item"
					href="#">영업본부</a>
			</div>
		</div>
	</li>
</body>
</html>