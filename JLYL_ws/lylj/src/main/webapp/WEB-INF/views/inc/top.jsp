<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			$('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">새결재작성하기</button></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/electronic/myDocument"/>"><i class="fas fa-fw fa-table"></i><span>자주쓰는양식</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-fw fa-cog"></i><span>결재</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/electronic/electronicDefaultDoc"/>">결재대기문서</a><a class="collapse-item"href="<c:url value="/electronic/electronicDefaultDoc"/>">결재수신문서</a><a class="collapse-item"href="<c:url value="/electronic/electronicDefaultDoc"/>">결재예정문서</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>내문서함</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/electronic/electronicDefaultDoc"/>">기안문서함</a><a class="collapse-item"href="<c:url value="/electronic/electronicDefaultDoc"/>">임시저장함</a><a class="collapse-item"href="<c:url value="/electronic/electronicDefaultDoc"/>">결재완료문서</a></div></div></li>');
		}else if(${navNo==2}){
			$('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><a href="<c:url value="/email/emailWrite"/>"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">메일쓰기</button></a></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="far fa-edit"></i><span>메일함</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/email/emailMain"/>">받은메일함</a><a class="collapse-item"href="<c:url value="/email/emailSand"/>">보낸메일함</a><a class="collapse-item"href="<c:url value='/email/emailTemporary'/>">임시보관함</a><a class="collapse-item"href="<c:url value='/email/emailBooking'/>">예약메일함</a><a class="collapse-item"href="<c:url value='/email/emailTrashcan'/>">휴지통</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="far fa-edit"></i><span>빠른검색</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="buttons">안읽은메일함</a><a class="collapse-item"href="buttons">중요메일함</a></div></div></li>');
		}else if(${navNo==3}){
			$('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="divscheduleAdd"><button type="button"class="btn btn-light btnSchAdd">일정등록</button></div><!--Nav Item-Pages Collapse Menu--><li class="nav-item"><a class="nav-link"href="#"><input type="checkbox"class="ckSch"checked="checked"><span class="list-span">(기본)일정</span></a></li><!--Nav Item--><li class="nav-item"><a class="nav-link"href="#"><input type="checkbox"class="ckSch"checked="checked"><span class="list-span">내일정</span></a></li><!--Divider--><hr class="sidebar-divider"><li class="nav-item"><a class="nav-link"id="cal-add"href="#"><i class="fas fa-plus"></i><span>일정목록추가</span></a><a class="nav-link"id="cal-edit"href="#"><i class="far fa-edit"></i><span>일정목록수정</span></a><a class="nav-link"id="cal-delete"href="#"><i class="far fa-trash-alt"></i><span>일정목록삭제</span></a></li><!--일정목록추가Modal--><div class="modal modal2"id="myModaladd"data-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록추가</h4><button type="button"class="close"data-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-add-form"><label class="labelTime labelTime2">일정목록명</label><input type="text"id="addTitle"><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnAdd">추가</button><button type="button"class="btn btn-danger"data-dismiss="modal">취소</button></div></div></div></div><!--일정목록수정Modal--><div class="modal modal2"id="myModaledit"data-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록수정</h4><button type="button"class="close"data-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-edit-form"><label class="labelTime labelTime2">일정목록</label><select><option>(기본)내일정</option><option>zzz</option><option>zzz</option></select><br><label class="labelTime labelTime2">일정명</label><input type="text"id="editTitle"><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnEdit">수정</button><button type="button"class="btn btn-danger"data-dismiss="modal">취소</button></div></div></div></div><!--일정목록삭제Modal--><div class="modal modal2"id="myModaldelete"data-backdrop="static"><div class="modal-dialog modal-dialog2 "><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록삭제</h4><button type="button"class="close"data-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-del-form"><label class="labelTime labelTime2">일정목록</label><select><option>(기본)내일정</option><option>zzz</option><option>zzz</option></select><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnDelete">삭제</button><button type="button"class="btn btn-danger"data-dismiss="modal">취소</button></div></div></div></div>');
		}else if(${navNo==4}){
			$('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="divscheduleAdd"><button type="button"class="btn btn-light btnSchAdd">일정등록</button></div><!--Nav Item-Pages Collapse Menu--><li class="nav-item"><a class="nav-link"href="#"><input type="checkbox"class="ckSch"checked="checked"><span class="list-span">(기본)일정</span></a></li><!--Nav Item--><li class="nav-item"><a class="nav-link"href="#"><input type="checkbox"class="ckSch"checked="checked"><span class="list-span">내일정</span></a></li><!--Divider--><hr class="sidebar-divider"><li class="nav-item"><a class="nav-link"id="cal-add"href="#"><i class="fas fa-plus"></i><span>일정목록추가</span></a><a class="nav-link"id="cal-edit"href="#"><i class="far fa-edit"></i><span>일정목록수정</span></a><a class="nav-link"id="cal-delete"href="#"><i class="far fa-trash-alt"></i><span>일정목록삭제</span></a></li><!--일정목록추가Modal--><div class="modal modal2"id="myModaladd"data-bs-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록추가</h4><button type="button"class="close"data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-add-form"><label class="labelTime labelTime2">일정목록명</label><input type="text"id="addTitle"><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnAdd">추가</button><button type="button"class="btn btn-danger"data-bs-dismiss="modal">취소</button></div></div></div></div><!--일정목록수정Modal--><div class="modal modal2"id="myModaledit"data-bs-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록수정</h4><button type="button"class="close"data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-edit-form"><label class="labelTime labelTime2">일정목록</label><select><option>(기본)내일정</option><option>zzz</option><option>zzz</option></select><br><label class="labelTime labelTime2">일정명</label><input type="text"id="editTitle"><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnEdit">수정</button><button type="button"class="btn btn-danger"data-bs-dismiss="modal">취소</button></div></div></div></div><!--일정목록삭제Modal--><div class="modal modal2"id="myModaldelete"data-bs-backdrop="static"><div class="modal-dialog modal-dialog2 "><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록삭제</h4><button type="button"class="close"data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-del-form"><label class="labelTime labelTime2">일정목록</label><select><option>(기본)내일정</option><option>zzz</option><option>zzz</option></select><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnDelete">삭제</button><button type="button"class="btn btn-danger"data-bs-dismiss="modal">취소</button></div></div></div></div><!--Sidebar Toggler(Sidebar)--><div class="text-center d-none d-md-inline"><button class="rounded-circle border-0"id="sidebarToggle"></button></div>');
		}else if(${navNo==5}){
		    $('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><button type="button"class="btn btn-light btnSchAdd"id="newAddressBook">주소록 등록</button><div class="addressBookModal"id="topNavButton"><div class="modal_content"><form name="frmBookWrite"action="#"><div id="bookWriteDiv"><h4>주소록등록</h4><p>설명을어쩌규저쩌구할것임ㅇㅇ</p><div id="userNameInputDiv"class="boxDiv"><label>이름</label><span class="splitSpan">:</span><input type="text"name="addressBook_name"id="addressBook_name"class="inputItems"></div><div id="telInputDiv"class="boxDiv"><label>번호</label><span class="splitSpan">:</span><input type="text"name="addressBook_tel"id="addressBook_tel"class="inputItems"></div><div id="emailInputDiv"class="boxDiv"><label>메일</label><span class="splitSpan">:</span><input type="text"name="addressBook_maile"id="addressBook_maile"class="inputItems"></div><div id="InputDiv"class="boxDiv"><label>부서</label><span class="splitSpan">:</span><select name="boooo"id=""class="selectItem"><option>부서1</option><option>부서2</option></select></div><div id="positionInputDiv"class="boxDiv"><label>직급</label><span class="splitSpan">:</span><select name="boooo"id=""class="selectItem"><option>사원</option><option>팀장</option><option>관리자</option></select></div><div id="btnItems"><input type="submit"id="bookWriteSubmit"value="등록"><button class="bookCancleBtn">취소</button></div></div></form></div></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/addressBook/addressBookMain"/>"><i class="fas fa-fw fa-table"></i><span>전체 목록</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-fw fa-table"></i><span>개발팀</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="#">프론트엔드</a><a class="collapse-item"href="#">백엔드</a><a class="collapse-item"href="#">데이터</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>어디게..?</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="#">영업본부</a></div></div></li>');
		}else if(${navNo==6}){
		    $('#accordionSidebar')
		    .html(
		    		'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><a href="<c:url value="/board/boardWrite"/>"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">글쓰기</button></a></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Tables--><li class="nav-item"><a class="nav-link"href="<c:url value="/board/boardMain"/>"><i class="fas fa-fw fa-table"></i><span>게시판홈</span></a></li><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-fw fa-table"></i><span>전사게시판</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=1"/>">전사공지</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=2"/>">자료실</a><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=3"/>">커뮤니티</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="fas fa-fw fa-cog"></i><span>부서게시판</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value="/board/boardList?boardFolderNo=1"/>">게시판~~</a></div></div></li>');
		}else if(${navNo==7}){
			$('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-icon rotate-n-15"></div><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="divscheduleAdd"><button type="button"class="btn btn-light btnSchAdd btnRentAdmin">예약/대여</button></div><!--Nav Item-Pages Collapse Menu--><li class="nav-item"><a class="nav-link collapsed"href="#"data-bs-toggle="collapse"data-bs-target="#collapse1"aria-expanded="true"aria-controls="collapse1"><i class="far fa-calendar-minus"></i><span>본사1층회의실</span></a><div id="collapse1"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="assetInfo">대회의실</a><a class="collapse-item"href="buttons">소회의실</a></div></div></li><li class="nav-item"><a class="nav-link collapsed"href="#"data-bs-toggle="collapse"data-bs-target="#collapse2"aria-expanded="true"aria-controls="collapse2"><i class="far fa-calendar-minus"></i><span>본사5층회의실</span></a><div id="collapse2"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="buttons">대회의실</a><a class="collapse-item"href="buttons">소회의실</a></div></div></li><li class="nav-item"><a class="nav-link collapsed"href="#"data-bs-toggle="collapse"data-bs-target="#collapse3"aria-expanded="true"aria-controls="collapse3"><i class="far fa-calendar-minus"></i><span>차량</span></a><div id="collapse3"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="buttons">7498아반떼</a><a class="collapse-item"href="buttons">3929아반떼</a></div></div></li><li class="nav-item"><a class="nav-link collapsed"href="#"data-bs-toggle="collapse"data-bs-target="#collapse4"aria-expanded="true"aria-controls="collapse4"><i class="far fa-calendar-minus"></i><span>빔프로젝터</span></a><div id="collapse4"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="buttons">1번빔프로젝터</a><a class="collapse-item"href="buttons">2번빔프로젝터</a></div></div></li><!--Divider--><hr class="sidebar-divider"><li class="nav-item"><a class="nav-link"id="asset-add"href="#"><i class="fas fa-plus"></i><span>자산추가</span></a><a class="nav-link"id="asset-edit"href="#"><i class="far fa-edit"></i><span>자산수정</span></a><a class="nav-link"id="asset-delete"href="#"><i class="far fa-trash-alt"></i><span>자산삭제</span></a></li><!--일정목록추가Modal--><div class="modal modal2"id="myModaladd"data-bs-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">자산추가</h4><button type="button"class="close"data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-add-form"><label class="labelTime labelTime2">자산수정</label><input type="text"id="addTitle"><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnAdd">추가</button><button type="button"class="btn btn-danger"data-bs-dismiss="modal">취소</button></div></div></div></div><!--일정목록수정Modal--><div class="modal modal2"id="myModaledit"data-bs-backdrop="static"><div class="modal-dialog modal-dialog2"><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">자산삭제</h4><button type="button"class="close"data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-edit-form"><label class="labelTime labelTime2">일정목록</label><select><option>(기본)내일정</option><option>zzz</option><option>zzz</option></select><br><label class="labelTime labelTime2">일정명</label><input type="text"id="editTitle"><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnEdit">수정</button><button type="button"class="btn btn-danger"data-bs-dismiss="modal">취소</button></div></div></div></div><!--일정목록삭제Modal--><div class="modal modal2"id="myModaldelete"data-bs-backdrop="static"><div class="modal-dialog modal-dialog2 "><div class="modal-content"><!--Modal Header--><div class="modal-header"><h4 class="modal-title">일정목록삭제</h4><button type="button"class="close"data-bs-dismiss="modal">&times;</button></div><!--Modal body--><div class="modal-body"><form name="list-del-form"><label class="labelTime labelTime2">일정목록</label><select><option>(기본)내일정</option><option>zzz</option><option>zzz</option></select><br></form></div><!--Modal footer--><div class="modal-footer"><button type="button"class="btn btn-info"id="btnDelete">삭제</button><button type="button"class="btn btn-danger"data-bs-dismiss="modal">취소</button></div></div></div></div><!--Sidebar Toggler(Sidebar)--><div class="text-center d-none d-md-inline"><button class="rounded-circle border-0"id="sidebarToggle"></button></div>');
		}else if(${navNo==8}){
			$('#accordionSidebar')
			.html(
					'<!--Sidebar-Brand--><a class="sidebar-brand d-flex align-items-center justify-content-center"href="<c:url value="/index"/>"><div class="sidebar-brand-text mx-3">메인으로이동</div></a><!--Heading--><div class="scheduleAdd"id="topNavButton"><a href="<c:url value="/emp/empWrite"/>"><button type="button"class="btn btn-light btnSchAdd"id="newDocument">사원등록</button></a></div><!--Divider--><hr class="sidebar-divider d-none d-md-block"><!--Nav Item-Pages Collapse Menu--><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseOne"data-bs-toggle="collapse"role="button"aria-expanded="ture"aria-controls="collapseOne"><i class="fas fa-user-circle"></i><span>사원관리</span></a><div id="collapseOne"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="<c:url value='/emp/empList'/>">사원목록</a><a class="collapse-item"href="<c:url value='/email/emailTrashcan'/>">기타하나정도있음</a></div></div></li><li class="nav-item dropdown"><a class="nav-link dropdown-toggle"href="#collapseTwo"data-bs-toggle="collapse"role="button"aria-expanded="true"><i class="far fa-edit"></i><span>뭐넣을지</span></a><div id="collapseTwo"class="collapse"aria-labelledby="headingTwo"data-parent="#accordionSidebar"><div class="bg-white py-2 collapse-inner rounded"><a class="collapse-item"href="buttons">12</a><a class="collapse-item"href="buttons">12</a></div></div></li>');
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
	width: 250px;
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
</style>


<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<c:if test="${empty navNo}">
				<!-- Sidebar - Brand -->
				<a
					class="sidebar-brand d-flex align-items-center justify-content-center"
					href="<c:url value="/index"/>">
					<div class="sidebar-brand-text mx-3">IU</div>
					<div>intranet user interface</div>
				</a>

				<div class="card">
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
				<div class="card">
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

			</c:if>

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
								<a class="dropdown-item" href="<c:url value='/emp/empInfo?empNo=${empNo}'/>"> <i
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