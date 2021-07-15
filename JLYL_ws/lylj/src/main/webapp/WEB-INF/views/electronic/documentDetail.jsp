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
	$(function() {
		var styNo = $('#styleNo').val();
		$('#ok')
				.click(
						function() {
							window
									.open(
											'<c:url value = '/electronic/documentWrite?styleNo='/>'+styNo,
											'_blank ',
											'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no');
						});
		
		$('#no').click(function(){
				window.open('<c:url value="/electronic/documentSelect"/>', '_parent ', 'width=800,height=500');
				window.open('','_self').close();
		})
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="styleNo" value="${vo.styleNo }">
	<div class="container"
		style="max-width: 1000px; text-align: -webkit-center;">${vo.styleContent}
		<br>
		<div class="form-row">
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="ok">선택</button>
				<button type="button" class="btn btn-primary" id="no">취소</button>
			</div>
		</div>
	</div>
</body>
</html>











