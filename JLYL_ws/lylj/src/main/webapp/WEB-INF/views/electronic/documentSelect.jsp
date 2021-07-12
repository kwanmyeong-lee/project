<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/css/ele_document/ele_document.css"/>"
	rel="stylesheet">
<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/vendor/bootstrap/js/bootstrap-treeview.js'/>"></script>
</head>


<script type="text/javascript">
	$(function() {

		var defaultData = [ {
			text : 'Parent 1',
			href : '#parent1',
			tags : [ '4' ],
			nodes : [ {
				text : 'Child 1',
				href : '#child1',
				tags : [ '2' ],
				nodes : [ {
					text : 'Grandchild 1',
					href : '#grandchild1',
					tags : [ '0' ]
				}, {
					text : 'Grandchild 2',
					href : '#grandchild2',
					tags : [ '0' ]
				} ]
			}, {
				text : 'Child 2',
				href : '#child2',
				tags : [ '0' ],
				nodes : [ {
					text : 'Grandchild 1',
					href : '#grandchild1',
					tags : [ '0' ]
				} ]
			} ]
		}, {
			text : 'Parent 2',
			href : '#parent2',
			tags : [ '0' ],
			nodes : [ {
				text : 'Child 1',
				href : '#child1',
				tags : [ '2' ],
				nodes : [ {
					text : 'Grandchild 1',
					href : '#grandchild1',
					tags : [ '0' ]
				}, {
					text : 'Grandchild 2',
					href : '#grandchild2',
					tags : [ '0' ]
				} ]
			}, {
				text : 'Child 2',
				href : '#child2',
				tags : [ '0' ],
				nodes : [ {
					text : 'Grandchild 1',
					href : '#grandchild1',
					tags : [ '0' ]
				} ]
			} ]
		}, {
			text : 'Parent 3',
			href : '#parent3',
			tags : [ '0' ]
		}, {
			text : 'Parent 4',
			href : '#parent4',
			tags : [ '0' ]
		}, {
			text : 'Parent 5',
			href : '#parent5',
			tags : [ '0' ]
		} ];

		var initSelectableTree = function() {
			return $('#treeview-selectable').treeview(
					{
						data : defaultData,
						multiSelect : $('#chk-select-multi').is(':checked'),
						onNodeSelected : function(event, node) {
							$('#selectable-output').prepend(
									'<p>' + node.text + ' was selected</p>');
						},
						onNodeUnselected : function(event, node) {
							$('#selectable-output').prepend(
									'<p>' + node.text + ' was unselected</p>');
						}
					});
		};
		var $selectableTree = initSelectableTree();

		var findSelectableNodes = function() {
			return $selectableTree.treeview('search', [
					$('#input-select-node').val(), {
						ignoreCase : false,
						exactMatch : false
					} ]);
		};
		var selectableNodes = findSelectableNodes();

		$('#chk-select-multi:checkbox').on('change', function() {
			console.log('multi-select change');
			$selectableTree = initSelectableTree();
			selectableNodes = findSelectableNodes();
		});

		// Select/unselect/ nodes
		$('#input-select-node').on('keyup', function(e) {
			selectableNodes = findSelectableNodes();
			$('.select-node').prop('disabled', !(selectableNodes.length >= 1));
		});

		$('#btn-select-node.select-node').on('click', function(e) {
			$selectableTree.treeview('selectNode', [ selectableNodes, {
				silent : $('#chk-select-silent').is(':checked')
			} ]);
		});

		$('#btn-unselect-node.select-node').on('click', function(e) {
			$selectableTree.treeview('unselectNode', [ selectableNodes, {
				silent : $('#chk-select-silent').is(':checked')
			} ]);
		});

	});
</script>
<body>
	<div class="container">
		<div class="row">
			<hr>
			<h2>문서양식 선택해주세요</h2>
			<div class="col-sm-4">
				<h2>검색</h2>
				<div class="form-group">
					<label for="input-select-node" class="sr-only"></label><input
						type="input" class="form-control" id="input-select-node"
						placeholder="검색어를 입력해주세요" value="">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-success select-node my-2" 
						id="btn-select-node">찾기</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-danger select-node my-2"
						id="btn-unselect-node">선택 취소</button>
				</div>
				<div class="form-group">
					<a href="<c:url value = "/electronic/documentWrite"/>">
						<button type="button" class="btn btn-info select-node my-2"
							id="btn-unselect-node">너로 정했다!</button>
					</a>
				</div>
			</div>
			<div class="col-sm-5">
				<h2>목록</h2>
				<div id="treeview-selectable" class=""></div>
			</div>
			<div class="col-sm-4">
				<h2>결과창</h2>
				<div id="selectable-output"></div>
			</div>
		</div>
	</div>
</body>
</html>