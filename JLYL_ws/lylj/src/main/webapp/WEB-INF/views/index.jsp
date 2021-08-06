<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<link href='<c:url value="/resources/css/main.css"/>' rel="stylesheet" />
<script src='<c:url value="/resources/js/main.js"/>'></script>
<script src='<c:url value="/resources/js/scheduleMain.js"/>'></script>
<style>
#calendar{
max-height: 500px;
}
</style>
<script type="text/javascript">
	function getCookie() { 
		var cookie = document.cookie; 
		var empNo =${empNo};
		var birthEmpNo ="birthYN"+empNo;
		if (document.cookie != "") { 
			var cookie_array = cookie.split("; "); 
			for ( var index in cookie_array) { 
				var cookie_name = cookie_array[index].split("="); 
				if (cookie_name[0] == birthEmpNo) { 
					return cookie_name[1]; 
				} 
			} 
		} 
		return ; 
	} 
	
	function birthDay() { 
		var empBirth = new Date($('#empBirth').val());
		var empMonth = empBirth.getMonth();
		var empday = empBirth.getDate();
		
		var nowDate = new Date();
		var month = nowDate.getMonth();
		var day = nowDate.getDate();

		if(empMonth===month && empday===day){
			var cookieCheck = getCookie();
			if (cookieCheck != "N"){
				window.open("birthDay","birthDay","width=600,height=500,toolbar=no,scrollbars=no");
		
			}
		}
	}


window.onload= function(){
	birthDay();
}
	
</script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">어서오세요 ${empName} 님</h1>
	<input type="hidden"  value='<fmt:formatDate value="${empVO.empBirth }" pattern="yyyy-MM-dd"/>' id="empBirth">

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
									<c:if test="${empty notice }">
										<tr>
											<td colspan="3" style="text-align: center;">등록된 공지사항이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty notice }">
										<c:forEach var="notice" items="${notice }">
											<tr>
												<th>
											        <a href="<c:url value='/board/countUpdate?boardNo=${notice.boardNo }'/>" >
											        	<c:if test="${fn:length(notice.boardTitle) > 30 }">
											        		${fn:substring(notice.boardTitle,0, 30)}...
											        	</c:if>
											        	<c:if test="${fn:length(notice.boardTitle) < 31 }">
											        		${notice.boardTitle }
											        	</c:if>
											        </a>
											    </th>
												<td>${notice.boardWriter }</td>
												<td><fmt:formatDate value="${notice.boardDate }" pattern="yyyy-MM-dd"/></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- Brand Buttons -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">안읽은 메일함</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<tbody>
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 50%;" />
								<col style="width: 30%;" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th scope="col">보낸 사람</th>
									<th scope="col">제목</th>
									<th scope="col">보낸 날짜</th>
								</tr>
							</thead>
								<c:if test="${empty emailVo }">
									<tr>
										<td colspan="3" style="text-align: center;">모두 읽으셨습니다.</td>
									</tr>
								</c:if>
								<c:if test ="${!empty emailVo }">
									<c:forEach var="list" items="${emailVo }">
										<tr>
											<td>${list.mailSend}</td>
											<td>
												<a href="<c:url value='/email/emailDetail?mailNo=${list.mailNo }'/>">
													<c:if test="${fn:length(list.mailTitle)>20}">
														${fn:substring(list.mailTitle,0,20)}...
													</c:if>
													<c:if test="${fn:length(list.mailTitle)<21}">
														${list.mailTitle}
													</c:if>
												</a>
											</td>
											<td><fmt:formatDate value="${list.mailSenddate}" pattern="yyyy-MM-dd HH:mm"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>

						</table>
					</div>
				</div>
			</div>
			
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">최근 받은 기안서</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<tbody>
							<colgroup>
								<col style="width: 60%;" />
								<col style="width: 40%;" />
							</colgroup>
							<thead class="table-info">
								<tr>
									<th scope="col">제목</th>
									<th scope="col">기안자</th>
								</tr>
							</thead>
							<c:if test="${empty elist }">
								<tr>
									<td class="name" colspan="2">최근 받은 기안서가 없습니다</td>
								</tr>
							</c:if>
							<c:if test="${!empty elist}">
								<c:forEach var="ele" items="${elist }">
									<tr>
										<td class="subject"><a href="<c:url value = '/electronic/electronicDetail?ElectronicNo='/>${ele.electronicNo }&no=1">${ele.electronicTitle } </a></td>
										<td class="name">
											<c:forEach var="AllEmp" items="${allEmp }">
												<c:if test="${ele.empNo eq AllEmp.empNo}">
													<img class="rounded-circle" style="width: 35px; height: 35px; object-fit: cover; object-position: 100% 0;" src="<c:url value ='/resources/emp_images/${AllEmp.empPhoto }'/>"> ${AllEmp.empName } / ${AllEmp.empNo }
												</c:if>
											</c:forEach>
										
									</td>
									</tr>
								</c:forEach>
							</c:if>
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
								<th scope="col">자산명</th>
								<th scope="col">예약한 날짜</th>
							</tr>
						</thead>
						<tbody id="bookingTBody">
							<c:if test="${bookingList.size() !=0 }">
								<c:set var="checkNum" value="0"/>
								<c:forEach var="i" begin="0" end="2">
									<c:if test="${bookingList.size()>i}">
										<tr>
											<td>${bookingList.get(i).bookingContent}</td>
											<td>${bookingList.get(i).bookingTargetName}</td>
											<td><fmt:formatDate value="${bookingList.get(i).bookingCurrent}" pattern="yyyy-MM-dd"/> </td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${bookingList.size() ==0 }">
								<tr>
									<td colspan="3" align="center">금일 예약 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>

				</div>
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">오늘의 일정</h6>
				</div>
				<div class="card-body cal-body">
					<div id='calendar'></div>
				</div>
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">지역별 날씨</h6>
				</div>
				<div class="card-body">
				<%@ include file="mainWeather.jsp"%>
				</div>
			</div>

		</div>

	</div>

</div>
<!-- /.container-fluid -->


<%@ include file="inc/bottom.jsp"%>
