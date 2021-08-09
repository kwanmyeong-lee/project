<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
	<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");

	String ctxPath = request.getContextPath();
	url = ctxPath + url;
	%>
	
	<script type="text/javascript">
	$(function(){
		$('.swal2-confirm').click(function(){
			location.href="<%=url%>";
		});
	});
	
	if("<%=msg%>"=="로그인되었습니다"){
		Swal.fire("<%=msg%>")
	}	
	else if(('<%=msg%>').indexOf('실패')>0){
	Swal.fire({
		  icon: 'error',
		  text: "<%=msg%>",
		})
	}else{
		Swal.fire("<%=msg%>")
	}
	
	</script>
	
	

</body>
</html>



