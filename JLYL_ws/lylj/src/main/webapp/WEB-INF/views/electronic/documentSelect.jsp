<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value="/resources/dist/themes/default/style.min.css"/>" />
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/resources/dist/jstree.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			async : true,
			type : "get",
			url : "<c:url value = "/electronic/list/"/>",
			dataType : "json",
			success : function(json) {
				createJSTree(json);
			},
			error : function(xhr, ajaxOptions, thrownError) {
				console.log("문서선택에서 오류");
				
			}
		});
		$('#input-select-node').keyup(function() {
			var node = $('#input-select-node').val();
			$('#SimpleJSTree').jstree(true).search(node);
		});
		
	  	window.onload = function(){
			if($('#check').val()>1){
				self.close();
			}
		}
		
	});
	function createJSTree(jsondata) {
		$('#SimpleJSTree').jstree(
				{
					'core' : {
						'data' : jsondata
					},
					"plugins" : [ "themes", "json_data", "ui", "types", "crrm",
							"cookies", "contextmenu", "search" ]
				}).bind("select_node.jstree", function(event, data) {
			if (data.instance.get_node(data.selected).id >= 100) {
				console.log("select_node.jstree", event);
				var val = data.instance.get_node(data.selected).id;
				selectEvetn(val);
			}
		});
	}
	function selectEvetn(data) {
		window
				.open(
						'<c:url value='/electronic/documentDetail?styleNo='/>'+data,
						'_blank ',
						'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no');
		window.open('','_self').close();
	}
</script>
</head>
<body>
<input type="hidden" value="${param.no }" id="check">
	<div class="container">
		<div class="row">
			<hr>
			<div class="shadow p-3 mb-5 bg-light rounded ">
				<h2>문서양식 선택해주세요</h2>
			</div>

			<div class="col-sm-5">
				<div class="shadow-sm p-3 mb-5 bg-body rounded">
					<h2>검색</h2>
					<div class="form-group">
						<label for="input-select-node" class="sr-only"></label><input
							type="text" class="form-control" id="input-select-node"
							placeholder="검색어를 입력해주세요" value="">
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="shadow-sm p-3 mb-5 bg-body rounded">
					<h2>목록</h2>
					<div id="SimpleJSTree" class=""></div>
				</div>

			</div>
		</div>
	</div>
</body>

</html>