<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sb-admin-2.min.css"/>"
	rel="stylesheet">
</head>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {

		if(${navNo==1}){
			$('#navSideBar')
			.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">새결재작성하기</button></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/electronic/myDocument"/>"><i class="fas fa-fw fa-table"></i><span>자주쓰는양식</span></a></li><li class="nav-item"><a class="nav-link"href="#" id="insertStamp"><i class="fas fa-fw fa-table"></i><span>결재도장등록</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-fw fa-cog"></i><span>결재</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>1">결재대기문서</a><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>2">결재수신문서</a><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>3">결재예정문서</a><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>7">결재반려문서</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>내문서함</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>4">기안문서함</a><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>5">임시저장함</a><a class="collapse-item"href="<c:url value="/electronic/electronicList?no="/>6">결재완료문서</a></div></div></li></ul>');
		/* 이메일 */
		}else if(${navNo==2}){
			$('#navSideBar')
			.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><a href="<c:url value="/email/emailWrite"/>"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">메일쓰기</button></a></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="far fa-edit"></i><span>메일함</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=1"/>">받은메일함</a><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=2"/>">보낸메일함</a><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=3"/>">임시보관함</a><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=4"/>">예약메일함</a><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=5"/>">휴지통</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="far fa-edit"></i><span>빠른검색</span></a><div id="collapseTwo" class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=6"/>">안읽은메일함</a><a class="collapse-item"href="<c:url value="/email/emailList?empNo=${empNo}&type=7"/>">중요메일함</a></div></div></li></ul>');
		}else if(${navNo==3}){
			$('#navSideBar')
			.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><div id="clockDate"></div><div id="clockTime"></div><div><ul class="commute-ul"><li class="commute-li"><dl class="commute-dl"><dt>출근시간</dd><c:choose><c:when test="${empty attendDayVo}"><dd id="comeTime">--:--:--</dd></dl></li></c:when><c:otherwise><dd id="comeTime"><fmt:formatDate value="${attendDayVo.attendanceDayOnHour}" pattern="HH:mm:ss"/></dd></dl></li></c:otherwise></c:choose><li class="commute-li"><dl class="commute-dl"><dt>퇴근시간</dd><c:choose><c:when test="${empty attendDayVo.attendanceDayOffHour}"><dd id="leaveTime">--:--:--</dd></dl></li></c:when><c:otherwise><dd id="leaveTime"><fmt:formatDate value="${attendDayVo.attendanceDayOffHour}" pattern="HH:mm:ss"/></dd></dl></li></c:otherwise></c:choose><li class="commute-li"><dl class="commute-dl"><dt>금일근무시간</dd><c:choose><c:when test="${empty attendDayVo.attendanceDayWorkHour}"><dd id="dayWorkTime">--:--:--</dd></dl></li></c:when><c:otherwise><dd id="dayWorkTime"><fmt:formatDate value="${attendDayVo.attendanceDayWorkHour}" pattern="HH:mm:ss"/></dd></dl></li></c:otherwise></c:choose></ul></div><div class="commute-div"><c:choose><c:when test="${empty attendDayVo}"><button type="button" class="btn btn-light btn-commute" id="btnCome">출근하기</button></c:when><c:otherwise><button type="button" class="btn btn-light btn-commute" id="btnCome" disabled="disabled">출근하기</button></c:otherwise></c:choose><c:choose><c:when test="${empty attendDayVo.attendanceDayOffHour}"><button type="button" class="btn btn-light btn-commute" id="btnLeave">퇴근하기</button></c:when><c:otherwise><button type="button" class="btn btn-light btn-commute" id="btnLeave" disabled="disabled">퇴근하기</button></c:otherwise></c:choose></div><br><li class="nav-item"><a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse1"><i class="far fa-calendar-minus"></i><span>MY근태</span></a><div id="collapse1" class="collapse "><div class="bg-white py-2 collapse-inner rounded "><a class="collapse-item" href="<c:url value='/assiduity/main'/>">내근태현황</a><a class="collapse-item" href="<c:url value='/assiduity/annual'/>">내연차내역</a></div></div></li><li class="nav-item"><a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse2"><i class="far fa-calendar-minus"></i><span>부서근태</span></a><div id="collapse2" class="collapse"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item" href="<c:url value='/assiduity/condition'/>">부서근태현황</a><a class="collapse-item" href="<c:url value='/assiduity/stats'/>">부서근태통계</a></div></div></li></ul>');
		}else if(${navNo==4}){
			$('#navSideBar')
			.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd" id="divscheduleAdd"><button type="button" class="btn btn-light btnSchAdd">일정등록</button></div><!--Nav Item-Pages Collapse Menu--><div id="scFolList"><c:forEach var="i" items="${sfList}"><li class="nav-item"><a class="nav-link" href="#"><input type="checkbox" class="ckSch" checked="checked"><span class="list-span">${i.scheduleFolderName}</span><input type="hidden" id="scFolNo${i.scheduleFolderNo }" value="${i.scheduleFolderNo }"></a></li></c:forEach></div><!--Divider--><hr class="sidebar-divider"><li class="nav-item"><a class="nav-link" id="cal-add" href="#"><i class="fas fa-plus"></i><span>일정목록추가</span></a><a class="nav-link" id="cal-edit" href="#"><i class="far fa-edit"></i><span>일정목록수정</span></a><a class="nav-link" id="cal-delete" href="#"><i class="far fa-trash-alt"></i><span>일정목록삭제</span></a></li><!--일정목록추가Modal--><div class="modal modal2" id="myModaladd" data-bs-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록추가</h4><button type="button" class="close" data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="ScFolderVO" id="listAdd"><label class="labelTime3">일정목록명</label><input type="text" class="scFolderText" name="scheduleFolderName"><br><label class="labelTime3">색상</label><input type="color" name="scheduleFolderColor" value="#4ea0ec"><input type="hidden" value="${sessionScope.empNo }" name="empNo"></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info" id="btnAdd">추가</button><button type="button"class="btn btn-danger" data-bs-dismiss="modal">취소</button></div></div></div></div><!--일정목록수정Modal--><div class="modal modal2" id="myModaledit" data-bs-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록수정</h4><button type="button" class="close" data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-edit-form" id="listEd"><label class="labelTime3 ">일정목록</label><select class="edit-select" name="scheduleFolderNo"><c:forEach var="i" items="${sfList }"><option value="${i.scheduleFolderNo }">${i.scheduleFolderName}</option></c:forEach></select><br><label class="labelTime3">일정목록명</label><input type="text" class="scFolderText" name="scheduleFolderName"><br><label class="labelTime3">색상</label><input type="color" name="scheduleFolderColor" value="#4ea0ec"><input type="hidden" value="${sessionScope.empNo }" name="empNo"></form></div><!--Modal footer--><div class="modal-footer"><button type="button" class="btn btn-info" id="btnEdit">수정</button><button type="button"class="btn btn-danger" data-bs-dismiss="modal">취소</button></div></div></div></div><!--일정목록삭제Modal--><div class="modal modal2" id="myModaldelete" data-bs-backdrop="static"><div class="modal-dialog modal-dialog2 "><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록삭제</h4><button type="button" class="close" data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-del-form" id="listDel"><label class="labelTime3">일정목록</label><select class="del-select" name="scheduleFolderNo"><c:forEach var="i" items="${sfList }"><option value="${i.scheduleFolderNo }">${i.scheduleFolderName}</option></c:forEach></select><br><input type="hidden" value="${sessionScope.empNo }" name="empNo"></form></div><!--Modal footer--><div class="modal-footer"><button type="button" class="btn btn-info" id="btnDelete">삭제</button><button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button></div></div></div></div><!--Sidebar Toggler(Sidebar)--><div class="text-center d-none d-md-inline"></div></ul>');
		}else if(${navNo==5}){
		    $('#navSideBar')
					.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><button type="button"class="btn btn-light btnSchAdd"id="newAddressBook">주소록 등록</button><div class="addressBookModal"id="topNavButton"><div class="modal_content"><form name="frmBookWrite" action="<c:url value="/addressBook/write"/>"><div id="bookWriteDiv"><h4>주소록등록</h4><p>등록하기 전 주소록 카테고리가 있어야 등록이 가능합니다.<br>카테고리 수정버튼을 통해 카테고리를 추가, 수정, 삭제 할 수 있습니다.<br></p><div id="userNameInputDiv"class="boxDiv"><label>이름</label><span class="splitSpan">:</span><input type="text"name="addressBookName"id="addressBookName"class="inputItems"></div><div id="telInputDiv"class="boxDiv"><label>전화번호</label><span class="splitSpan">:</span><input type="text"name="addressBookTel"id="addressBook_tel1"class="inputItems"></div><div id="emailInputDiv"class="boxDiv"><label>메일</label><span class="splitSpan">:</span><input type="text"name="addressBookMaile"id="addressBookMaile"class="inputItems"></div><div id="positionBox"class="boxDiv"><label>직위</label><span class="splitSpan">:</span><input type="text"name="addressBookPosition"id="addressBook_position1"class="inputItems"><label style="margin-left:22px;">성별</label><span class="splitSpan">:</span><select name="addressBookGender"class="selectItem1"><option value=""></option><option value="남자">남자</option><option value="여자">여자</option></select></div><div id="officeNameInputBox"class="boxDiv"><label>회사</label><span class="splitSpan">:</span><input type="text"name="addressBookOfficeName"id="addressBook_officeName"class="inputItems"></div><div id="officeNameInputBox"class="boxDiv"><label>회사번호</label><span class="splitSpan">:</span><input type="text"name="addressBookOfficeTel"id="addressBook_officeTel1"class="inputItems"></div><div id="InputDiv"class="boxDiv"><label>카테고리</label><span class="splitSpan">:</span><select name="addressFolderNo" class="selectItem3" id="addressFolderNo"><option value="">선택하세요.</option><c:forEach var="bookFol" items="${bookFolList}"><option value="${bookFol.addressFolderNo}">${bookFol.addressFolderName}</option></c:forEach></select><button type="button" class="btn btn-outline-secondary folBtn" id="editFolBtn">카테고리 수정</button></div><div id="btnItems"><input type="submit"id="bookWriteSubmit"value="등록"><button class="bookCancleBtn" type="button">취소</button></div></div></form></div></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/addressBook/addressBookMain"/>"><i class="fas fa-fw fa-table"></i><span>전체 목록</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-address-book"></i><span>카테고리</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><c:forEach var="bookFol" items="${bookFolList}"><a class="collapse-item"href="<c:url value="/addressBook/list?addressFolderNo=${bookFol.addressFolderNo}"/>">${bookFol.addressFolderName}</a></c:forEach></div></div></li><li class="nav-item"><a class="nav-link"href="<c:url value="/addressBook/addressBookExcel"/>""><i class="fas fa-file-excel"></i><span>주소록 등록(Excel)</span></a></li></ul>');
		}else if(${navNo==6}){
		    $('#navSideBar')
		    .html(
		    		'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><a href="<c:url value="/board/boardWrite"/>"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">글쓰기</button></a></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/board/boardMain"/>"><i class="fas fa-fw fa-table"></i><span>게시판홈</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-building"></i><span>전사게시판</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=1"/>">공지사항</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=2"/>">자료실</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=3"/>">요청게시판</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=3"/>">커뮤니티</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-clipboard"></i><span>부서게시판</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><c:forEach var="folVo" items="${otherFolder}"><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=${folVo.boardFolderNo}"/>">${folVo.boardFolderName}</a></c:forEach></div></div></li></ul>');
		}else if(${navNo==7}){
			$('#navSideBar')
			.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/index"/>"><div class="sidebar-brand-icon rotate-n-15"></div><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><c:forEach var="i" items="${boFolList }"><li class="nav-item"><a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse${i.bookingFolderNo }"><i class="far fa-calendar-minus"></i><span>${i.bookingFolderName}</span></a><div id="collapse${i.bookingFolderNo }" class="collapse"><div class="bg-white py-2 collapse-inner rounded"><c:forEach var="j" items="${boTargetList }"><c:if test="${j.bookingFolderNo==i.bookingFolderNo }"><a class="collapse-item" href="assetInfo?bookingTargetNo=${j.bookingTargetNo }&bookingFolderNo=${i.bookingFolderNo }">${j.bookingTargetName}</a><input type="hidden" class="asset-hidden" value="${j.bookingTargetNo }"></c:if></c:forEach></div></div></li></c:forEach></ul>');
		/* 관리자 */
		}else if(${navNo==8}){
			$('#navSideBar').css("background","#373840");
			$('#navSideBar')
			.html(
					'<!--Sidebar--><ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion"id="accordionSidebar"><!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center "href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><hr class="sidebar-divider d-none d-md-block white"><!--Heading--><a class="adminMain"id="adminMain"href="<c:url value="/admin"/>"><div class="sidebar-brand-text mx-3 ">관리자메인</div></a><!--Divider--><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-user-circle"></i><span>사원관리</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a id="bt_emp1"class="collapse-item"href="<c:url value='/emp/empList'/>">사원목록</a><a id="bt_emp2"class="collapse-item"href="<c:url value='/emp/empWrite'/>">사원등록</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-clipboard-list"></i><span>게시판관리</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a id="bt_board"class="collapse-item"href="<c:url value='/adminBoard/main'/>">카테고리관리</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseThree"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="far fa-edit"></i><span>근태관리</span></a><div id="collapseThree"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a id="bt_ass1"class="collapse-item"href="<c:url value='/assiduity/excess'/>">초과근무승인</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseFour"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="far fa-edit"></i><span>예약관리</span></a><div id="collapseFour"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a id="bt_book1"class="collapse-item"href="<c:url value='/booking/rent'/>">예약승인</a><a id="bt_book2"class="collapse-item"href="<c:url value='/booking/property'/>">자산관리</a></div></div></li></ul>');
		}
		

	});
	
	$(function(){
		$("#ori-toggle").click(function(){
			var element = document.getElementById("ori-toggle");
			
			if(document.getElementById("ori").style.height == "438px"){
				document.getElementById("ori").style.height = "50px"
				document.getElementById("ori-div2").style.display = "none";
				element.classList.remove("fa-chevron-down");
			    element.classList.add("fa-chevron-up");
			}else{
				document.getElementById("ori").style.height = "438px";
				document.getElementById("ori-div2").style.display = "block";
				element.classList.add("fa-chevron-down");
				element.classList.remove("fa-chevron-up");
			}
			
		});
		
		$('#intoChat').click(function(){
			window
			.open(
					'<c:url value='/room'/>',
					'_blank ',
					'top=40, left=40, width=600, height=800, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=0, titlebar=no');
		});
	
		
		$('#bt_emp1').click(function(){
			console.log('클릭');
			var admin = $('#adminLev').val();
			console.log(admin);
			if(admin!=1 && admin!=2){
				alert('권한이없습니다');
				event.preventDefault();
			}
		});
		
		$('#bt_emp2').click(function(){
			console.log('클릭');
			var admin = $('#adminLev').val();
			console.log(admin);
			if(admin!=1 && admin!=2){
				alert('권한이없습니다');
				event.preventDefault();
			}
		});
		
		$('#bt_ass1').click(function(){
			console.log('클릭');
			var admin = $('#adminLev').val();
			console.log(admin);
			if(admin!=1 && admin!=2){
				alert('권한이없습니다');
				event.preventDefault();
			}
		});
		
		$('#bt_board').click(function(){
			console.log('클릭');
			var admin = $('#adminLev').val();
			console.log(admin);
			if(admin!=1 && admin!=3){
				alert('권한이없습니다');
				event.preventDefault();
			}
		});
		
		$('#bt_book1').click(function(){
			console.log('클릭');
			var admin = $('#adminLev').val();
			console.log(admin);
			if(admin!=1 && admin!=3){
				alert('권한이없습니다');
				event.preventDefault();
			}
		});
		
		$('#bt_book2').click(function(){
			console.log('클릭');
			var admin = $('#adminLev').val();
			console.log(admin);
			if(admin!=1 && admin!=3){
				alert('권한이없습니다');
				event.preventDefault();
			}
		});
			
	});
