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
<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/vendor/bootstrap/js/bootstrap-treeview.js'/>"></script>
<script type="text/javascript">
    $(function() {
      //icon options
      var collapseIcon = "fa fa-angle-down",
        expandIcon = "fa fa-angle-right",
        nodeIcon = "fa fa-folder",
        checkedIcon = "fa fa-check-square-o",
        uncheckedIcon = "fa fa-square-o",
        partiallyCheckedIcon = "fa fa-check-square",
        loadingIcon = "glyphicon glyphicon-hourglass";

      var defaultData = [
        {
          text: 'Parent 1',
          href: '#parent1',
          tags: ['4'],
          nodes: [
            {
              text: 'Child 1',
              href: '#child1',
              tags: ['2'],
              nodes: [
                {
                  text: 'Grandchild 1',
                  href: '#grandchild1',
                  icon: 'fa fa-file-o',
                  tags: ['0']
                },
                {
                  text: 'Grandchild 2',
                  href: '#grandchild2',
                  icon: 'fa fa-file-o',
                  tags: ['0']
                }
              ]
            },
            {
              text: 'Child 2',
              href: '#child2',
              icon: 'fa fa-file-o',
              tags: ['0']
            }
          ]
        },
        {
          text: 'Parent 2',
          href: '#parent2',
          tags: ['0']
        },
        {
          text: 'Parent 3',
          href: '#parent3',
           tags: ['0']
        },
        {
          text: 'Parent 4',
          href: '#parent4',
          tags: ['0']
        },
        {
          text: 'Parent 5',
          href: '#parent5'  ,
          tags: ['0']
        }
      ];

      //Default
      $('#treeview1').treeview({
        collapseIcon: collapseIcon,
        data: defaultData,
        expandIcon: expandIcon,
        nodeIcon: nodeIcon,
        showBorder: false
      });
	</script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<h2>Default</h2>
				<div id="treeview1"></div>
			</div>
		</div>
	</div>
</body>
</html>
