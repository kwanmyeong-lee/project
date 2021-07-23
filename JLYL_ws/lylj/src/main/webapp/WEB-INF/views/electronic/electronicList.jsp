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
	
	function pageProc(curPage){
	    $('input[name=currentPage]').val(curPage);
	    $('form[name=frmPage]').submit();   
	 }
</script>

<style type="text/css">
</style>

<!-- 페이징 처리를 위한 form -->

<form
	action="<c:url value='/electronic/electronicList?no=${param.no}'/>"
	name="frmPage" method="post" id="frmPage">
	<input type="hidden" name="currentPage"
		value=${pagingInfo.currentPage }><br> <input
		type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	<input type="hidden" name="searchKeyword"
		value="${param.searchKeyword}"><br>
</form>

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
			<c:if test="${param.no eq '7' }">
				<h2 class="heading-section bg-light text-dark">결재 반려 문서</h2>
			</c:if>
		</div>
	</div>
	<div class="col-md-12">
		<div class="table-wrap">
			<table class="table table-responsive-xl">
				<colgroup>
					<col style="width: 60%" />
					<col style="width: 20%" />
					<col style="width: 20%" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">제목</th>
						<th class="text-center">기안자 번호</th>
						<th class="text-center">상태</th>
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty List }">
						<tr>
							<td colspan="6" class="align_center">문서가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty List }">
						<c:forEach var="eleVo" items="${List }">
							<tr class="alert align-middle">

								<!-- 반복 처리 구간 -->

								<td class="d-flex  justify-content-center align-middle">
									<a
									href="<c:url value='/electronic/electronicDetail?ElectronicNo=${eleVo.ELECTRONIC_NO }&no=${param.no }'/>"><span>${eleVo.ELECTRONIC_TITLE }</span></a>
								</td>
								<td class="text-center">${eleVo.EMP_NO }</td>
								<td class="text-center"><span class=""> <c:if
											test="${param.no eq 1 }">
											<c:if test="${eleVo.APPROVAL_LINE_COMPLETE_FLAG eq '0'}">
												처리중(내가 승인 안한 상태)
											</c:if>
											<c:if test="${eleVo.APPROVAL_LINE_COMPLETE_FLAG eq '1'}">
												승인(나만 승인한 상태)
											</c:if>
										</c:if> <c:if test="${param.no eq 2 }">
											<c:if test="${eleVo.RECEIVE_LINE_FLAG eq '0'}">
												수신 미확인
											</c:if>
											<c:if test="${eleVo.RECEIVE_LINE_FLAG eq '1'}">
												수신 확인
											</c:if>
										</c:if> <c:if test="${param.no eq 3 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
												처리중(모두 승인은 안한 상태)
											</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
												승인(모두 승인한 상태)
											</c:if>
										</c:if> <c:if test="${param.no eq 4 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
												처리중(모두 승인은 안한 상태)
											</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
												승인(모두 승인한 상태)
											</c:if>
										</c:if> <c:if test="${param.no eq 6 }">
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
		</div>
	</div>

	<div class="col-md-11 row justify-content-center py-4">
		<div class="col-sm-2 mr-0">
			<!-- 이전 블럭 -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})"> <i
					class="fas fa-backward"></i>
				</a>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<a class="px-1" href="#">${i }</a>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a class="px-1" href="#" onclick="pageProc(${i})">${i }</a>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭 -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <i
					class="fas fa-forward"></i>
				</a>
			</c:if>
		</div>
	</div>

	<form name="frmSearch" method="post"
		action='<c:url value="/electronic/electronicList?no=${param.no }"/>'>
		<div class="col-md-12 row justify-content-center">
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeSelect">Preference</label>
				<select class="form-select" id="searchCondition"
					name="searchCondition">
					<option selected>Choose...</option>
					<option value="ELECTRONIC_TITLE"
						<c:if test="${param.searchCondition == 'ELECTRONIC_TITLE' }">               
	                  selected="selected"
	            </c:if>>제목</option>
					<option value="EMP_NO"
						<c:if test="${param.searchCondition == 'EMP_NO' }">               
	                  selected="selected"
	            </c:if>>기안자번호</option>
				</select>
			</div>
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeInputName">Name</label>
				<input type="text" name="searchKeyword" class="form-control"
					id="searchTextBox" value="${param.searchKeyword }"
					placeholder="입력해주세요">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary" id="searchBtn">Submit</button>
			</div>
		</div>
	</form>

</div>
<%@ include file="../inc/bottom.jsp"%>