</script>
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

/* 어사이드 */
.ori {
	height: 50px;
	top: 860px;
	width: 223px;
	z-index: 60;
	position: absolute;
	left: 0px;
	bottom: 0px;
	padding: 5px 0px;
	background: #434343;
	display: block;
	position: fixed;
	top: auto;
	left: 0;
	right: 0;
	left: 0;
}

.ori-span1 {
	position: absolute;
	right: 2px;
	top: 14px;
}

.ori-span2 {
	width: 25px;
	height: 12px;
}

.ori-div1 {
	margin: 0px 30px 5px 8px;
	width: auto;
	overflow: hidden;
	background-color: #2e2e2e;
	border: 1px solid #4d4f50;
}

.ori-div2 {
	display: none;
	margin: 0 10px;
	padding: 0;
}

.ori-div3 {
	height: 400px;
	display: block;
	width: 100%;
	min-height: 110px;
	border: 1px solid #ddd;
	border-radius: 0 0 5px 5px;
	overflow-y: auto;
	margin: 0;
	background: #fff;
	padding: 0;
}

.ori-div4 {
	min-height: 375px;
	max-height: 375px;
	background-color: #fff !important;
	padding: 10px 5px;
	font-size: 13px;
}

.ori-from {
	margin: 0;
	padding: 0;
	display: block;
}

