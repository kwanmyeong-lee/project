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
		
		$('#insertStamp').click(function(){
			open('<c:url value="/electronic/insertStamp"/>',
					'documentSelect', 'width=800,height=500');
		});
		
		$('#searchBtn').click(function(){
			
			if($('#searchCondition option:selected').text() == "선택하세요" && $('#searchTextBox').val().length > 0 ){
				alert('검색항목을 선택하세요')
				return false;
			}else if($('#searchCondition option:selected').text() != "선택하세요" && $('#searchTextBox').val().length < 1 ){
				alert('검색어를 입력하세요')
				return false;
			}else{
				$('form[name=frmSearch]').submit();
			}
			
		});
		
		$("#searchTextBox").keypress(function(e) { 
			 if (e.keyCode == 13){
					if($('#searchCondition option:selected').text() == "선택하세요" && $('#searchTextBox').val().length > 0 ){
						alert('검색항목을 선택하세요')
						return false;
					}else if($('#searchCondition option:selected').text() != "선택하세요" && $('#searchTextBox').val().length < 1 ){
						alert('검색어를 입력하세요')
						return false;
					}else{
						$('form[name=frmSearch]').submit();
					}

			    }    
		});
		
	});
	
	function pageProc(curPage){
	    $('input[name=currentPage]').val(curPage);
	    $('form[name=frmPage]').submit();   
	 }
	
	/*한페이지당 게시물 */
	function page(no){
	  var pageNo = no;
	  var listSize = $("#listSize option:selected").val();
		
	  if(listSize == 5){
		  var url='<c:url value = "/electronic/electronicList?no="/>'+pageNo+"&recordPerPage="+listSize;
	  }else if(listSize == 10){
		  var url='<c:url value = "/electronic/electronicList?no="/>'+pageNo+"&recordPerPage="+listSize;
	  }else if(listSize == 15){
		  var url='<c:url value = "/electronic/electronicList?no="/>'+pageNo+"&recordPerPage="+listSize;
	  }
	  location.href = url;
	}
</script>

<style type="text/css">
.page_wrap {
	text-align: center;
	font-size: 20px;
}

