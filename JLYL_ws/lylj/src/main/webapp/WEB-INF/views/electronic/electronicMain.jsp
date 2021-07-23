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
<script type="text/javascript">
	$(function() {
		$('#newDocument').click(
				function() {
					open('<c:url value="/electronic/documentSelect"/>',
							'documentSelect', 'width=800,height=500');
				});
	});
</script>

<!-- Begin Page Content -->
<div class="container-fluid">
	<h1 class="h3 mb-4 text-gray-800">전자 결재</h1>

	<div class="row">
		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">전자결재 대기함</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 60%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">기안자</th>
								<th scope="col">기안 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty ListAp }">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty ListAp }">
								<c:forEach var="ap" items="${ListAp }">
									<tr>
										<td>${ap.ELECTRONIC_TITLE }</td>
										<td>${ap.EMP_NO }</td>
										<td><fmt:formatDate value="${ap.ELECTRONIC_DATE }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재 수신 목록</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 60%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">기안자</th>
								<th scope="col">기안 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty ListRe }">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty ListRe }">
								<c:forEach var="re" items="${ListRe }">
									<tr>
										<td>${re.ELECTRONIC_TITLE }</td>
										<td>${re.EMP_NO }</td>
										<td><fmt:formatDate value="${re.ELECTRONIC_DATE }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재 완료 목록</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 60%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">기안자</th>
								<th scope="col">기안 날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty ListFi }">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty ListFi }">
								<c:forEach var="fi" items="${ListFi }">
									<tr>
										<td>${fi.ELECTRONIC_TITLE }</td>
										<td>${fi.EMP_NO }</td>
										<td><fmt:formatDate value="${fi.ELECTRONIC_DATE }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>


</div>
<!-- /.container-fluid -->


<%@ include file="../inc/bottom.jsp"%>
