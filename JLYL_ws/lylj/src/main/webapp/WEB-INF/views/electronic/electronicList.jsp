<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#newDocument').click(
				function() {
					open('<c:url value="/electronic/documentSelect"/>',
							'documentSelect', 'width=800,height=500');
				});
	});
</script>

<style type="text/css">
</style>

<div class="shadow-sm p-3 mb-5 bg-body align-middle mx-5 rounded">
	<div class="row justify-content-center">
		<div class="col-md-5 text-center mb-5">
			<c:if test="${param.no eq '1' }">
				<h2 class="heading-section bg-light text-dark">결재 대기</h2>
			</c:if>
			<c:if test="${param.no eq '2' }">
				<h2 class="heading-section bg-light text-dark">결재 수신문서</h2>
			</c:if>
			<c:if test="${param.no eq '3' }">
				<h2 class="heading-section bg-light text-dark">결재 예정 문서</h2>
			</c:if>
			<c:if test="${param.no eq '4' }">
				<h2 class="heading-section bg-light text-dark">결재 기안 문서함</h2>
			</c:if>
			<c:if test="${param.no eq '5' }">
				<h2 class="heading-section bg-light text-dark">결재 임시 저장함</h2>
			</c:if>
			<c:if test="${param.no eq '6' }">
				<h2 class="heading-section bg-light text-dark">결재 결재 완료 문서</h2>
			</c:if>
		</div>
	</div>
	<form action="" class="row gx-3 gy-2 ">
		<div class="col-md-12">
			<div class="table-wrap">
				<table class="table table-responsive-xl">
					<colgroup>
						<col style="width:10%" />
						<col style="width:60%" />
						<col style="width:20%" />
						<col style="width:20%" />
					</colgroup>
					<thead>
						<tr>
							<th><label class="checkbox-wrap checkbox-primary"> <input
									class="align-middle" type="checkbox">
							</label></th>
							<th class="text-center">제목</th>
							<th class="text-center">기안자 번호</th>
							<th class="text-center">상태</th>
						</tr>
					</thead>
					
					<tbody>
						<c:if test="${empty List }">
							<tr>
								<td colspan="6" class="align_center">결재 대기 문서가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty List }">
							<c:forEach var="eleVo" items="${List }">
								<tr class="alert align-middle">
								
									<!-- 반복 처리 구간 -->
									
										<td class="justify-content-center"><label class="checkbox-wrap checkbox-primary"> <input
												class="align-middle" type="checkbox">
										</label></td>
										<td class="d-flex align-items-center justify-content-center">
												<a href="<c:url value='/electronic/electronicDetail?ElectronicNo=${eleVo.ELECTRONIC_NO }&no=${param.no }'/>"><span>${eleVo.ELECTRONIC_TITLE }</span></a>
										</td>
										<td class="text-center">${eleVo.EMP_NO }</td>
										<td class="text-center"><span class="">
										
										<c:if test="${param.no eq 1 }">
											<c:if test="${eleVo.APPROVAL_LINE_COMPLETE_FLAG eq '0'}">
												처리중(내가 승인 안한 상태)
											</c:if>
											<c:if test="${eleVo.APPROVAL_LINE_COMPLETE_FLAG eq '1'}">
												승인(나만 승인한 상태)
											</c:if>
										</c:if>
										
										<c:if test="${param.no eq 2 }">
											<c:if test="${eleVo.RECEIVE_LINE_FLAG eq '0'}">
												수신 미확인
											</c:if>
											<c:if test="${eleVo.RECEIVE_LINE_FLAG eq '1'}">
												수신 확인
											</c:if>
										</c:if>
										
										<c:if test="${param.no eq 3 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
												처리중(모두 승인은 안한 상태)
											</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
												승인(모두 승인한 상태)
											</c:if>
										</c:if>
										
										<c:if test="${param.no eq 4 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
												처리중(모두 승인은 안한 상태)
											</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
												승인(모두 승인한 상태)
											</c:if>
										</c:if>
										
										<c:if test="${param.no eq 6 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
												처리중(모두 승인은 안한 상태)
											</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
												승인(모두 승인한 상태)
											</c:if>
										</c:if>
											
										</span></td>
										
									<!-- 반복 처리 구간 -->
									
								</tr>
							</c:forEach>
						</c:if>	
					</tbody>
					
				</table>
				<div class=" bg-light text-dark col-md-12 row justify-content-center my-5">
					페이징 처리 공간
				</div>
			</div>
		</div>
		<div class="col-md-12 row justify-content-center">
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeSelect">Preference</label>
				<select class="form-select" id="specificSizeSelect">
					<option selected>Choose...</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeInputName">Name</label>
				<input type="text" class="form-control" id="specificSizeInputName"
					placeholder="Jane Doe">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>

</div>
<%@ include file="../inc/bottom.jsp"%>