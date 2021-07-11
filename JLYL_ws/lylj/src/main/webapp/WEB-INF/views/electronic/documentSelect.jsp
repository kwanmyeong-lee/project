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
<link href="<c:url value="/resources/css/ele_document/ele_document.css"/>"
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
				tags : [ '0' ]
			} ]
		}, {
			text : 'Parent 2',
			href : '#parent2',
			tags : [ '0' ]
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

		var alternateData = [ {
			text : 'Parent 1',
			tags : [ '2' ],
			nodes : [ {
				text : 'Child 1',
				tags : [ '3' ],
				nodes : [ {
					text : 'Grandchild 1',
					tags : [ '6' ]
				}, {
					text : 'Grandchild 2',
					tags : [ '3' ]
				} ]
			}, {
				text : 'Child 2',
				tags : [ '3' ]
			} ]
		}, {
			text : 'Parent 2',
			tags : [ '7' ]
		}, {
			text : 'Parent 3',
			icon : 'glyphicon glyphicon-earphone',
			href : '#demo',
			tags : [ '11' ]
		}, {
			text : 'Parent 4',
			icon : 'glyphicon glyphicon-cloud-download',
			href : '/demo.html',
			tags : [ '19' ],
			selected : true
		}, {
			text : 'Parent 5',
			icon : 'glyphicon glyphicon-certificate',
			color : 'pink',
			backColor : 'red',
			href : 'http://www.tesco.com',
			tags : [ 'available', '0' ]
		} ];

		var json = '[' + '{' + '"text": "Parent 1",' + '"nodes": [' + '{'
				+ '"text": "Child 1",' + '"nodes": [' + '{'
				+ '"text": "Grandchild 1"' + '},' + '{'
				+ '"text": "Grandchild 2"' + '}' + ']' + '},' + '{'
				+ '"text": "Child 2"' + '}' + ']' + '},' + '{'
				+ '"text": "Parent 2"' + '},' + '{' + '"text": "Parent 3"'
				+ '},' + '{' + '"text": "Parent 4"' + '},' + '{'
				+ '"text": "Parent 5"' + '}' + ']';


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

		// Select/unselect/toggle nodes
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

		$('#btn-toggle-selected.select-node').on('click', function(e) {
			$selectableTree.treeview('toggleNodeSelected', [ selectableNodes, {
				silent : $('#chk-select-silent').is(':checked')
			} ]);
		});


	
	});
</script>
<body>
	<div class="container">
		<div class="row">
			<hr>
			<h2>Selectable Tree</h2>
			<div class="col-sm-4">
				<h2>Input</h2>
				<div class="form-group">
					<label for="input-select-node" class="sr-only">Search Tree:</label>
					<input type="input" class="form-control" id="input-select-node"
						placeholder="Identify node..." value="Parent 1">
				</div>
				<div class="checkbox">
					<label> <input type="checkbox" class="checkbox"
						id="chk-select-multi" value="false"> Multi Select
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox" class="checkbox"
						id="chk-select-silent" value="false"> Silent (No events)
					</label>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-success select-node"
						id="btn-select-node">Select Node</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-danger select-node"
						id="btn-unselect-node">Unselect Node</button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary select-node"
						id="btn-toggle-selected">Toggle Node</button>
				</div>
			</div>
			<div class="col-sm-4">
				<h2>Tree</h2>
				<div id="treeview-selectable" class=""></div>
			</div>
			<div class="col-sm-4">
				<h2>Events</h2>
				<div id="selectable-output"></div>
			</div>
		</div>
	</div>
</body>
</html>