.ori-input-text1 {
	width: 210px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 13px;
}

.test {
	display: block;
}
/* 어사이드 */
#adminMain {
	height: 40px;
	text-align: center;
	text-decoration: none;
	color: white;
	font-weight: 300;
	font-size: 1em;
}

.modal-aside {
	display: block; /* position: relative; */
	pointer-events: none; /* background clickable */
}

.modal-backdrop-aside { /* display: block; 검은색레이어*/
	display: none; /* background clickable */
}

#navSideBar {
	background: #258493;
}

/*티틀*/
#container {
	color: #999;
	text-transform: uppercase;
	font-size: 24px;
	font-weight: bold;
	width: 40%;
	bottom: 50%;
	display: block;
	float: left;
}

#flip {
	height: 50px;
	overflow: hidden;
}

#flip>div>div {
	color: #fff;
	padding: 4px 12px;
	height: 50px;
	margin-bottom: 50px;
	display: inline-block;
}

#flip div:first-child {
	animation: show 7s linear infinite;
}

#flip div div {
	background: #ff859d;
}

#flip div:first-child div {
	background: #46ddff;
}

#flip div:last-child div {
	background: #89ffa8;
}

@keyframes show { 0% {
	margin-top: -270px;
}
5%{
margin-top:-180px;
}
33%{
margin-top:-180px;
}
38%{
margin-top:-90px;
}
66%{
margin-top:-90px;
}
71%{
margin-top:0px;
}
99.99%{
margin-top:0px;
}
100%{
margin-top:-270px;
}
}

