<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
#divscheduleAdd {
	margin-left: 11px;
}

.btnSchAdd {
	width: 93%;
}
</style>

<link
	href="<c:url value="/resources/css/ele_document/ele_doc_main.css"/>"
	rel="stylesheet">

<script type="text/javascript">
	$(function() { // db 에 있는 content 를 가져와서 배열로 돌린다음 배열 갯수만큼 input 에 넣어준다 
		
		var draftFolNo = $('#draftFolNo').val();
	
		window.onload = function() {

			var data = JSON.parse($('input[name=electronicContent]').val());

			console.log(data);
			data_cnt = data.length;
			console.log(data_cnt);

			$.each(data, function(idx, item) {
				console.log(item);
				$('table input[type=text]').eq(idx).val(item);
			});
			
			if(draftFolNo != '5'){
				$('table input[type=text]').prop('disabled', 'disabled');
				$('table input[type=text]').prop('style',
						' border : 0; background : white');
			}
		}
	});
	$(function() {

		$('#newDocument').click(
				function() {
					open('<c:url value="/electronic/documentSelect"/>',
							'documentSelect', 'width=800,height=500');
				});

		var avoEmpNo = []; // 결재자 배열
		var rvoEmpNo = []; // 수신자 배열
		
		$('.avosum').each(function(idx, item) {
			var val = $(this).val();
			avoEmpNo.push(val);
		});
		console.log(avoEmpNo);

		$('.rvosum').each(function(idx, item) {
			var val = $(this).val();
			rvoEmpNo.push(val);
		});
		console.log(rvoEmpNo);

		var avoFlagsum = []; //결재 승인했는지 확인 용 flag

		$('.avoFlagsum').each(function(idx, item) {
			var val = $(this).val();
			avoFlagsum.push(val);
		});
		console.log("avoFlagsum = " + avoFlagsum);

		var rvoFlagsum = []; // 수신 했는지 확인용 flag

		$('.rvoFlagsum').each(function(idx, item) {
			var val = $(this).val();
			rvoFlagsum.push(val);
		});
		console.log("rvoFlagsum = " + rvoFlagsum);

		$
				.ajax({ //결재자 라인을 보여주고, 승인을 했으면 도장을 표시하기 위한
					url : "<c:url value ='/electronic/selectstampList'/>",
					data : {
						empNo : avoEmpNo
					},
					type : "post",
					success : function(data) {
						$
								.each(
										data,
										function(idx, val) {
											var stampInfo = "<span id='select-line'><span id='select-position'>"
													+ val.POSITION_NAME
													+ "</span><span id='select-name'>"
													+ val.EMP_NAME
													+ "<br>"
													+ "<img class='Astamp' style='width: 40px;' alt='아이유' src='<c:url value='/resources/img/"+val.STAMP_NAME+"'/>'></span><input type='hidden' value="+val.EMP_NO+" id='styno' name = 'apEmpNo'>";
											$('#Approval').append(stampInfo);
											if (avoFlagsum[idx] == '0') {
												$('.Astamp').eq(idx).attr(
														'style',
														'display: none');
											}
										});
					},
					error : function(data) {
						alert("결재자 없음! 결재자가 없는게 말이됨? 나중에 이 오류 지워");
					}
				});
		$
				.ajax({
					url : "<c:url value ='/electronic/selectstampList'/>",
					data : {
						empNo : rvoEmpNo
					},
					type : "post",
					success : function(data) {
						$
								.each(
										data,
										function(idx, val) {
											var stampInfo = "<span id='select-line'><span id='select-position'>"
													+ val.POSITION_NAME
													+ "</span><span id='select-name'>"
													+ val.EMP_NAME
													+ "<br>"
													+ "<img class='Rstamp'  style='width: 40px;' alt='아이유' src='<c:url value='/resources/img/"+val.STAMP_NAME+"'/>'></span><input type='hidden' value="+val.EMP_NO+" id='styno' name = 'reEmpNo'>";
											$('#Receive').append(stampInfo);
											if (rvoFlagsum[idx] == '0') {
												$('.Rstamp').eq(idx).attr(
														'style',
														'display: none');
											}
										});
					},
					error : function(data) {
						alert("수신자 없음! 나중에 이 오류 지워")
					}
				});
		
		var eleNo =  $('input[name=electronicNo]').val(); //문서 번호
		
		$('#selectAP').click(function() { // 결재자 초기화를 위한 삭제 진행
			if(avoEmpNo !=null){
				$.ajax({
					url : "<c:url value = '/electronic/deleteAppLine?electronicNo='/>"+eleNo,
						data : {
							empNo : avoEmpNo
						},
							type : "post",
								success : function(){
									console.log("삭제 성공");
									$('#Approval').html("");
								},
									error : function(){
										console.log("삭제 실패");
									}
								
				});
			};
			
			window
			.open(
					'<c:url value = '/electronic/documentSelectApproval?styleNo='/>'+getStyle,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
			
		});
		
		$('#selectRC').click(function() { // 수신자 초기화를 위한 삭제 진행
			if(rvoEmpNo != null){
				$.ajax({
					url : "<c:url value = '/electronic/deleteReLine?electronicNo='/>"+eleNo,
						data : {
							empNo : rvoEmpNo
						},
							type : "post",
								success : function(){
									console.log("삭제 성공");
									$('#Receive').html("");
								},
									error : function(){
										console.log("삭제 실패");
									}
								
				});
			};
		
			window
			.open(
					'<c:url value = '/electronic/documentSelectReceive?styleNo='/>'+getStyle,
					'_parent ',
					'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');
			
		});

		var getStyle = $('#getStyle').val();

		$('#ok').click(function() { //결재 승인 
			$('form[name=apAccept]').submit();
		});

		$('#return').click(function() { //결재 반려
			location.href = "<c:url value = '/electronic/EleReturn?ElectronicNo='/>"+eleNo;
		});
		
		$('.cancel').click(function(){  // 결재 보류 // 수신 뒤로가기 // 반려문서 뒤로가기
			history.back();
		})
		
		$('#reOk').click(function() { //수신 승인  
			$('form[name=reAccept]').submit();
		});
		
		
		$('#save_draft').click(function() { //임시저장문서 저장
			
			checkVal();
	            
	        var dataArr = [];
	        
	        $('table input[type=text]').each(function(idx, item){
	        
	        	dataArr.push($(this).val()); //양식에 있는 text내용을 배열로 가져오기
	        	
	        });
	        var jsonData = JSON.stringify(dataArr);		      
	        $('input[name=electronicContent]').val("");			
	        $('input[name=electronicContent]').val(jsonData);//배열로가져온 값을 form태그 안에 넣어서 db에 전송				
	        $('form[name=docfrm]').prop('action','<c:url value="/electronic/documentUpdate"/>');
	        		            
			ApempNoData = []; //결재자 유저 번호 배열
			RpempNoData = []; //수신자 유저 번호 배열
			
			$('input[name=apEmpNo]').each(function(idx, item){
				ApempNoData.push($(this).val()); 
			});
			$('input[name=reEmpNo]').each(function(idx, item){
				RpempNoData.push($(this).val()); 
			});
			
			$('input[name=AempNoData]').val(ApempNoData);
			$('input[name=RempNoData]').val(RpempNoData);    		
    		$('input[name=electronicDraft]').val("1");
    		
    		checkVal();
	        $('form[name=docfrm]').submit();
	        
		});

		$('#cancel_draft').click(function() { //임시저장문서 뒤로가기
			history.back();
		});

		$('#ok_draft').click(function(){ // 임시저장문서 기안 
			
		
	            
	        var dataArr = [];
	        
	        $('table input[type=text]').each(function(idx, item){
	        
	        	dataArr.push($(this).val()); //양식에 있는 text내용을 배열로 가져오기
	        	
	        });
	        var jsonData = JSON.stringify(dataArr);		      
	        $('input[name=electronicContent]').val("");			
	        $('input[name=electronicContent]').val(jsonData);//배열로가져온 값을 form태그 안에 넣어서 db에 전송				
	        $('form[name=docfrm]').prop('action','<c:url value="/electronic/documentUpdate"/>');
	        		            
			ApempNoData = []; //결재자 유저 번호 배열
			RpempNoData = []; //수신자 유저 번호 배열
			
			$('input[name=apEmpNo]').each(function(idx, item){
				ApempNoData.push($(this).val()); 
			});
			$('input[name=reEmpNo]').each(function(idx, item){
				RpempNoData.push($(this).val()); 
			});
			
			$('input[name=AempNoData]').val(ApempNoData);
			$('input[name=RempNoData]').val(RpempNoData);    		
    		$('input[name=electronicDraft]').val("0");
    		
    		checkVal();
	        $('form[name=docfrm]').submit();
		  
				
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
<div class="container shadow p-3 mb-5 bg-white rounded">

	<!-- 결재자 승인을 위한 form -->
	<!-- 수신사 삭제를 위한 form -->
	<form name="apAccept" method="post"
		action="<c:url value = '/electronic/AcceptUpdateAppLine?no=${param.no }'/>">
		<input type="hidden" name="empNo" value="${sessionScope.empNo }">
		<input type="hidden" name="electronicNo" value="${vo.electronicNo }">
	</form>

	<!-- 수신자 승인을 위한 form -->
	<form name="reAccept" method="post"
		action="<c:url value = '/electronic/AcceptUpdateReLine?no=${param.no }'/>">
		<input type="hidden" name="empNo" value="${sessionScope.empNo }">
		<input type="hidden" name="electronicNo" value="${vo.electronicNo }">
	</form>
	<form name="" method="post" action=""></form>

	<!-- 승인을 했는지 확인을 위한 input -->
	<c:forEach var="avoEmp" items="${avo }">
		<input type="hidden" class="avosum" value="${avoEmp.empNo }">
		<input type="hidden" class="avoFlagsum"
			value="${avoEmp.approvalLineCompleteFlag }">
	</c:forEach>
	<c:forEach var="rvoEmp" items="${rvo }">
		<input type="hidden" class="rvosum" value="${rvoEmp.empNo }">
		<input type="hidden" class="rvoFlagsum"
			value="${rvoEmp.receiveLineFlag }">
	</c:forEach>


	<!-- 임시저장을 불러오기 위한 input -->
	<input type="hidden" id="getStyle" value="${vo.styleNo }"> <input
		type="hidden" id="draftFolNo" value="${param.no }">

	<form name="docfrm" method="post" enctype="multipart/form-data"
		id="frm-form">
		<!-- 결재자/수신자 db에 저장을 위한 -->
		<input type="hidden" value="" name="AempNoData"> <input
			type="hidden" value="" name="RempNoData">
		<!-- 문서 내용을 db에 저장하기 위한 -->
		<input type="hidden" name="electronicNo" value="${vo.electronicNo }">
		<input type="hidden" name="electronicContent"
			value='${vo.electronicContent }'> <input type="hidden"
			name="electronicDraft" value="1">
		<!-- 파일/ 긴급 처리 -->
		<input type="hidden" name="electronicFileFlag" value="0"> <input
			type="hidden" name="electronicEmergencyFlag" value="0">
		<!-- 파일/ 긴급 처리 -->

		<div class="container" style="max-width: 1000px;">
			<div class="shadow-sm p-3 mb-3 bg-light rounded ">
				<h1>기안서</h1>
				<br>

				<!-- 제목라인 -->
				<c:if test="${param.no != '5' }">
					<div class="mb-5">
						<label for="title" class="form-label col-form-label-lg">[제목]</label>
						<p class="align-middle fs-3" id="title">${vo.electronicTitle }
						</p>
					</div>
				</c:if>
				<c:if test="${param.no eq '5' }">
					<div class="mb-5">
						<label for="title" class="form-label col-form-label-lg">제목</label>
						<input type="text" class="form-control" id="title"
							name="electronicTitle" placeholder="제목을 입력해주세요"
							value="${vo.electronicTitle }">
					</div>
				</c:if>
				<!-- 제목라인 -->

				<!-- 결재자/ 수신자 라인 -->
				<c:if test="${param.no eq '5' }">
					<button type="button"
						class="btn btn-light btn-outline-secondary mx-2" id="selectAP">결재자
						초기화/선택</button>
					<button type="button"
						class="btn btn-light btn-outline-secondary me-2"
						style="margin-left: 340px;" id="selectRC">수신자 초기화/선택</button>
				</c:if>
			</div>
			<div
				class="row align-items-start selectLine border border-5 border-secondary">
				결 <br>재 <br>라 <br> 인
				<div class="col selectDiv " id="Approval"></div>

				수 <br>신 <br>라 <br> 인
				<div class="col selectDiv " id="Receive"></div>
			</div>
			<!-- 결재자/ 수신자 라인 -->

			<div style="margin-bottom: 100px; text-align: -webkit-center;">

				<!-- 문서 양식 시작 -->

				${styleContent}

				<!-- 문서 양식 끝 -->

				<div class="shadow-sm p-3 mb-2 bg-light rounded ">
					<div class="form-group col-3">
						<div class="input-group mb-3 btn-group dropend">
							  <!-- 첨부파일 -->
						      <c:if test="${!empty fvo}">
								    <button class="form-control" id="upFile" type="button" data-bs-toggle="dropdown" >첨부파일</button>
								    <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink" id="upFileList">
								    	<c:forEach var="file" items="${fvo}">
								    		<c:set var="filesize" value="${file.fileSize }" />
								            <li><a class="dropdown-item" href="<c:url value = '/electronic/download?fileNo=${file.fileNo }'/>" ><i class="fas fa-save"></i>&nbsp;&nbsp; ${file.fileOriginalname}</a></li>
							            </c:forEach>
							        </ul>
						        </c:if>
						        
							    <c:if test="${empty fvo }">
							    	<div id="borderDiv"></div>
						        </c:if>
												
						</div>
						
						
						
					</div>
					<br>
					<div class="form-row" style="justify-content: center;">
						<div class="form-group">

							<!-- 수신 문서일때 -->
							<c:if test="${param.no eq '2' }">
								<button type="button" id="reOk"
									class="btn btn-light btn-outline-secondary">받음</button>
								<button type="button" id="recancel"
									class="btn btn-light btn-outline-secondary">안받음처리</button>
							</c:if>

							<!-- 임시저장 문서일때 -->
							<c:if test="${param.no eq '5'}">
								<button type="button" id="ok_draft"
									class="btn btn-light btn-outline-secondary">작성 완료/ 기안
									하기</button>
								<button type="button" id="save_draft"
									class="btn btn-light btn-outline-secondary">저장 하기</button>
								<button type="button"
									class="btn btn-light btn-outline-secondary cancel">뒤로가기</button>
							</c:if>

							<!-- 결재 대기 문서일때 -->
							<c:if test="${param.no eq '1'}">
								<button type="button" id="ok"
									class="btn btn-light btn-outline-secondary">승인</button>
								<button type="button"
									class="btn btn-light btn-outline-secondary cancel">보류</button>
								<button type="button" id="return"
									class="btn btn-light btn-outline-secondary">반려</button>
							</c:if>

							<!-- 반려 문서일때 -->
							<!-- 예정 문서일때 -->
							<!-- 완료 문서일때 -->
							<!-- 기안 문서일때 -->
							<c:if
								test="${param.no eq '7' or param.no eq '3' or param.no eq '6' or param.no eq '4'}">
								<button type="button"
									class="btn btn-light btn-outline-secondary cancel">뒤로가기</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>