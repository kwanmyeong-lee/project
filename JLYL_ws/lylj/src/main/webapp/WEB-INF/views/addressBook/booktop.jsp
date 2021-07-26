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
	<!--Sidebar-->
	<ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
		id="accordionSidebar">
		<!--Sidebar-Brand-->
		<a class="sidebar-brand d-flex align-items-center justify-content-center"
			href="<c:url value="/index"/>">
		<div class="sidebar-brand-text mx-3">메인으로이동</div></a>
		<!--Heading-->
		<button type="button" class="btn btn-light btnSchAdd"
			id="newAddressBook">주소록 등록</button>
		<div class="addressBookModal" id="topNavButton">
			<div class="modal_content">
				<form name="frmBookWrite"
					action="<c:url value="/addressBook/write"/>">
					<div id="bookWriteDiv">
						<h4>주소록등록</h4>
						<p>설명을어쩌규저쩌구할것임ㅇㅇ</p>
						<div id="userNameInputDiv" class="boxDiv">
							<label>이름</label><span class="splitSpan">:</span><input
								type="text" name="addressBookName" id="addressBookName"
								class="inputItems">
						</div>
						<div id="telInputDiv" class="boxDiv">
							<label>번호</label><span class="splitSpan">:</span><input
								type="text" name="addressBookTel" id="addressBookTel"
								class="inputItems">
						</div>
						<div id="emailInputDiv" class="boxDiv">
							<label>메일</label><span class="splitSpan">:</span><input
								type="text" name="addressBookMaile" id="addressBookMaile"
								class="inputItems">
						</div>
						<div id="positionBox"class="boxDiv">
							<label>직위</label><span class="splitSpan">:</span>
							<input type="text" name="addressBookPosition" id="addressBook_position1" class="inputItems">
							<label style="margin-left:22px;">성별</label><span class="splitSpan">:</span>
							<select name="addressBookGender" class="selectItem1">
								<option value=""></option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>
						<div id="officeNameInputBox"class="boxDiv">
							<label>회사</label><span class="splitSpan">:</span>
							<input type="text" name="addressBookOfficeName" id="addressBook_officeName" class="inputItems">
						</div>
						<div id="officeNameInputBox"class="boxDiv">
							<label>회사번호</label><span class="splitSpan">:</span>
							<input type="text" name="addressBookOfficeTel" id="addressBook_officeTel1" class="inputItems">
						</div>
						<div id="InputDiv" class="boxDiv">
							<label>카테고리</label><span class="splitSpan">:</span>
							<select name="addressFolderNo" class="selectItem" id="addressFolderNo">
								<c:if test="${empty bookFolList}">
								<option value="">선택하세요.</option>
								</c:if>
								<c:if test="${!empty bookFolList}">
									<c:forEach var="bookFol" items="${bookFolList}">
										<option value="${bookFol.addressFolderNo}">${bookFol.addressFolderName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div id="btnItems">
							<input type="submit" id="bookWriteSubmit" value="등록">
							<button class="bookCancleBtn" type="button">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--Divider-->
		<hr class="sidebar-divider d-none d-md-block">
		<!--Nav Item-Tables-->
		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/addressBook/addressBookMain"/>"><i
				class="fas fa-fw fa-table"></i><span>전체 목록</span></a></li>
		<!--Nav Item-Pages Collapse Menu-->
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#collapseOne" data-bs-toggle="collapse" role="button"
			aria-expanded="ture" aria-controls="collapseOne"><i
				class="fas fa-fw fa-table"></i><span>카테고리</span></a>
			<div id="collapseOne" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<c:if test="${empty bookFolList}">카테고리를 추가하세요.</c:if>
					<c:if test="${!empty bookFolList}">
						<c:forEach var="bookFol" items="${bookFolList}">
							<a class="collapse-item" href="#">${bookFol.addressFolderName}</a>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</li>
	</ul>
	
	<!--Sidebar-->
	<ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
		id="accordionSidebar">
		<!--Sidebar-Brand-->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/index"/>">
			<div class="sidebar-brand-text mx-3">메인으로이동</div>
		</a>
		<!--Heading-->
		<button type="button" class="btn btn-light btnSchAdd" id="newAddressBook">주소록 등록</button>
		<div class="addressBookModal" id="topNavButton">
			<div class="modal_content">
				<form name="frmBookWrite"
					action="<c:url value="/addressBook/write"/>">
					<div id="bookWriteDiv">
						<h4>주소록등록</h4>
						<p>설명을어쩌규저쩌구할것임ㅇㅇ</p>
						<div id="userNameInputDiv" class="boxDiv">
							<label>이름</label><span class="splitSpan">:</span><input
								type="text" name="addressBookName" id="addressBookName"
								class="inputItems">
						</div>
						<div id="telInputDiv" class="boxDiv">
							<label>번호</label><span class="splitSpan">:</span><input
								type="text" name="addressBookTel" id="addressBookTel"
								class="inputItems">
						</div>
						<div id="emailInputDiv" class="boxDiv">
							<label>메일</label><span class="splitSpan">:</span><input
								type="text" name="addressBookMaile" id="addressBookMaile"
								class="inputItems">
						</div>
						<div id="positionBox"class="boxDiv">
							<label>직위</label><span class="splitSpan">:</span>
							<input type="text" name="addressBookPosition" id="addressBook_position1" class="inputItems">
							<label style="margin-left:22px;">성별</label><span class="splitSpan">:</span>
							<select name="addressBookGender" class="selectItem1">
								<option value=""></option>
								<option value="남자">남자</option>
								<option value="여자">여자</option>
							</select>
						</div>
						<div id="officeNameInputBox"class="boxDiv">
							<label>회사</label><span class="splitSpan">:</span>
							<input type="text" name="addressBookOfficeName" id="addressBook_officeName" class="inputItems">
						</div>
						<div id="officeNameInputBox"class="boxDiv">
							<label>회사번호</label><span class="splitSpan">:</span>
							<input type="text" name="addressBookOfficeTel" id="addressBook_officeTel1" class="inputItems">
						</div>
						<div id="InputDiv" class="boxDiv">
							<label>카테고리</label><span class="splitSpan">:</span><select
								name="addressFolderNo" class="selectItem"><option
									value="">선택하세요.</option>
								<c:forEach var="bookFol" items="${bookFolList}">
									<option value="${bookFol.addressFolderNo}">${bookFol.addressFolderName}</option>
								</c:forEach></select>
						</div>
						<div id="btnItems">
							<input type="submit" id="bookWriteSubmit" value="등록">
							<button class="bookCancleBtn" type="button">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--Divider-->
		<hr class="sidebar-divider d-none d-md-block">
		<!--Nav Item-Tables-->
		<li class="nav-item"><a class="nav-link"
			href="<c:url value="/addressBook/addressBookMain"/>"><i
				class="fas fa-fw fa-table"></i><span>전체 목록</span></a></li>
		<!--Nav Item-Pages Collapse Menu-->
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#collapseOne" data-bs-toggle="collapse" role="button"
			aria-expanded="ture" aria-controls="collapseOne"><i
				class="fas fa-fw fa-table"></i><span>카테고리</span></a>
		<div id="collapseOne" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<c:forEach var="bookFol" items="${bookFolList}">
						<a class="collapse-item" href="#">${bookFol.addressFolderName}</a>
					</c:forEach>
				</div>
			</div>
		</li>
	</ul>
</body>
</html>