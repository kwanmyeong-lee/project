<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link
	href="<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>"
	rel="stylesheet" type="text/css">
<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/summerNote_css/summernote-lite.css'/>">
<script src="<c:url value='/resources/js/summernote-lite.js'/>"></script>
<script src="<c:url value='/resources/js/lang/summernote-ko-KR.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			placeholder : '반려사유를 입력해 주세요',
			height : 300
		});

		$('#ok').click(function() {
				if($('#summernote').val().length<1){
					alert("내용을 입력하세요");
					event.preventDefault();
					return false;
				}
				
				$('#returnEmail').submit();
				window.opener.back();
			
		});

		$('#cancel').click(function() {
			self.close();
		});
		
		if($('input[name=mailTake]').val().length <1 ){
			self.close();
		}

	});
</script>
<style type="text/css">
.container {
	width: 500px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="col">
			<div class="shadow p-3 mb-5 bg-light rounded ">
				<h3>반려사유</h3>
			</div>
			<div>
				<p>
					<i class="fas fa-check-circle"></i> 반려사유를 정확하게 기입해 주세요
				</p>
				<p>
					<i class="fas fa-check-circle"></i> 반려사유는 기안자에게 메일로 전송됩니다.
				</p>
			</div>
			<form id="returnEmail" name="returnEmail" method="post"
				action="<c:url value = '/electronic/electronicReturnEmail?ElectronicNo=${param.eleNo }'/>">
				<input type="hidden" name="mailTitle" value="${param.mailTitle }에 대한 반려 메일">
				<input type="hidden" name="mailSend" value="${sessionScope.empNo }">
				<input type="hidden" name="mailEmpno" value="${sessionScope.empNo }">
				<input type="hidden" name="mailTake" value="${param.mailTake }">
				<div class="form-group">
					<textarea class="form-control message" id="summernote"
						name="mailContent"></textarea>
				</div>
			</form>
			<div class="text-center my-3">
				<button type="button" id="ok"
					class="btn btn-light btn-outline-secondary">확인</button>
				<button type="button" id="cancel"
					class="btn btn-light btn-outline-secondary">취소</button>
			</div>
		</div>
	</div>
</body>
</html>