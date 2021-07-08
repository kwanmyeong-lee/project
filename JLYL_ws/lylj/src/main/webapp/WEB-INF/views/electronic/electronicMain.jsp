<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top_2.jsp"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	<script type="text/javascript">
	$(function(){
		$('#testBotton').click(function(){ 
			$('#accordionSidebar').html('');
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
							<tr>
								<td>아좀 빌려줘요</td>
								<td>관명</td>
								<td>2021-10-11</td>
							</tr>
							<tr>
								<td>이래도 안빌려줘?</td>
								<td>기성</td>
								<td>2021-12-11</td>
							</tr>
							<tr>
								<td>제발 !!!!</td>
								<td>혁</td>
								<td>2021-09-11</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">결재 진행 목록</h6>
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
							<tr>
								<td>아좀 빌려줘요</td>
								<td>돈</td>
								<td>2021-10-11</td>
							</tr>
							<tr>
								<td>이래도 안빌려줘?</td>
								<td>너의 지갑</td>
								<td>2021-12-11</td>
							</tr>
							<tr>
								<td>제발 !!!!</td>
								<td>너의 카드</td>
								<td>2021-09-11</td>
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
							<tr>
								<td>아좀 빌려줘요</td>
								<td>돈</td>
								<td>2021-10-11</td>
							</tr>
							<tr>
								<td>이래도 안빌려줘?</td>
								<td>너의 지갑</td>
								<td>2021-12-11</td>
							</tr>
							<tr>
								<td>제발 !!!!</td>
								<td>너의 카드</td>
								<td>2021-09-11</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>


</div>
<!-- /.container-fluid -->


<%@ include file="../inc/bottom_2.jsp"%>