/* 어사이드 */
</style>


<body id="page-top">
	<input type="hidden" id="adminLev" value="${sessionScope.empAdminLev }">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<div id="navSideBar">
			<c:if test="${empty navNo}">
				<!-- Sidebar -->
				<ul
					class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
					id="accordionSidebar">


					<!-- Sidebar - Brand -->
					<a
						class="sidebar-brand d-flex align-items-center justify-content-center"
						href="<c:url value="/index"/>">

						<div class="sidebar-brand-text mx-3" style="width: 768px;">IU</div>
						<div>intranet user interface</div>
					</a>

					<div class="card">
						<!-- 프로필 사진 -->
						<img
							src="<c:url value ="/resources/emp_images/${sessionScope.empPhoto }"/>"
							class="card-img-top img-thumbnail" alt="..."  style="width: 222px; height: 222px; object-fit: cover; object-position: 100% 0;">
						<ol class="breadcrumb mt-3">
							<li class="breadcrumb-item">안읽은 메일</li>
							<li class="breadcrumb-item"><a
								href="<c:url value="/email/emailList?empNo=${sessionScope.empNo }&type=6"/>">
									${mailCount }개 </a></li>
						</ol>
						<ol class="breadcrumb">
							<li class="breadcrumb-item">오늘 일정</li>
							<li class="breadcrumb-item"><a href="<c:url value='/schedule/scheduleMain'/>">${todayScheduleCnt}개</a></li>
						</ol>
						<div class="card-body">
							<a href="<c:url value='/email/emailWrite'/>" class="card-link"><button
									type="button" class="btn btn-outline-info btn-lg w-100">메일
									쓰기</button></a>

							<button type="button"
								class="btn btn-outline-info btn-lg w-100 mt-3">
								<a href="<c:url value="/schedule/write"/>" class="card-link">일정
									등록</a> <br>
							</button>

						</div>
					</div>
					<div class="card">
						<div class="card-header">근태 관리</div>
						<ul class="list-group list-group-flush">
							<c:if test="${empty attendDayVO }">
								<li class="list-group-item">오늘 일한 시간
									<p class="card-text" id="timeSize">-- : --</p>
								</li>
								<li class="list-group-item">출근 시간
									<p class="card-text" id="timeSize">-- : --</p>
								</li>

								<li class="list-group-item">퇴근 시간
									<p class="card-text" id="timeSize">-- : --</p>
								</li>
							</c:if>
							<c:if test="${!empty attendDayVO }">
								<c:if test="${!empty attendDayVO.attendanceDayWorkHour}">
									<li class="list-group-item">오늘 일한 시간
										<p class="card-text" id="timeSize">
											<fmt:formatDate value="${attendDayVO.attendanceDayWorkHour}"
												pattern="HH시간 mm분" />
										</p>
									</li>
								</c:if>
								<c:if test="${empty attendDayVO.attendanceDayWorkHour}">
									<li class="list-group-item">오늘 일한 시간
										<p class="card-text" id="timeSize">-- : --</p>
									</li>
								</c:if>
								<c:if test="${!empty attendDayVO.attendanceDayOnHour}">
									<li class="list-group-item">출근 시간
										<p class="card-text" id="timeSize">
											<fmt:formatDate value="${attendDayVO.attendanceDayOnHour}"
												pattern="HH시간 mm분" />
										</p>
									</li>
								</c:if>
								<c:if test="${empty attendDayVO.attendanceDayOnHour}">
									<li class="list-group-item">출근 시간
										<p class="card-text" id="timeSize">-- : --</p>
									</li>
								</c:if>
								<c:if test="${!empty attendDayVO.attendanceDayOffHour}">
									<li class="list-group-item">퇴근 시간
										<p class="card-text" id="timeSize">
											<fmt:formatDate value="${attendDayVO.attendanceDayOffHour}"
												pattern="HH시간 mm분" />
										</p>
									</li>
								</c:if>
								<c:if test="${empty attendDayVO.attendanceDayOffHour}">
									<li class="list-group-item">퇴근 시간
										<p class="card-text" id="timeSize">-- : --</p>
									</li>
								</c:if>
							</c:if>
						</ul>
					</div>


					<!-- Divider -->
					<hr class="sidebar-divider d-none d-md-block">

					<!-- Sidebar Toggler (Sidebar) -->
					<div class="text-center d-none d-md-inline"></div>

				</ul>
				<!-- End of Sidebar -->
			</c:if>
		</div>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<div id=container>
						<div id=flip>
							<div>
								<div>열정없이 사느니 차라리 죽는게 낫다</div>
							</div>
							<div>
								<div>이 사악한 세상에서 영원한 것은 없다</div>
							</div>
							<div>
								<div>지지마라 세상에도 나약한 내 자신에게도</div>
							</div>
						</div>
					</div>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<li class="nav-item topNavText"><a class="nav-link"
							href="<c:url value="/electronic/electronicMain"/>" id="testBt"
							role="button"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">전자 결재</span>
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
							href="<c:url value='/addressBook/addressBookMain?empNo=${empNo }'/>"
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
						<li class="nav-item " style="padding-top: 16px;">
							<button type="button" class="btn btn-dark" id="intoChat">채팅</button>
						</li>
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img
								src="<c:url value ="/resources/emp_images/${sessionScope.empPhoto }"/>"
								class="rounded-circle" style="width: 35px; height: 35px; object-fit: cover; object-position: 100% 0;">
								<span
								class="mr-2 d-none d-lg-inline text-gray-600 small topNavText">
									${empName}</span>
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown" style="left: -55px;">
								<a class="dropdown-item"
									href="<c:url value='/emp/empInfo?empNo=${empNo}'/>"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내정보
								</a>
								<c:if test="${empAdminLev==1||empAdminLev==2 || empAdminLev==3}">
									<a class="dropdown-item" href="<c:url value='/admin'/>"> <i
										class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 관리자
									</a>
								</c:if>

								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<c:url value="/login/logout"/>"
									data-toggle="modal" data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->
				<!-- 조직도 시작 -->
				<aside class="ori" id="ori">
					<h3>
						<span class="ori-span1"> <span id="ori-toggle"
							class="fas fa-chevron-up ori-span2"></span>
						</span>
					</h3>
					<div class="ori-div1">
						<div class="ori-from" action="">
							<input class="ori-input-text1" type="text" placeholder="이름"
								id="oriName" name="oriName" title="이름">
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