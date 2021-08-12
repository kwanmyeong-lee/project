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
<script type="text/javascript"
	src="<c:url value='/resources/js/bluebird.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/html2canvas.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jspdf.min.js'/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.all.min.js"></script>


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
		
		$('#savePdf').click(function() { // pdf저장 button id
			
		    	html2canvas($("#pdfLine")).then(canvas => {
		    		  // base64 url 로 변환
		    		  var imgData = canvas.toDataURL('image/jpeg');

		    		  var imgWidth = 190; // 이미지 가로 길이(mm) A4 기준
		    		  var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
		    		  var imgHeight = canvas.height * imgWidth / canvas.width;
		    		  var heightLeft = imgHeight;
		    		  var margin = 0;

		    		  var doc = new jsPDF('p', 'mm', 'a4');
		    		  var position = 0;

		    		  // 첫 페이지 출력
		    		  doc.addImage(imgData, 'jpeg', margin, position, imgWidth, imgHeight);
		    		  heightLeft -= pageHeight;

		    		  // 한 페이지 이상일 경우 루프 돌면서 출력
		    		  while (heightLeft >= 20) {
		    		    position = heightLeft - imgHeight;
		    		    doc.addPage();
		    		    doc.addImage(imgData, 'jpeg', margin, position, imgWidth, imgHeight);
		    		    heightLeft -= pageHeight;
		    		  }

		    		  // 파일 저장
		    		  doc.save('sample.pdf');
		    		});

		});
		
	});
	$(function() {
		
		$('#insertStamp').click(function(){
			open('<c:url value="/electronic/insertStamp"/>',
					'documentSelect', 'width=800,height=500');
		});

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
													+ "<img class='Astamp' style='width: 40px;' alt='아이유' src='<c:url value='/resources/emp_images/"+val.STAMP_NAME+"'/>'></span><input type='hidden' value="+val.EMP_NO+" id='styno' name = 'apEmpNo'>";
											$('#Approval').append(stampInfo);
											if (avoFlagsum[idx] == '0') {
												$('.Astamp').eq(idx).attr(
														'style',
														'display: none');
											}
										});
					},
					error : function(data) {
						colsole.log("결재자 없음! 결재자가 없는게 말이됨? 나중에 이 오류 지워");
					}
				});
		$
				.ajax({//수신자 라인을 보여주고, 승인을 했으면 도장을 표시하기 위한
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
													+ "<img class='Rstamp'  style='width: 40px;' alt='아이유' src='<c:url value='/resources/emp_images/"+val.STAMP_NAME+"'/>'></span><input type='hidden' value="+val.EMP_NO+" id='styno' name = 'reEmpNo'>";
											$('#Receive').append(stampInfo);
											if (rvoFlagsum[idx] == '0') {
												$('.Rstamp').eq(idx).attr(
														'style',
														'display: none');
											}
										});
					},
					error : function(data) {
						console.log("수신자 없음! 나중에 이 오류 지워")
					}
				});
		
		var eleNo =  $('input[name=electronicNo]').val(); //문서 번호
		
		$('#deleteUpFile').click(function(){ //첨부파일 삭제 
			$.ajax({
				url : "<c:url value = '/electronic/deleteFile?electronicNo='/>"+eleNo,
						type : "get",
							success : function(data){
								if(data>0){
									console.log("삭제 성공");
									alert("삭제 성공");
									$('#upLoadDisplay').css('display', 'block');
									$('.fileBlock').css('display', 'none');
								}else{
									console.log("삭제 실패");
									alert("삭제 실패");
								}
							},
							error : function(){
								console.log("삭제 실패");
							}
			});
		
		});
		
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

		var titleVal = $('#title').text();
		var Take = $('#eleEmpNo').val();
		
		$('#return').click(function() { //결재 반려
			window
			.open(
					'<c:url value = '/electronic/electronicReturnEmail?mailTitle='/>'+titleVal+'&mailTake='+Take+'&eleNo='+eleNo,
					'_parent ',
					'top=40, left=1000, width=520, height=700, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no');

		});
		
		$('.cancel').click(function(){  // 결재 보류 // 수신 뒤로가기 // 반려문서 뒤로가기
			history.back();
		})
		
		$('#reOk').click(function() { //수신 승인  
			$('form[name=reAccept]').submit();
		});
		
		$('#recancel').click(function(){
			history.back();
		});
		
		
		$('#save_draft').click(function() { //임시저장문서 저장
			
	            
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

    		if($('#title').val().length == 0  ){
    			alert("제목을 입력해주세요");
    			event.preventDefault();
    			return false;
    		}

    		if($('input[name=upfile]').val()){
    			$('input[name=electronicFileFlag]').val("Y");
    		}
    		
    		if($('#title').val().length == 0  ){
    			alert("제목을 입력해주세요");
    			event.preventDefault();
    			return false;
    		}
    		
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
    		
    		if($('input[name=upfile]').val()){
    			$('input[name=electronicFileFlag]').val("Y");
    		}    		
    		
    		if(checkVal() == false){
    			return false;
    		}else{
		        $('form[name=docfrm]').submit();
    		}
    		
		  
				
		});
		
		
	});
	
	function checkVal(){
		
		if($('#title').val().length == 0  ){
			alert("제목을 입력해주세요");
			event.preventDefault();
			return false;
		}
		
		if(	$('input[name=AempNoData]').val().length == 0 && $('#Approval').val().length == 0){
			alert("결재자를 선택해주세요");
			event.preventDefault();
			return false;
		}
		
	};
	
	function back(){
		location.href = "<c:url value = '/electronic/electronicList?no=1'/>"
	}
	
		

