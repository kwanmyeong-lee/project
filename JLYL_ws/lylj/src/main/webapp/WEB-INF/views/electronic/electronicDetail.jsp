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
	$(function(){
		
			window.onload = function() {
			
				var data = JSON.parse($('input[name=electronicContent]').val());
			
				console.log(data);
				data_cnt = data.length;
				console.log(data_cnt);
			
				$.each(data, function(idx, item) {
					console.log(item);
					$('table input[type=text]').eq(idx).val(item);
				});
				$('table input[type=text]').prop('disabled', 'disabled');
				$('table input[type=text]').prop('style', ' border : 0; background : white');
			}
	})
	$(function() {

			$('#newDocument').click(
				function() {
					open('<c:url value="/electronic/documentSelect"/>',
							'documentSelect', 'width=800,height=500');
			});

			var avoEmpNo = [];
			var rvoEmpNo = [];
			$('.avosum').each(function(idx, item){
				var val = $(this).val();
				avoEmpNo.push(val);
			});
				console.log(avoEmpNo);
			
			$('.rvosum').each(function(idx, item){
				var val = $(this).val();
				rvoEmpNo.push(val);
			});
				console.log(rvoEmpNo);
				
				
			var avoFlagsum = [];
			
			$('.avoFlagsum').each(function(idx, item){
				var val = $(this).val();
				avoFlagsum.push(val);
			});
				console.log("avoFlagsum = "+avoFlagsum);
			
			var rvoFlagsum = [];
			
			$('.rvoFlagsum').each(function(idx, item){
				var val = $(this).val();
				rvoFlagsum.push(val);
			});
				console.log("rvoFlagsum = "+rvoFlagsum);
			
				
				$
				.ajax({
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
											if(avoFlagsum[idx] == '0'){
												$('.Astamp').eq(idx).attr('style', 'display: none');
											}
										});
					},
					error : function(data) {
						alert("결재자 없음! 결재자가 없는게 말이됨? 나중에 이 오류 지워")
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
													+ "<img class='Rstamp'  style='width: 40px;' alt='아이유' src='<c:url value='/resources/img/"+val.STAMP_NAME+"'/>'></span><input type='hidden' value="+val.EMP_NO+" id='styno' name = 'apEmpNo'>";
											$('#Receive').append(stampInfo);
											if(rvoFlagsum[idx] == '0'){
												$('.Rstamp').eq(idx).attr('style', 'display: none');
											}
										});
					},
					error : function(data) {
						alert("수신자 없음! 나중에 이 오류 지워")
					}
				});
	
				
	});
	
	$(function(){
		
		$('#ok').click(function(){
			$('form[name=accecp]').submit();
		});
		
		$('#cancel').click(function(){
			history.back();
		})
	});
	
</script>
<div class="container shadow p-3 mb-5 bg-white rounded">

	<form name="accecp" method="post" action="<c:url value = '/electronic/AcceptUpdateAppLine'/>">
			<input type="hidden" name="empNo" value="${sessionScope.empNo }">
			<input type="hidden" name="electronicNo" value="${vo.electronicNo }">
	</form>

	<form name="docfrm" method="post" enctype="multipart/form-data"
		id="frm-form">

		
		<c:forEach var="avoEmp" items="${avo }">
			<input type="hidden" class="avosum" value="${avoEmp.empNo }"> 
			<input type="hidden" class="avoFlagsum" value="${avoEmp.approvalLineCompleteFlag }"> 
		</c:forEach>
		<c:forEach var="rvoEmp" items="${rvo }">
			<input type="hidden" class="rvosum" value="${rvoEmp.empNo }">
			<input type="hidden" class="rvoFlagsum" value="${rvoEmp.receiveLineFlag }"> 
		</c:forEach>
		
		<div class="container" style="max-width: 1000px;">
			<div class="shadow-sm p-3 mb-3 bg-light rounded ">
				<h1>기안서</h1>
				<br>
				<div class="mb-5">
					<label for="title" class="form-label col-form-label-lg">[제목]</label>
					<p class="align-middle fs-3" id="title">${vo.electronicTitle }
					</p>
				</div>
			</div>
			<div
				class="row align-items-start selectLine border border-5 border-secondary">
				결 <br>재 <br>라 <br> 인
				<div class="col selectDiv " id="Approval"></div>

				수 <br>신 <br>라 <br> 인
				<div class="col selectDiv " id="Receive"></div>
			</div>





			<div style="margin-bottom: 100px; text-align: -webkit-center;">

				<!-- 문서 양식 시작 -->
				<input type="hidden" name="electronicContent"
				
					value='${vo.electronicContent }'> ${styleContent}

				<!-- 문서 양식 끝 -->

				<div class="shadow-sm p-3 mb-2 bg-light rounded ">
					<div class="form-group col-6">
						<div class="input-group mb-3 ">
							<input type="file" class="form-control" id="inputGroupFile02">
						</div>
					</div>
					<br>
					<div class="form-row" style="justify-content: center;">
						<div class="form-group">
							<button type="button" id="ok" class="btn btn-light btn-outline-secondary">승인</button>
							<button type="button" id="cancel" class="btn btn-light btn-outline-secondary">보류</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>