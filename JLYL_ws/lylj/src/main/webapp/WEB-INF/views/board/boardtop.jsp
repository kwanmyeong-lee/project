<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><a href="<c:url value="/board/boardWrite"/>"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">글쓰기</button></a></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/board/boardMain"/>"><i class="fas fa-fw fa-table"></i><span>게시판홈</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-fw fa-table"></i><span>전사게시판</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=1"/>">전사공지</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=2"/>">자료실</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=3"/>">커뮤니티</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>부서게시판</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=1"/>">게시판~~</a></div></div></li>

	<!--Sidebar-Brand-->
	<a class="sidebar-brand d-flex align-items-center justify-content-center"
	 href="<c:url value="/index"/>">
	 	<div class="sidebar-brand-text mx-3">메인으로이동</div></a>
	<!--Heading-->
	<div class="scheduleAdd" id="topNavButton">
		<a href="<c:url value="/board/boardWrite"/>">
			<button type="button" class="btn btn-light btnSchAdd" id="newDocument">글쓰기</button>
		</a>
	</div>
	<!--Divider-->
	<hr class="sidebar-divider d-none d-md-block">
	<!--Nav Item-Tables-->
	<li class="nav-item"><a class="nav-link"
		href="<c:url value="/board/boardMain"/>"><i
			class="fas fa-fw fa-table"></i><span>게시판 홈</span></a></li>
	<!--Nav Item-Pages Collapse Menu-->
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="#collapseOne" data-bs-toggle="collapse" role="button"
		aria-expanded="ture" aria-controls="collapseOne">
		<i class="fas fa-fw fa-table"></i><span>전사게시판</span></a>
	<div id="collapseOne" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item"
					href="<c:url value="/board/boardList?boardFolderNo=1"/>">전사 공지</a><a
					class="collapse-item"
					href="<c:url value="/board/boardList?boardFolderNo=2"/>">자료실</a><a
					class="collapse-item"
					href="<c:url value="/board/boardList?boardFolderNo=3"/>">커뮤니티</a>
			</div>
		</div></li>
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="#collapseTwo" data-bs-toggle="collapse" role="button"
		aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>부서게시판</span></a>
	<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item"
					href="<c:url value="/board/boardList?boardFolderNo=1"/>">게시판~~</a>
			</div>
		</div>
	</li>
</body>
</html>