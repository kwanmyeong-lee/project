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
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no');
		});
		$('#selectRC').click(function(){
			window
			.open(
					'<c:url value = '/electronic/documentSelectReceive?styleNo='/>'+styNo,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no');
		});
	});
	
	
	
</script>

<style type="text/css">
#select-td {
	padding-left: 100px;
	padding-bottom: 15px;
	padding-top: 15px;
}

#select-line {
	width: 79px;
	vertical-align: top;
	display: table;
	table-layout: fixed;
	float: left;
	margin-right: 4px;
}

#select-position {
	display: table-cell;
	text-align: center;
	width: 79px;
	float: left;
	border: 1px solid black;
}

#select-name {
	display: table-cell;
	text-align: center;
	width: 79px;
	float: left;
	height: 100px;
	border: 1px solid black;
}

.selectLine {
	padding: 10px;
	margin: 3px;
	height: 180px;
}

.selectDiv {
	padding: 10px;
	margin: 0 10px 0 10px;
}

.doc-table {
	border-collapse: collapse;
	border: 1px solid black;
	width: 644px;
	text-align: center;
}

.doc-td {
	background: #D9E2F3;
	padding: 10px;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}

.doc-td2 {
	border-right: 1px solid black;
	border-bottom: 1px solid black;
	padding-left: 10px;
}
</style>



</head>
<body>
<input type="hidden" id="styleNo" value="${param.styleNo }">
	<div class="container" style="max-width: 1000px;">
		<h1>기안서</h1>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary text-end" id="selectAP">결재자
				선택</button>
			<button type="button" class="btn btn-primary text-end" id="selectRC">수신자
				선택</button>
		</div>
		<div
			class="row align-items-start selectLine border border-5 border-secondary">
			결 <br>재 <br>라 <br> 인
			<div class="col selectDiv " id="Approval">

			
			</div>

			수 <br>신 <br>라 <br> 인
			<div class="col selectDiv " id="Receive">
			
			
			</div>
		</div>


		<!-- 문서 양식 -->
		<form action="/" method="post" enctype="multipart/form-data"
			id="frm-form"
			style="margin-bottom: 100px; text-align: -webkit-center;">

			${svo.styleContent}

			<!-- 문서 양식끝 -->

			<div class="form-group">
				<div>
					<label class="custom-file"><input type="file" name="upload"
						id="upload" class="custom-file-input"><span
						class="custom-file-control"></span></label>
				</div>
			</div>
			<br>
			<div class="form-row">
				<div class="form-group">
					<input type="submit" name="submit" class="btn btn-primary">
					<button type="button" class="btn btn-primary">임시 저장</button>
					<button type="button" class="btn btn-primary">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>