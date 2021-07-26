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
							<col style="width: 60%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">보낸사람</th>
								<th scope="col">보낸시간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3">항목이 없습니다.</td>
							</tr>
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
							<col style="width: 60%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">보낸사람</th>
								<th scope="col">보낸시간</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
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
							<col style="width: 60%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
						</colgroup>
						<thead class="table-primary">
							<tr>
								<th scope="col">제목</th>
								<th scope="col">받는사람</th>
								<th scope="col">저장시간</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td colspan="3">항목이 없습니다.</td>
								</tr>
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
								<th scope="col">수신자</th>
								<th scope="col">작성시간</th>
								<th scope="col">예약시간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4">항목이 없습니다.</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>


</div>
<!-- /.container-fluid -->


<%@ include file="../inc/bottom.jsp"%>
