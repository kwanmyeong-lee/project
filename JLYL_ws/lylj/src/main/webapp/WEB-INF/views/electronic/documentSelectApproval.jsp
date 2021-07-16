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
		$('#input-select-node').keyup(function() {
			var node = $('#input-select-node').val();
			$('#SimpleJSTree').jstree(true).search(node);
		});
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
				console.log("select_node.jstree");
				var userNo = data.instance.get_node(data.selected).id;
				selectEvetn(userNo);
			}
		});
	}
	function selectEvetn(userNo) {
		//선택 event
		//보내줘야 할것이 이름, 사진
			$.ajax({
			url : "<c:url value='/electronic/selectstamp'/>",
			type : "get",
			data : "userNo="+userNo,
			dataType : "json",
			success : function(res){
				//{"EMP_NAME":"관명","STAMP_NAME":"아이유1.jpg","POSITION_NO":2,"STAMP_NO":1,"EMP_NO":101,"POSITION_NAME":"부장"}
				var stampInfo ="<span id='select-line'><span id='select-position'>"+res.POSITION_NAME+"</span><span id='select-name'>"+res.EMP_NAME+"<img style='width: 40px;' alt='아이유' src='<c:url value='/resources/img/"+res.STAMP_NAME+"'/>'></span>";
				$('#stamp').html(stampInfo);
			},
			error : function(xhr, status, error){
				alert("error!" + error);
				alert(xhr.status);
				alert(thrownError);
			}
			
		});
	
	}
</script>
</head>
<body>
<body>
	<div class="container">
		<div class="row">
			<hr>
			<h2>결재 라인을 선택해주세요</h2>
			<div class="col-sm-4">
				<h2>검색</h2>
				<div class="form-group">
					<label for="input-select-node" class="sr-only"></label><input
						type="text" class="form-control" id="input-select-node"
						placeholder="검색어를 입력해주세요" value="">
				</div>
			</div>
			<div class="col-sm-5">
				<h2>목록</h2>
				<div id="SimpleJSTree" class=""></div>
			</div>

			<div id="stamp"></div>
		</div>
	</div>
</body>
</body>

</html>