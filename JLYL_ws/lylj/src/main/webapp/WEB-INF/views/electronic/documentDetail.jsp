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
	$(function() {
		window.onload = function() {
		$('table input[type=text]').prop('disabled', 'disabled');
		$('table input[type=text]').prop('style',
				' border : 0; background : white');
		}
		var styNo = $('#styleNo').val();
		$('#ok')
				.click(
						function() {
							window
									.open(
											'<c:url value = '/electronic/documentWrite?styleNo='/>'+styNo,
											'_blank   ',
											'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no');
											window.open('','_self').close();
						});
		
		$('#no').click(function(){
				window.open('<c:url value="/electronic/documentSelect"/>', '_parent ', 'width=800,height=500');
				window.open('','_self').close();
		})
	});
</script>

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
				<button type="button" class="btn btn-light  btn-outline-secondary"
					id="ok">선택</button>
				<button type="button" class="btn btn-light btn-outline-secondary"
					id="no">뒤로가기</button>
			</div>
		</div>
	</div>
</body>
</html>











