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
</style>

</head>
<body>
	<div class="container">
		<h1>기안서</h1>
		<button type="button" class="btn btn-primary">결재자 선택</button>
		<table class="table table-bordered border-primary">
			<tbody>
				<tr>
					<td id="select-td"><span id="select-line"> <span
							id="select-position"> 대표이사 </span> <span id="select-name">
								이관명 </span>
					</span> <span id="select-line"> <span id="select-position">
								대표이사 </span> <span id="select-name"> 이관명 </span>
					</span> <span id="select-line"> <span id="select-position">
								대표이사 </span> <span id="select-name"> 이관명 </span>
					</span> <span id="select-line"> <span id="select-position">
								대표이사 </span> <span id="select-name"> 이관명 </span>
					</span></td>
				</tr>
			</tbody>
		</table>

		<form action="/" method="post" enctype="multipart/form-data"
			id="frm-form">

			<div class="form-group">
				<label for="frm-form-textare">여기에 양식을뿌려주면 되는데</label>

				<textarea name="textare" id="frm-form-textare" class="form-control"
					autocomplete="off"></textarea>

			</div>
			<div class="form-group">
				<div>
					<label class="custom-file"><input type="file" name="upload"
						id="upload" class="custom-file-input"><span
						class="custom-file-control"></span></label>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group">
					<input type="submit" name="submit" class="btn btn-primary">
					<button type="button" class="btn btn-primary">임시 저장</button>
					<button type="button" class="btn btn-primary">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>