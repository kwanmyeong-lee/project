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
<link
	href="<c:url value="/resources/css/ele_document/ele_doc_main.css"/>"
	rel="stylesheet">
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
						for(var i = 0;i<no.length;i++){
							var noVal = no[i];
							if(noVal == res.EMP_NO){
								alert("중복선택은 불가능합니다.");
								event.preventDefaule();
							}
						}	
						$('#stamp').append(stampInfo);
						no.push(res.EMP_NO);

					},
					error : function(xhr, status, error) {
						alert("error!" + error);
						alert(xhr.status);
						alert(thrownError);
					}

				});

	}
	$(function() {
		$('#ok')
				.click(
						function() {
							$
									.ajax({
										url : "<c:url value ='/electronic/selectstampList'/>",
										data : {
											empNo : no
										},
										type : "post",
										success : function(data) {
											var styNo = $('#styno').val();
											$
													.each(
															data,
															function(idx, val) {
																var stampInfo = "<span id='select-line'><span id='select-position'>"
																		+ val.POSITION_NAME
																		+ "</span><span id='select-name'>"
																		+ val.EMP_NAME
																		+ "<br>"
																		+ "<img style='width: 40px; display: none;' alt='아이유' src='<c:url value='/resources/img/"+val.STAMP_NAME+"'/>'></span><input type='hidden' value="+val.EMP_NO+" id='styno' name = 'reEmpNo'>";
																$(
																		opener.document)
																		.find(
																				"#Receive")
																		.append(
																				stampInfo);
															});
											self.close();

										},
										error : function(data) {
											alert("에러" + data)
										}
									});

						});
		$('#reset').click(function() {
			$('#stamp').html('');
			no = [];
		});
		$('#no').click(function() {
			no = [];
			self.close();
		});

	});
</script>

</head>
<body>
	<input type="hidden" value="${param.styleNo }" id="styno">
	<div class="container">
		<div class="row">
			<hr>
			<div class="shadow-sm p-3 mb-5 bg-light rounded ">
				<h2>수신 라인을 선택해주세요</h2>
			</div>
			<div class="col-sm-4">
				<div class="shadow-sm p-3 mb-2 bg-body rounded">
					<h2>검색</h2>
					<div class="form-group">
						<label for="input-select-node" class="sr-only"></label><input
							type="text" class="form-control" id="input-select-node"
							placeholder="검색어를 입력해주세요" value="">
					</div>
				</div>
			</div>
			<div class="col-sm-5">
				<div class="shadow-sm p-3 mb-2 bg-body rounded">
					<h2>목록</h2>
					<div id="SimpleJSTree" class=""></div>
				</div>
			</div>
			<div class="shadow-sm p-3 mb-2 bg-body rounded">
				<h2>미리 보기</h2>
			</div>
			<div
				class="row align-items-start selectLine border border-5 border-secondary">
				수 <br>신 <br>라 <br> 인

				<div class="col selectDiv" id="stamp"></div>
			</div>
		</div>
		<div class="text-center mt-4">
			<button id="ok" class="btn btn-light btn-outline-secondary mx-1 ">확인</button>
			<button id="reset" class="btn btn-light btn-outline-secondary mx1">초기화</button>
			<button id="no" class="btn btn-light btn-outline-secondary mx1">취소</button>
		</div>
	</div>
	<div id="test"></div>
</body>
</html>




