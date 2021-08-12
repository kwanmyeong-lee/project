<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<link href="<c:url value="/resources/css/ajax/loading.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/addressBook/addressBookExcel.css"/>" rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/addressBook/addressBookExcel.js"/>'></script>

<div id="bookMainDiv">
	<h3>주소록 등록(엑셀)</h3>
	<input type="hidden" id="empNoHidden" value="${empNo}">
	<input type="hidden" id="fileChangHidden" value="0">
	<br>
	<div id="serviceDiv">
		<form class="excel-form" id="excelFrm" name="emailDataFrm" enctype="multipart/form-data" >
			<div class="filebox"> 
				<input class="upload-name" value="파일선택" disabled="disabled"> 
				<label for="ex_filename">업로드</label> 
				<input type="file" id="ex_filename" name="excelFile" class="upload-hidden" accept=".xls, .xlsx"> 
				<button type="button" class="excel-btn btn btn-outline-secondary" id="excelDown">양식받기</button>
				<button type="button" class="excel-btn btn btn-outline-secondary" id="excelView">보기</button>
				<button type="button" class="excel-btn btn btn-outline-secondary" id="excelInsert">등록</button>
				<span id="rowCnt"></span>
			</div>
		</form>
		
	</div>
	<!-- 페이징 처리를 위한 form -->
	<form action="<c:url value='/addressBook/list?addressFolderNo=${param.addressFolderNo}'/>" 
	   name="frmPage" method="post" id="frmPage" hidden="hidden">
	   <input type="hidden" name="addressFolderNo" value="${param.addressFolderNo }"><br>
	   <input type="hidden" name="currentPage" value=${pagingInfo.currentPage }><br>
    </form>
    <div class="loading"></div>
	<table>
	    <colgroup>
	       <col style="width:12.5%;" />
	       <col style="width:15%;" />
	       <col style="width:20%;" />
	       <col style="width:10%;" />
	       <col style="width:12.5%;" />
	       <col style="width:15%;" />      
	       <col style="width:18%;" />      
	    </colgroup>
       <thead>
	    <tr id="thStyle">
            <th><span style="padding-left: 15px;">이름</span></th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>직위</th>
            <th>회사</th>
            <th>회사번호</th>
            <th>카테고리</th>
	    </tr>
       </thead>
       <tbody id="excelBody">
        
       </tbody>
	</table>
	
	<!-- 페이징 -->
	<div class="col-md-16 row justify-content-center py-4 page_wrap">
        <div
            class="col-sm-2 mr-0 page_nation" style="text-decoration: none;">
        </div>
    </div>
</div>
<%@ include file="../inc/bottom.jsp"%>