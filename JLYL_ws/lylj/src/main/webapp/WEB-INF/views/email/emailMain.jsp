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


</script>

<!-- Begin Page Content -->
<div class="container-fluid">
	<h1 class="h3 mb-4 text-gray-800">메일</h1>

	<div class="row">
		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">안읽은 메일함</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 50%;" />
							<col style="width: 20%;" />
							<col style="width: 30%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">보낸사람</th>
								<th scope="col">보낸시간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty nrMailList}">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty nrMailList}">
								<c:forEach var="nrVo" begin="1" end="5" items="${nrMailList }">
									<tr>
										<td>${nrVo.mailTitle}</td>
										<td>${nrVo.mailSend}(${nrVo.empName})</td>
										<td><fmt:formatDate value="${nrVo.mailSenddate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
					<h6 class="m-0 font-weight-bold text-primary">중요메일함</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 50%;" />
							<col style="width: 20%;" />
							<col style="width: 30%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">보낸사람</th>
								<th scope="col">보낸시간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty itMailList}">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty itMailList}">
								<c:forEach var="itVo" begin="1" end="5" items="${itMailList }">
									<tr>
										<td>${itVo.mailTitle}</td>
										<td>${itVo.mailSend}(${itVo.empName})</td>
										<td><fmt:formatDate value="${itVo.mailSenddate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
					<h6 class="m-0 font-weight-bold text-primary">임시보관함</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 50%;" />
							<col style="width: 20%;" />
							<col style="width: 30%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">받는사람</th>
								<th scope="col">저장시간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty tpMailList}">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty tpMailList}">
								<c:forEach var="tpVo" begin="1" end="5" items="${tpMailList }">
									<tr>
										<td>${tpVo.mailTitle}</td>
										<td>${tpVo.mailTake}(${tpVo.empName})</td>
										<td><fmt:formatDate value="${tpVo.mailSenddate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
					<h6 class="m-0 font-weight-bold text-primary">예약메일</h6>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<colgroup>
							<col style="width: 55%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">받는사람</th>
								<th scope="col">작성시간</th>
								<th scope="col">예약시간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty rvMailList}">
								<tr>
									<td colspan="4">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty rvMailList}">
								<c:forEach var="rvVo" begin="1" end="5" items="${rvMailList }">
									<tr>
										<td>${rvVo.mailTitle}</td>
										<td>${rvVo.mailTake}(${tpVo.empName})</td>
										<td><fmt:formatDate value="${rvVo.mailSenddate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
