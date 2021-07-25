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
<link rel="stylesheet"
	href="<c:url value="/resources/themes/proton/style.min.css"/>" />
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/resources/dist/jstree.min.js'/>"></script>
<style type="text/css">

</style>

<script type="text/javascript">
	$(function() {
		$.ajax({
			async : true,
			type : "get",
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
		$('input[name=oriName]').keyup(function() {
			var node = $('#oriName').val();
			$('#SimpleJSTree').jstree(true).search(node);
		});
	});
	function createJSTree(jsondata) {
		$('#SimpleJSTree').jstree(
				{
					'core' : {
						'data' : jsondata,
						'themes' : {
							'name' : 'proton',
							'responsive' : true
						}
					},
					"plugins" : [ "themes", "json_data", "ui", "types", "crrm",
							"cookies", "contextmenu", "search", "wholerow" ]
				}).bind("select_node.jstree", function(event, data) {
			if (data.instance.get_node(data.selected).id >= 100) {
				console.log("select_node.jstree");
				selectEvetn(event);
			}
		});
	}
	function selectEvetn(target) {
		window
				.open(
						'popup.html',
						'_blank',
						'top=40, left=40, width=300, height=300, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no');
	}
</script>
</head>
<body>
	<div id="SimpleJSTree"></div>

	
</body>
</html>