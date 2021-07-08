<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>


<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">어서오세요 *** 님</h1>

	<div class="row">

		<div class="col-lg-6">

			<!-- Circle Buttons -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
				</div>
				<div class="card-body">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover " id="dataTable"
								width="100%" cellspacing="0">
								<colgroup>
									<col style="width: 60%;" />
									<col style="width: 20%;" />
									<col style="width: 20%;" />
								</colgroup>
								<thead class="table-success">
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th><a href="#">월요일 식단표</a></th>
										<th>김부장</th>
										<th>2021-07-08</th>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th><a href="#">금요일 식단표</a></th>
										<th>김부장</th>
										<th>2021-07-08</th>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th><a href="#">수요일 식단표</a></th>
										<th>김부장</th>
										<th>2021-07-08</th>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<th><a href="#">내일 식단표</a></th>
										<th>김부장</th>
										<th>2021-07-08</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- Brand Buttons -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">오늘 받은 메일</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<tbody>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 60%;" />
								<col style="width: 20%;" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th scope="col">보낸 사람</th>
									<th scope="col">제목</th>
									<th scope="col">보낸 날짜</th>
								</tr>
							</thead>
							<tr>
								<td class="name">Larry Gardner</td>
								<td class="subject"><a href="#">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit, sed </a></td>
								<td class="time">08:30 PM</td>
							</tr>
							<tr>
								<td class="name">Larry Gardner</td>
								<td class="subject"><a href="#">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit, sed </a></td>
								<td class="time">08:30 PM</td>
							</tr>
							<tr>
								<td class="name">Larry Gardner</td>
								<td class="subject"><a href="#">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit, sed </a></td>
								<td class="time">08:30 PM</td>
							</tr>
							<tr>
								<td class="name">Larry Gardner</td>
								<td class="subject"><a href="#">Lorem ipsum dolor sit
										amet, consectetur adipisicing elit, sed </a></td>
								<td class="time">08:30 PM</td>
							</tr>

							</tbody>

						</table>
					</div>
				</div>
			</div>

		</div>

		<div class="col-lg-6">

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">오늘의 예약</h6>
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
								<th scope="col">예약 내용</th>
								<th scope="col">예약 대상</th>
								<th scope="col">예약 날짜</th>
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
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">오늘의 일정</h6>
				</div>
				<div class="card-body">
					<h1>달력을 넣으면 좋알거같은데 모르겠음</h1>
				</div>
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">대대장님 전달사항</h6>
				</div>
				<div class="card-body"></div>
			</div>

		</div>

	</div>

</div>
<!-- /.container-fluid -->


<%@ include file="inc/bottom.jsp"%>
