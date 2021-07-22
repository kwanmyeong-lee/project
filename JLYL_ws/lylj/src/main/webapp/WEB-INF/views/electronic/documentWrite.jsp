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
	href="<c:url value="/resources/css/ele_document/ele_doc_main.css"/>"
	rel="stylesheet">

<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript">
	$(function(){
		var styNo = $('#styleNo').val();
		$('#selectAP').click(function(){
			window
			.open(
					'<c:url value = '/electronic/documentSelectApproval?styleNo='/>'+styNo,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
		});
		$('#selectRC').click(function(){
			window
			.open(
					'<c:url value = '/electronic/documentSelectReceive?styleNo='/>'+styNo,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
		});
		
		$('#clear').click(function(){
			$('#Approval').html(' ');
			$('#Receive').html(' ');
		});
		
		$('#cancel').click(function(){
			self.close();
		});
		
		$('input[name=submit]').click(function(){
			
			checkVal();
	            
            var dataArr = [];
 
            $('table input[type=text]').each(function(idx, item){
            
            	dataArr.push($(this).val());
            	
            });
            var jsonData = JSON.stringify(dataArr);		            
            $('input[name=electronicContent]').val(jsonData);				
            $('form[name=docfrm]').prop('action','<c:url value="/electronic/documentWrite"/>');		         
            		            
    		ApempNoData = [];
    		RpempNoData = [];
    		
    		$('input[name=apEmpNo]').each(function(idx, item){
    			ApempNoData.push($(this).val()); // 유저 번호 배열 
    		});
    		$('input[name=reEmpNo]').each(function(idx, item){
    			RpempNoData.push($(this).val()); // 유저 번호 배열 
    		});
    		
    		$('input[name=AempNoData]').val(ApempNoData);
    		$('input[name=RempNoData]').val(RpempNoData);
    		
	        $('form[name=docfrm]').submit();
		  
				
		});
		
		$('input[name=draft]').click(function(idx, item){
				
            var dataArr = [];
   		 
            $('table input[type=text]').each(function(idx, item){
            
            	dataArr.push($(this).val()); //문서 안에 내용 배열로
            	
            });
            var jsonData = JSON.stringify(dataArr);
            $('input[name=electronicContent]').val(jsonData);
            $('form[name=docfrm]').prop('action','<c:url value="/electronic/documentWrite"/>');
            		            
    		ApempNoData = []; //결재자 유저 번호 배열
    		RpempNoData = []; //수싲낮 유저 번호 배열
    		
    		$('input[name=apEmpNo]').each(function(idx, item){
    			ApempNoData.push($(this).val()); // 결재자 유저 번호 배열 주입
    		});
    		$('input[name=reEmpNo]').each(function(idx, item){
    			RpempNoData.push($(this).val()); // 수신자 유저 번호 배열 주입
    		});
    		
    		$('input[name=AempNoData]').val(ApempNoData);
    		$('input[name=RempNoData]').val(RpempNoData);
    		$('input[name=electronicDraft]').val('1');
    		
    		
	        $('form[name=docfrm]').submit();
			
		});
		
	
	});
	
	function checkVal(){
		
		if($('#title').val().length == 0  ){
			alert("제목을 입력해주세요");
			event.preventDefault();
			return false;
		}
		
	};
	
</script>

</head>
<body>
	<form name="docfrm" method="post" enctype="multipart/form-data"
		id="frm-form">

		<!-- 문서 스타일을 가져오기위한 -->
		<input type="hidden" id="styleNo" value="${param.styleNo }"
			name="styleNo">
		<!-- 문서 상태를 확인하기 위한 -->
		<input type="hidden" name="electronicFileFlag" value="N"> <input
			type="hidden" name="electronicCompletFlag" value="0"> <input
			type="hidden" name="electronicEmergencyFlag" value="0">
		<!-- 결재자/수신자 db에 저장을 위한 -->
		<input type="hidden" value="" name="AempNoData"> <input
			type="hidden" value="" name="RempNoData">
		<!-- 임시저장을 위한 -->
		<input type="hidden" value="0" name="electronicDraft">

		<div class="container" style="max-width: 1000px;">
			<div class="shadow-sm p-3 mb-3 bg-light rounded ">
				<h1>기안서</h1>
				<br>
				<div class="mb-5">
					<label for="title" class="form-label col-form-label-lg">제목</label>
					<input type="text" class="form-control" id="title"
						name="electronicTitle" placeholder="제목을 입력해주세요">
				</div>

				<button type="button"
					class="btn btn-light btn-outline-secondary mx-2" id="selectAP">결재자
					선택</button>
				<button type="button"
					class="btn btn-light btn-outline-secondary me-2"
					style="margin-left: 340px;" id="selectRC">수신자 선택</button>
				<button type="button" class="btn btn-light btn-outline-secondary"
					style="margin-left: 250px;" id="clear">초기화</button>
			</div>
			<div
				class="row align-items-start selectLine border border-5 border-secondary">
				결 <br>재 <br>라 <br> 인

				<!-- 결재라인 박히는곳  -->
				<div class="col selectDiv " id="Approval"></div>

				수 <br>신 <br>라 <br> 인

				<!-- 수신라인 박히는곳  -->
				<div class="col selectDiv " id="Receive"></div>

			</div>

			<div style="margin-bottom: 100px; text-align: -webkit-center;">

				<!-- 문서 양식 시작 -->
				<input type="hidden" name="electronicContent" value="">

				${svo.styleContent}

				<!-- 문서 양식 끝 -->

				<div class="shadow-sm p-3 mb-2 bg-light rounded ">
					<div class="form-group col-6">
						<div class="input-group mb-3 ">
							<input type="file" class="form-control" id="inputGroupFile02">
						</div>
					</div>
					<br>
					<div class="form-row">
						<div class="form-group">
							<input type="submit" name="submit"
								class="btn btn-light btn-outline-secondary"> <input
								type="submit" name="draft" value="임시저장"
								class="btn btn-light btn-outline-secondary">

							<button type="button" id="cancel"
								class="btn btn-light btn-outline-secondary">기안서 작성 취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>