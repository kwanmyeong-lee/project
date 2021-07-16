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

		$('#reset').click(function() {
			$('#stamp').html('');
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

	var no = [];
	
	function selectEvetn(userNo) {
		//선택 event
		//보내줘야 할것이 이름, 사진
		$
				.ajax({
					url : "<c:url value='/electronic/selectstamp'/>",
					type : "get",
					data : "userNo=" + userNo,
					dataType : "json",
					success : function(res) {
						//{"EMP_NAME":"관명","STAMP_NAME":"아이유1.jpg","POSITION_NO":2,"STAMP_NO":1,"EMP_NO":101,"POSITION_NAME":"부장"}
						var stampInfo = "<span id='select-line'><span id='select-position'>"
								+ res.POSITION_NAME
								+ "</span><span id='select-name'>"
								+ res.EMP_NAME
								+ "<br>"
								+ "<img style='width: 40px; display: none;' alt='아이유' src='<c:url value='/resources/img/"+res.STAMP_NAME+"'/>'></span>";
						$('#stamp').append(stampInfo);
						no.push(res.EMP_NO);
						alert(no);

					},
					error : function(xhr, status, error) {
						alert("error!" + error);
						alert(xhr.status);
						alert(thrownError);
					}

				});

	}
	$(function() {
		$('#ok').click(function() {
			$.ajax({
				url : "<c:url value ='/electronic/selectstampList'/>",
				data : {
					empNo : no
				},
				type : "post",
				success : function(data) {
					var styNo = $('#styno').val();
					$.each(data, function(idx, val) {
						var stampInfo = "<span id='select-line'><span id='select-position'>"
							+ val.POSITION_NAME
							+ "</span><span id='select-name'>"
							+ val.EMP_NAME
							+ "<br>"
							+ "<img style='width: 40px; display: none;' alt='아이유' src='<c:url value='/resources/img/"+val.STAMP_NAME+"'/>'></span>";
						$(opener.document).find("#Receive").append(stampInfo);
					});
					self.close();
					
				},
				error : function(data) {
					alert("에러" + data)
				}
			});

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
<body>
<input type="text" value="${param.styleNo }" id="styno">
	<div class="container">
		<div class="row">
			<hr>
			<h2>수신 라인을 선택해주세요</h2>
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
			<h2>미리 보기</h2>
			<div
				class="row align-items-start selectLine border border-5 border-secondary">
				수 <br>신 <br>라 <br> 인

				<div class="col selectDiv" id="stamp"></div>
			</div>
		</div>
		<button id="ok">확인</button>
		<button id="reset">초기화</button>
	</div>
	<div id="test"></div>
</body>
</body>
</html>




