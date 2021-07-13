<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/dist/themes/default/style.min.css"/>" />
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/resources/dist/jstree.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			async : true,
			type : "GET",
			url : "<c:url value = "/inc/list/"/>",
			dataType : "json",
			success : function(json) {
				createJSTree(json);
			},

			error : function(xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}
		});
	});

	function createJSTree(jsondata) {
		$('#SimpleJSTree').jstree({
			'core' : {
				'data' : jsondata
			}
		});
	}
</script>
</head>
<body>
<body>
	<div id="SimpleJSTree"></div>
</body>
</body>

</html>