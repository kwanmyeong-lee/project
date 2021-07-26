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

<script>
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<hr>
			<div class="shadow p-3 mb-5 bg-light rounded ">
				<h2>결재시 입력될 도장을 선택해주세요</h2>
			</div>
			<div class="form-group col-6">
				<div class="input-group mb-3 ">
					<input multiple="multiple" type="file" class="form-control"
						onchange="setThumbnail(event);" name="upfile"
						id="inputGroupFile02" aria-label="Upload">
				</div>
				<span style="margin-left: 5px; font-size: 14px;">※&nbsp; 파일크기
					제한 : 50MB</span>
				<hr>
				<h3>사용될 도장 미리보기입니다</h3>

			</div>
			<div id="image_container"
				style="border: 1px solid black; min-height: 180px; min-width: 180px;"></div>
		</div>
	</div>
</body>
</html>