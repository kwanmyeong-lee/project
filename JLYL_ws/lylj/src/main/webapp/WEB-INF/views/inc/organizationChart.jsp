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
	var empNo = "";
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

		$('#close').click(function() {
			$('#modalForm').modal('hide');
		})

		$('#userEmail')
				.click(
						function() {
							location.href = "<c:url value = '/email/emailWrite?empNo='/>"
									+ empNo
							colsole.log(empNo);
						})
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
				}).bind(
				"select_node.jstree",
				function(event, data) {
					if (data.instance.get_node(data.selected).id >= 100) {
						var userId = data.instance.get_node(data.selected).id;
						getInfomation(userId);
						selectEvetn(data);
						$('#userName').html(
								data.instance.get_node(data.selected).text);
					}
				});
	}

	function selectEvetn(data) {
		$('#modalForm').modal('show');
	}

	function getInfomation(data) {
		$
				.ajax({
					url : "<c:url value = '/inc/getInfomation'/>",
					type : "get",
					data : {
						EmpNo : data
					},
					dataType : "json",
					success : function(json) {
						$('#userimgDiv')
								.html(
										"<img src='<c:url value = '/resources/emp_images/"+json.empPhoto+"/'/>'>");
						$('#userEmail').html(json.empNo + "@lylj.net");
						$('#userTel').html(json.empTel);

						empNo = json.empNo;
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert(xhr.status);
						alert(thrownError);
					}

				});

	}
</script>
<style type="text/css">
/* modal */
aside .modal {
	display: block; /* position: relative; */
	pointer-events: none; /* background clickable */
}

.modal-backdrop { /* display: block; 검은색레이어*/
	display: none; /* background clickable */
}

aside .modal-dialog {
	padding: 0px; /* 팝업창 넓이: 특정 DIV에 맞출 것 */ /* 팝업창 높이: 특정 DIV에 맞출 것 */
	margin: 0px;
	position: fixed; /* 팝업창 초기 위치 */ /* 팝업 닫기 전 위치도 저장해둘 것*/
	top: auto;
	bottom: 0;
	margin-left: 222px;
}

aside .modal-content {
	padding: 0px;
}

#modalForm img {
	width: 100px;
	height: 100px;
	border: 3px solid gold;
	border-radius: 70px;
	-moz-border-radius: 70px;
	-khtml-border-radius: 70px;
	-webkit-border-radius: 70px;
	object-fit: cover;
	object-position: 100% 0;
}

#userimgDiv {
	text-align: center;
}

#userName {
	text-align: center;
}
</style>
</head>
<body>
	<div id="SimpleJSTree"></div>


	<!-- Modal -->
	<div class="modal fade " id="modalForm" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content ">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-2" id="userimgDiv"></div>
					<div class="fs-3" id="userName"></div>
					<div class="mb-2">
						<label class="form-label">이메일</label> <br> <a class="fs-3"
							id="userEmail"> </a>

					</div>
					<div class="mb-3">
						<label class="form-label">전화번호</label>
						<p class="fs-3" id="userTel"></p>
					</div>
					<!-- 			<div class="modal-footer d-block">
						<button type="button" id="close" class="btn btn-warning float-end">닫기</button>
					</div> -->
				</div>
			</div>
		</div>
	</div>



</body>
</html>