<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<script type="text/javascript">
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	$(function() {
		$('#ok').click(function() {
					
			   if (confirm("등록후에는 변경이 불가능합니다.") == true) {
					$('form[name=imgfrm]').submit();
		        } else {
		            alert("등록을 쉬소합니다");
		        	self.close();
		        }
		});
		
		if($('#returnCnt').val() == 1){
			self.close();
		}
		
	});
	
</script>
<style type="text/css">
#image_container img {
	width: 100px;
	align-items: center;
	margin-top: 58px;
}
</style>
</head>
<body>
	<input id="returnCnt" type="hidden" value="${param.cnt}">
	<div class="container">
		<div class="row">
			<div class="shadow p-3 mb-5 bg-light rounded ">
				<h2>결재시 입력될 도장을 선택해주세요</h2>
			</div>

			<h3>사용될 도장 미리보기입니다</h3>
			<div class="col" id="image_container"
				style="border: 1px solid black; min-height: 180px; width: 300px; text-align: center;"></div>

			<div class="col-6 justify-content-center">
				<form name="imgfrm" id="frm" method="post"
					action="<c:url value = '/electronic/insertStamp'/>"
					enctype="multipart/form-data">
					<div class="form-group col ">
						<div class="input-group mb-3 ">
							<input type="file" class="form-control"
								onchange="setThumbnail(event);" name="upfile"
								id="inputGroupFile02" aria-label="Upload">
						</div>
						<span style="margin-left: 5px; font-size: 14px;">※&nbsp;
							파일크기 제한 : 50MB</span>
						<hr>
						<div class="col text-center">
							<button type="button" id="ok" class="btn btn-success">등록</button>
						</div>
					</div>
				</form>
			</div>
			<hr>

		</div>
	</div>
</body>
</html>