.page_nation {
	display: inline-block;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.list_title {
	color: #999999;
	text-decoration: none;
}
</style>

<!-- 페이징 처리를 위한 form -->

<form
	action="<c:url value='/electronic/electronicList?no=${param.no}&recordPerPage=${param.recordPerPage }'/>"
	name="frmPage" method="post" id="frmPage">
	<input type="hidden" name="currentPage"
		value=${pagingInfo.currentPage }> <br> <input
		type="hidden" name="searchCondition" value="${param.searchCondition}">
	<br> <input type="hidden" name="searchKeyword"
		value="${param.searchKeyword}"> <br>
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
				<h2 class="heading-section bg-light text-dark">결재 완료 문서</h2>
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
					<col style="width: 45%" />
					<col style="width: 15%" />
					<col style="width: 20%" />
					<col style="width: 20%" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">제목</th>
						<th class="text-center">기안자</th>
						<th class="text-center">상태</th>
						<th class="text-center">날짜</th>
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
							<tr class="alert align-middle border-top border-bottom">

								<!-- 반복 처리 구간 -->

								<td class="text-center pt-3"><a class="list_title"
									href="<c:url value='/electronic/electronicDetail?ElectronicNo=${eleVo.ELECTRONIC_NO }&no=${param.no }'/>"><span>${eleVo.ELECTRONIC_TITLE }</span>
										<c:if test="${eleVo.ELECTRONIC_FILE_FLAG eq 'Y' }">
											<i class="fas fa-file"></i>
										</c:if> <c:if test="${eleVo.ELECTRONIC_EMERGENCY_FLAG eq '1' }">
											<i class="fas fa-exclamation-triangle"></i>
										</c:if> </a></td>
								<td class="text-center pt-3 "><c:forEach var="AllEmp"
										items="${allEmp }">
										<c:if test="${eleVo.EMP_NO eq AllEmp.empNo}">
											<img class="rounded-circle"
												style="width: 35px; height: 35px; object-fit: cover; object-position: 100% 0;"
												src="<c:url value ='/resources/emp_images/${AllEmp.empPhoto }'/>"> ${AllEmp.empName } / ${AllEmp.empNo }
										</c:if>
									</c:forEach></td>
								<td class="text-center pt-3"><span class=""> <c:if
											test="${param.no eq 1 }">
											<c:if test="${eleVo.APPROVAL_LINE_COMPLETE_FLAG eq '0'}">
											처리중

												<c:forEach var="appList" items="${approList }">


													<c:if test="${appList.electronicNo == eleVo.ELECTRONIC_NO}">
														<c:if test="${appList.approvalLineCompleteFlag == 1 }">
														(승인 순서입니다.)
														</c:if>
													</c:if>
												</c:forEach>

											</c:if>
											<c:if test="${eleVo.APPROVAL_LINE_COMPLETE_FLAG eq '1'}">
											승인
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
											처리중
										</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
											승인
										</c:if>
										</c:if> <c:if test="${param.no eq 4 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
											처리중
										</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
											승인
										</c:if>
										</c:if> <c:if test="${param.no eq 6 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '0' }">
											처리중
										</c:if>
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '1' }">
											승인
										</c:if>
										</c:if> <c:if test="${param.no eq 7 }">
											<c:if test="${eleVo.ELECTRONIC_COMPLET_FLAG eq '2' }">
											반려
										</c:if>
										</c:if>

								</span></td>
								<td class="text-center pt-3"><fmt:formatDate
										value="${eleVo.ELECTRONIC_DATE }" pattern="yyyy-MM-dd / HH:mm" />
								</td>
								<!-- 반복 처리 구간 -->

							</tr>
						</c:forEach>
					</c:if>
				</tbody>

			</table>
		</div>
	</div>

	<div class="col-md-16 row justify-content-center py-4 page_wrap">
		<div class="col-sm-2 mr-0 page_nation" style="text-decoration: none;">
			<!-- 이전 블럭 -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<a class="arrow" href="#"
					onclick="pageProc(${pagingInfo.firstPage-1})"> <i
					class="fas fa-backward"></i>
				</a>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<a class="px-1 active" href="#">${i }</a>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a class="px-1" href="#" onclick="pageProc(${i})">${i }</a>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭 -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<a class="arrow" href="#"
					onclick="pageProc(${pagingInfo.lastPage+1})"> <i
					class="fas fa-forward"></i>
				</a>
			</c:if>
		</div>
	</div>

	<form name="frmSearch" method="post"
		action='<c:url value="/electronic/electronicList?no=${param.no }&recordPerPage=${param.recordPerPage }"/>'>
		<div class="col-md-12 row justify-content-center">
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeSelect">Preference</label>
				<select class="form-select" id="searchCondition"
					name="searchCondition">
					<option selected>선택하세요</option>
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
				<button type="button" class="btn btn-outline-secondary"
					id="searchBtn">검색</button>
			</div>
		</div>
	</form>

	<!-- 페이지 목록 갯수   -->
	<div class="col-md-16 row justify-content-center py-4 page_wrap">
		게시판 목록 갯수
		<div class="col-sm-2 mr-0" style="padding-right: 10px">
			<select class="form-control form-control-sm" name="searchType"
				id="listSize" onchange="page(${param.no })">
				<option value="5"
					<c:if test="${pagingInfo.getRecordCountPerPage() == 5 }">selected="selected"</c:if>>5개</option>
				<option value="10"
					<c:if test="${pagingInfo.getRecordCountPerPage() == 10 }">selected="selected"</c:if>>10개</option>
				<option value="15"
					<c:if test="${pagingInfo.getRecordCountPerPage() == 15 }">selected="selected"</c:if>>15개</option>
			</select>
		</div>
	</div>

</div>

<%@ include file="../inc/bottom.jsp"%>