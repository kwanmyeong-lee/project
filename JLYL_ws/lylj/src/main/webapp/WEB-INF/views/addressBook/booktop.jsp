<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$("#newAddressBook").click(function() {
			$(".addressBookModal").fadeIn();
		});
		$("#bookWritwCancleBtn").click(function() {
			$(".addressBookModal").fadeOut();
		});
	});
</script>
</head>
<body>
	<!--Sidebar-Brand-->
	<a class="sidebar-brand d-flex align-items-center justify-content-center"
	 href="<c:url value="/index"/>">
	 	<div class="sidebar-brand-text mx-3">메인으로이동</div></a>
	<!--Heading-->
	<button type="button" class="btn btn-light btnSchAdd" id="newAddressBook">주소록 등록</button>
	<div class="addressBookEditModal" id="topNavButton">
		<div class="editModal_content">
			<form name="frmBookWrite" action="#">
				<div id="bookWriteDiv">
						<h4>주소록 수정</h4>
						<p>설명을 어쩌규 저쩌구 할것임 ㅇㅇ</p>
						<div id="userNameInputDiv" class="boxDiv">
							<label>이름</label><span class="splitSpan">:</span>
							<input type="text" name="addressBook_name" id="addressBook_name" class="inputItems">
						</div>
						<div id="telInputDiv" class="boxDiv">
							<label>번호</label><span class="splitSpan">:</span>
							<input type="text" name="addressBook_tel" id="addressBook_tel" class="inputItems">
						</div>
						<div id="emailInputDiv" class="boxDiv">
							<label>메일</label><span class="splitSpan">:</span>
							<input type="text" name="addressBook_maile" id="addressBook_maile" class="inputItems">
						</div>
						<div id="InputDiv" class="boxDiv">
							<label>부서</label><span class="splitSpan">:</span>
							<select name="boooo" id="" class="selectItem">
								<option>부서1</option>
								<option>부서2</option>
							</select>
						</div>
						<div id="positionInputDiv" class="boxDiv">
							<label>직급</label><span class="splitSpan">:</span>
							<select name="boooo" id="" class="selectItem">
								<option>사원</option>
								<option>팀장</option>
								<option>관리자</option>
							</select>
							
						</div>
						<div id="btnItems">
							<input type="submit" id="bookWriteSubmit" value="수정">
							<button id="bookWritwCancleBtn">취소</button>
						</div>
				</div>
			</form>
		</div>
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