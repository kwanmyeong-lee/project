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
			$('#Approval').html("");
			window
			.open(
					'<c:url value = '/electronic/documentSelectApproval?styleNo='/>'+styNo,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
		});
		$('#selectRC').click(function(){
			$('#Receive').html("");
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
		
		$('input[name=submit]').click(function(){ //기안서 보내기
			
	            
            var dataArr = [];
 
            $('table input[type=text]').each(function(idx, item){
            
            	dataArr.push($(this).val());
            	
            });
            var jsonData = JSON.stringify(dataArr);		            
            $('input[name=electronicContent]').val(jsonData);				
            $('form[name=docfrm]').prop('action','<c:url value="/electronic/documentWrite"/>');		         
            		            
    		var ApempNoData = [];
    		var RpempNoData = [];
    		
    		$('input[name=apEmpNo]').each(function(idx, item){
    			ApempNoData.push($(this).val()); // 유저 번호 배열 
    		});
    		$('input[name=reEmpNo]').each(function(idx, item){
    			RpempNoData.push($(this).val()); // 유저 번호 배열 
    		});
    		
    		
    		$('input[name=AempNoData]').val(ApempNoData);
    		$('input[name=RempNoData]').val(RpempNoData);

    		if($('input[name=upfile]').val()){
    			$('input[name=electronicFileFlag]').val("Y");
    		}
    		
    		if(checkVal() == false){
    			return false;
    		};
    		
	        $('form[name=docfrm]').submit();
		  
				
		});
		
		$('input[name=draft]').click(function(idx, item){ //기안서 임시저장
				
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
    		

    		if($('#title').val().length == 0  ){
    			alert("제목을 입력해주세요");
    			event.preventDefault();
    			return false;
    		}    		
    		

    		if($('input[name=upfile]').val()){
    			$('input[name=electronicFileFlag]').val("Y");
    		}

	        $('form[name=docfrm]').submit();
			
		});
		
	        let today = new Date();   
	
	        let year = today.getFullYear(); // 년도
	        let month = today.getMonth() + 1;  // 월
	        let date = today.getDate();  // 날짜
	        
	        $('#currentDate').val(year + '/' + month + '/' + date);
	        
	    
	    	$('#emergency').click(function(){
	    		
	    	    if(	$('#emergency').text() == "긴급설정"){
		    		alert("긴급 설정 완료");
		    		$('input[name=electronicEmergencyFlag]').val('1');
		    	  	$('#emergency').text("긴급취소");
		        }else{
		     		alert("긴급 설정 취소");
		    		$('input[name=electronicEmergencyFlag]').val('0');
		    	  	$('#emergency').text("긴급설정");
		        }
	    		
	    	});
	});
	
	function checkVal(){
		
		if($('#title').val().length == 0  ){
			alert("제목을 입력해주세요");
			event.preventDefault();
			return false;
		}
		
		if(	$('input[name=AempNoData]').val().length == 0){
			alert("결재자를 선택해주세요");
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
					class="btn btn-light btn-outline-secondary ms-1 me-5" id="selectAP">결재자
					선택</button>
				<button type="button"
					class="btn btn-light btn-outline-secondary me-2 "
					style="margin-left: 300px;" id="selectRC">수신자 선택</button>
				<button type="button" class="btn btn-light btn-outline-secondary"
					style="margin-left: 200px;" id="clear">초기화</button>
			</div>
			<div
				class="row align-items-start selectLine border border-5 border-secondary ">
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
				<br>
				<h2>${svo.styleName }</h2>
				<br>
				<table class="doc-table">
					<tr>
						<td class="doc-td" colspan="3">작성일자</td>
						<td class="doc-td2"><input type="text" id="currentDate" disabled="disabled"></td>
						<td class="doc-td">부서</td>
						<td class="doc-td2"><c:forEach var="ddvo" items="${dvo }">
								<c:if test="${ddvo.departmentNo eq  evo.departmentNo}">
									<input type="text" value="${ddvo.departmentName}" disabled="disabled">
								</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">이 름</td>
						<td class="doc-td2"><input type="text"
							value="${evo.empName }" disabled="disabled"></td>
						<td class="doc-td">직 책</td>
						<c:forEach var="ppvo" items="${pvo }">
							<c:if test="${ppvo.positionNo eq evo.positionNo }">
								<td class="doc-td2"><input type="text"
									value="${ppvo.positionName }" disabled="disabled"></td>
							</c:if>
						</c:forEach>
					</tr>
				</table>

				${svo.styleContent}
				
				<!-- 문서 양식 끝 -->

				<div class="shadow-sm p-3 mb-2 bg-light rounded ">
					<div class="form-group col-6">

						<div class="input-group mb-3 ">
							<input multiple="multiple" type="file" class="form-control"
								name="upfile" id="inputGroupFile02" aria-label="Upload">
						</div>
						<span style="margin-left: 5px; font-size: 14px;">※&nbsp;
							파일크기 제한 : 50MB</span>

					</div>
					<br>
					<div class="form-row">
						<div class="form-group">
							<input type="submit" name="submit"
								class="btn btn-light btn-outline-secondary"> <input
								type="submit" name="draft" value="임시저장"
								class="btn btn-light btn-outline-secondary">
							<button type="button" class="btn btn-light btn-outline-secondary" id="emergency">긴급설정</button>
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