</script>

<c:if test="${param.no eq '1' }">
	<h2>결재 대기</h2>
</c:if>
<c:if test="${param.no eq '2' }">
	<h2>결재 수신문서</h2>
</c:if>
<c:if test="${param.no eq '3' }">
	<h2>결재 예정 문서</h2>
</c:if>
<c:if test="${param.no eq '4' }">
	<h2>결재 기안 문서함</h2>
</c:if>
<c:if test="${param.no eq '5' }">
	<h2>결재 임시 저장함</h2>
</c:if>
<c:if test="${param.no eq '6' }">
	<h2>결재 완료 문서</h2>
</c:if>
<c:if test="${param.no eq '7' }">
	<h2>결재 반려 문서</h2>
</c:if>
<div class="container shadow p-3 mb-5 bg-white rounded" id="pdfLine">
	<input type="hidden" id="eleEmpNo" value="${vo.empNo }">
	
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
		<input type="hidden" name="electronicFileFlag" value="N"> <input
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

				<br>
				<h2>${svo.styleName }</h2>
				<br>
				<table class="doc-table">
					<tr>
						<td class="doc-td" colspan="3">작성일자</td>
						<td class="doc-td2" style="width: 235px"><input type="text"></td>
						<td class="doc-td">부서</td>
						<td class="doc-td2" style="width: 235px"><input type="text"></td>
					</tr>
					<tr>
						<td class="doc-td" colspan="3">이 름</td>
						<td class="doc-td2"><input type="text"></td>
						<td class="doc-td">직 책</td>
						<td class="doc-td2"><input type="text"></td>
					</tr>
				</table>
				${styleContent}

				<!-- 문서 양식 끝 -->

				<!-- 첨부파일 다운 / 삭제 -->
				<div class="shadow-sm p-3 mb-2 bg-light rounded ">
					<div class="row justify-content-center fileBlock ">
						<div class="col-2">
							<c:if test="${!empty fvo}">
								<button type="button"
									class="btn btn-light btn-outline-secondary my-2 "
									id="deleteUpFile"
									style="
										<c:if test="${param.no eq '5'}">
											display: block;
										</c:if>
										<c:if test="${param.no != '5'}">
											display: none;
										</c:if>
										">첨부파일
									전체 삭제</button>
							</c:if>
						</div>
					</div>

					<!-- 첨부파일 추가 -->

					<div id="borderDiv">
						<div class="form-group col-6"
							style="
						<c:if test='${param.no == "5" }'>
							<c:if test="${!empty fvo }">
									display: none;
							</c:if>
							<c:if test="${empty fvo }">
									display: block;
							</c:if>
						</c:if>
						<c:if test='${param.no != "5" }'>
									display: none;
						</c:if>
						
						"
							id="upLoadDisplay">
							<div class="input-group mb-3 ">
								<input multiple="multiple" type="file" class="form-control"
									name="upfile" id="inputGroupFile02" aria-label="Upload">
							</div>
							<span style="margin-left: 5px; font-size: 14px;">※&nbsp;
								파일크기 제한 : 50MB</span>
						</div>
					</div>

					<br>
					<div class="form-row" style="justify-content: center;">
						<div class="form-group dropend">

							<!-- 수신 문서일때 -->
							<c:if test="${param.no eq '2' }">
								<button type="button" id="reOk" 
									class="btn btn-light btn-outline-secondary">받음</button>
								<button type="button" id="recancel"
									class="btn btn-light btn-outline-secondary">뒤로가기</button>
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
								<button type="button" id="return"
									class="btn btn-light btn-outline-secondary">반려</button>
								<button type="button"
									class="btn btn-light btn-outline-secondary cancel">뒤로가기</button>
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
							<button type="button" id="savePdf"
								class="btn btn-light btn-outline-secondary">PDF 다운로드</button>

							<!-- 첨부파일 확인 -->
							<c:if test="${!empty fvo}">
								<button
									class="btn btn-light btn-outline-secondary my-3 fileBlock "
									id="upFile" type="button" data-bs-toggle="dropdown">첨부파일</button>
								<ul class="dropdown-menu dropdown-menu-lg-end"
									aria-labelledby="dropdownMenuLink" id="upFileList">
									<c:forEach var="file" items="${fvo}">
										<c:set var="filesize" value="${file.fileSize }" />
										<li><a class="dropdown-item"
											href="<c:url value = '/electronic/download?fileNo=${file.fileNo }'/>"><i
												class="fas fa-save"></i>&nbsp;&nbsp;
												${file.fileOriginalname}</a></li>
									</c:forEach>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>