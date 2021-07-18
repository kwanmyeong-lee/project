<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/css/ele_document/ele_doc_main.css"/>"
	rel="stylesheet">

<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript">
	$(function(){
		var styNo = $('#styleNo').val();
		$('#selectAP').click(function(){
			window
			.open(
					'<c:url value = '/electronic/documentSelectApproval?styleNo='/>'+styNo,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
		});
		$('#selectRC').click(function(){
			window
			.open(
					'<c:url value = '/electronic/documentSelectReceive?styleNo='/>'+styNo,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
		});
		
		$('#clear').click(function(){
			$('#Approval').html(' ');
			$('#Receive').html(' ');
		});
		
		$('#cancel').click(function(){
			self.close();
		});
		
		$.ajax({
			url: "<c:url value = 'electronic/documentWrite'/>",
			type : "post",
			data : "json",
			
			
		});
		
	});
	
	
</script>

</head>
<body>
	<form action="/" method="post" enctype="multipart/form-data"
		id="frm-form">
		<input type="hidden" id="styleNo" value="${param.styleNo }"
			name="styleNo">
		<div class="container" style="max-width: 1000px;">
			<div class="shadow-sm p-3 mb-3 bg-light rounded ">
				<h1>기안서</h1>
				<br>
				<div class="mb-5">
					<label for="title" class="form-label col-form-label-lg">제목</label>
					<input type="text" class="form-control" id="title"
						name="electronicTitle" placeholder="제목을 입력해주세요">
				</div>

				<button type="button"
					class="btn btn-light btn-outline-secondary mx-2" id="selectAP">결재자
					선택</button>
				<button type="button"
					class="btn btn-light btn-outline-secondary me-2"
					style="margin-left: 340px;" id="selectRC">수신자 선택</button>
				<button type="button" class="btn btn-light btn-outline-secondary"
					style="margin-left: 250px;" id="clear">초기화</button>
			</div>
			<div
				class="row align-items-start selectLine border border-5 border-secondary">
				결 <br>재 <br>라 <br> 인
				<div class="col selectDiv " id="Approval"></div>

				수 <br>신 <br>라 <br> 인
				<div class="col selectDiv " id="Receive"></div>
			</div>





			<div style="margin-bottom: 100px; text-align: -webkit-center;">

				<!-- 문서 양식 시작 -->
				<input type="hidden" name="electronicContent" value="">

			<%-- 	${svo.styleContent} --%>
				
				<br>
				<h2>휴가신청서</h2>

				<table class="doc-table">
					<tr>
						<td class="doc-td" colspan="3">문서번호</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">작성일자</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">이 름</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">직 책</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">소속</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">부서</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" rowspan="6">신청 내용</td>
						<td class="doc-td" rowspan="4">휴가신청서</td>
						<td class="doc-td">종류</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td">일정</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td">주요행선지</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td">대체근무자</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="2">신청사유<br> (자세히)
						</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="2">긴급연락처</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">참고사항</td>
						<td class="doc-td2" colspan="3"><input type="text" class="doc-input2"></td>
					</tr>

				</table>
				<br>

				<!-- 문서 양식 끝 -->

				<div class="shadow-sm p-3 mb-2 bg-light rounded ">
					<div class="form-group col-6">
						<div class="input-group mb-3 ">
							<input type="file" class="form-control" id="inputGroupFile02">
						</div>
					</div>
					<br>
					<div class="form-row">
						<div class="form-group">
							<input type="submit" name="submit"
								class="btn btn-light btn-outline-secondary">
							<button type="button" class="btn btn-light btn-outline-secondary">임시
								저장</button>
							<button type="button" id="cancel"
								class="btn btn-light btn-outline-secondary">기안서 작성 취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>