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
.bt_more{
float: right; font-size: 0.8em; width: 60px; height: 30px; text-align: center;
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
					<h6 class="m-0 font-weight-bold text-primary" style="float: left;">안읽은 메일함</h6>
					<a href="<c:url value='/email/emailList?empNo=${empNo }&type=6'/>"><input type="button" class="btn btn-secondary bt_more" value="더보기"></a>
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
								<c:forEach var="nrVo" items="${nrMailList }">
									<tr>
										<td><a style="text-decoration: none; color: #858796; " href="<c:url value='/email/emailDetail?mailNo=${nrVo.mailNo }'/>">${nrVo.mailTitle}</a></td>
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
					<h6 class="m-0 font-weight-bold text-primary" style="float: left;">중요메일함</h6>
					<a href="<c:url value='/email/emailList?empNo=${empNo }&type=7'/>"><input type="button" class="btn btn-secondary bt_more" value="더보기"></a>
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
								<c:forEach var="itVo" begin="0" end="5" items="${itMailList }">
									<tr>
										<td><a style="text-decoration: none; color: #858796; " href="<c:url value='/email/emailDetail?mailNo=${itVo.mailNo }'/>">${itVo.mailTitle}</a></td>
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
					<h6 class="m-0 font-weight-bold text-primary" style="float: left;">임시보관함</h6>
					<a href="<c:url value='/email/emailList?empNo=${empNo }&type=3'/>"><input type="button" class="btn btn-secondary bt_more" value="더보기"></a>
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
								<th scope="col">보낸시간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty tpMailList }">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty tpMailList }">
								<c:forEach var="tpVo" items="${tpMailList}">
									<tr>
										<td><a style="text-decoration: none; color: #858796; " href="<c:url value='/email/emailDetail?mailNo=${tpVo.mailNo }'/>">${tpVo.mailTitle}</a></td>
										<td>${tpVo.mailTake}</td>
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
					<h6 class="m-0 font-weight-bold text-primary" style="float: left;">예약메일함</h6>
					<a href="<c:url value='/email/emailList?empNo=${empNo }&type=4'/>"><input type="button" class="btn btn-secondary bt_more" value="더보기"></a>
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
								<th scope="col">예약시간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty rvMailList}">
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty rvMailList}">
								<c:forEach var="rvVo" items="${rvMailList }">
									<tr>
										<td>${rvVo.mailTitle}</td>
										<td>${rvVo.mailTake}</td>
										<td><fmt:formatDate value="${rvVo.mailReserve }" pattern="yyyy-MM-dd HH:mm"/></td>
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
