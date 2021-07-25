<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<!-- 달력 -->
<script
	src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="<c:url value="/resources/css/assiduity/condition.css"/>"
	rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/condition.js"/>'></script>

<style>
.condition-div {
	clear: both;
	padding: 0;
}

.condition-table {
	width: 100%;
	border-top: 1px solid;
}

.condition-th {
	border-bottom: 1px solid gray;
}

.condition-td {
	border-bottom: 1px solid gray;
	font-size: 13px;
	max-width: 100px;
}

.condition-td2 {
	max-width: 50px;
}

.select-form {
	display: inline-block;
}

.time-text {
	width: 50px;
}

.condition-div ul {
	list-style: none;
	padding-left: 0;
}

.td-p {
	font-size: 18px;
}
</style>

<script type="text/javascript">
	$(function(){
		$('.condition-select').change(function(){
			if($(this).val()=="1"){
				$('.select-time').prop("hidden",false);
				$('.select-name').prop("hidden",true);
			}else if($(this).val()=="2"){
				$('.select-time').prop("hidden",true);
				$('.select-name').prop("hidden",false);
			}else{
				$('.select-time').prop("hidden",true);
				$('.select-name').prop("hidden",true);
				conditionMonthViewAjax();
			}
			$('#txTime').val('');
			$('#txName').val('');
		});
		
		$('#nowLeft1').click(function(){
			var now = new Date($('#nowYearMonth1').text());
			now.setDate(now.getDate()-1);
			
			conditionDate(now);
			conditionMonthViewAjax();
		});
		
		$('#nowRight1').click(function(){
			var now = new Date($('#nowYearMonth2').text());
			now.setDate(now.getDate()+1);
			
			conditionDate(now);
			conditionMonthViewAjax();
		});
		$('#todayYearMonth1').click(function(){
			var now = new Date();
			
			conditionDate(now);
			conditionMonthViewAjax();
		});
		
		$('.search-bt').click(function(){
			conditionMonthViewAjax();
		});
		
	});
	
	function conditionMonthViewAjax(){
		var selectDate=$('#nowYearMonth2').text();
		var departmentNo=${departmentNo};
		var selectNum = $('.condition-select').val();
		var timeNum = $('#timeNum').val();
		var searchKeyword=0;
		if(selectNum=='2'){
			searchKeyword=$('#txName').val();
		}else if(selectNum=='1'){
			searchKeyword=$('#txTime').val();
		}else{
			searchKeyword="";
		}
		
		console.log("selectNum:"+selectNum+" timeNum:"+timeNum+" searchKeyword:"+searchKeyword);
		$.ajax({
			type:"get",
			url:"conditionMonthView",
			data:{departmentNo:departmentNo,
				selectDate: selectDate,
				selectNum : selectNum,
				timeNum : timeNum,
				searchKeyword :searchKeyword},
			dataType:"json",
			success: function(data){
				var str='';
				var startDate=$('#nowYearMonth1').text();
				if(data.conditionSumList.length!=0){
					for(var i=0; i<data.conditionSumList.length; i++){
						str+='<tr><td class="condition-td" scope="col"><p class="td-p">';
						str+=data.conditionSumList[i].EMP_NAME;
						str+='</p><ul><li>';
						str+=data.conditionSumList[i].POSITION_NAME;
						str+='</li><li>';
						str+=data.conditionSumList[i].DEPARTMENT_NAME;
						str+='</li></ul></td>';
						str+='<td class="condition-td" scope="col">';
						hour =Math.floor(data.conditionSumList[i].SUM_TIME/3600);
						min =Math.floor(data.conditionSumList[i].SUM_TIME%3600/60);
						sec =Math.floor(data.conditionSumList[i].SUM_TIME%3600%60);
						str+='<p class="td-p">'+hour+'h '+min+'m '+sec+'s</p><ul>';
						hour =Math.floor(data.conditionSumList[i].NORMAL_TIME/3600);
						min =Math.floor(data.conditionSumList[i].NORMAL_TIME%3600/60);
						sec =Math.floor(data.conditionSumList[i].NORMAL_TIME%3600%60);
						str+='<li>기본:'+hour+'h '+min+'m '+sec+'s</li>';
						hour =Math.floor(data.conditionSumList[i].EXCESS_TIME/3600);
						min =Math.floor(data.conditionSumList[i].EXCESS_TIME%3600/60);
						sec =Math.floor(data.conditionSumList[i].EXCESS_TIME%3600%60);
						str+='<li>초과:'+hour+'h '+min+'m '+sec+'s</li></ul></td>';
						
						for(var k=0; k<=6; k++){
							var dateCheck =0;
					
							var nowMili = new Date(startDate+"T00:00:00").getTime()/1000;
							for(var j=0; j<data.conditionList.length; j++){
								var nowSec = Number(nowMili)+Number(24*60*60*k);
								if(nowSec
										== new Date(data.conditionList[j].attendanceDayRegdate).getTime()/1000
										&& data.conditionList[j].empNo == data.conditionSumList[i].EMP_NO){
									if(nowSec+(10*60*60)<new Date(data.conditionList[j].attendanceDayOnHour).getTime()/1000){
										str+='<td class="condition-td" scope="col"><p class="td-p" style="color:#f14f4f">';
									}else{
										str+='<td class="condition-td" scope="col"><p class="td-p">';
									}
									var onHour= moment(new Date(data.conditionList[j].attendanceDayOnHour)).format('HH:mm:ss');
									var offHour= moment(new Date(data.conditionList[j].attendanceDayOffHour)).format('HH:mm:ss');
									str+=onHour+'-'+offHour+'</p><ul>';
									hour =Math.floor(data.conditionList[j].normalTimeDay/3600);
									min =Math.floor(data.conditionList[j].normalTimeDay%3600/60);
									sec =Math.floor(data.conditionList[j].normalTimeDay%3600%60);
									str+='<li>기본:'+hour+'h '+min+'m '+sec+'s</li>';
									hour =Math.floor(data.conditionList[j].excessTimeDay/3600);
									min =Math.floor(data.conditionList[j].excessTimeDay%3600/60);
									sec =Math.floor(data.conditionList[j].excessTimeDay%3600%60);
									str+='<li>초과:'+hour+'h '+min+'m '+sec+'s</li></ul></td>';
									dateCheck++;
								}
							}
							if(dateCheck==0){
								str+='<td class="condition-td" scope="col"><p class="td-p">-</p><ul><li>-</li><li>-</li></ul></td>';
							}
						}
						str+='</tr>';
					}
				}else{
					str+='<tr><td colspan="9" align="center">정보 없음</td></tr>';
				}
				$('#conTBody').html(str);
				
			}
		});
	}
	function conditionDate(date){
		var now = new Date(date);
		var dayNum= moment(now).format("d");
		
		now.setDate(now.getDate()-dayNum);
		var sDate= moment(now).format("YYYY-MM-DD");
		$('#nowYearMonth1').text(sDate);
		
		var weekDay=['일','월','화','수','목','금','토'];
		var str ='<th class="condition-th">이름</th>';
		str+='<th class="condition-th">누적근무시간</th>';
		
		for(var i=0; i<7; i++){
			var days= moment(now).format("DD");
			var dayNo= moment(now).format("d");
			str+='<th class="condition-th">'+days+weekDay[dayNo]+'</th>';
			now.setDate(now.getDate()+1);
		}
		
		$('#tableTr1').html(str);
		$('#tableTr1').children().eq(2).css("color","#ff9898");
		$('#tableTr1').children().eq(8).css("color","#8ba5f3");
		
		
		now.setDate(now.getDate()-1);
		var eDate= moment(now).format("YYYY-MM-DD");
		$('#nowYearMonth2').text(eDate);
		
	}
	
	
	var nowDates= new Date();
	window.onload= function(){
		Clock();
		NowYD();
		dayView(nowDates);
		conditionDate(nowDates);
	}
</script>
<title>assiduitygMain</title>
<div>
	<article>
		<h3>근태현황</h3>
		<div class="now-div text-center">
			<span class="now-span" id="nowLeft1"><i
				class="fas fa-chevron-left"></i></span> <span class="now-span"
				id="nowYearMonth1"></span> <span class="now-span">~</span> <span
				class="now-span" id="nowYearMonth2"></span> <span class="now-span"
				id="nowRight1"><i class="fas fa-chevron-right"></i></span> <span
				class="now-span" id="todayYearMonth1">오늘</span>
		</div>


		<div>
			<ul id="ulCol">
				<li id="liCol2">지각</li>
				<li id="liCol1">정상</li>
			</ul>
		</div>
		<div>
			<select class="condition-select">
				<option value="0">검색조건 선택</option>
				<option value="1">누적근무시간</option>
				<option value="2">부서원</option>
			</select>

			<form class="select-form select-name" hidden="hidden">
				<input type="text" id="txName">
				<button type="button" class="search-bt">검색</button>
			</form>

			<form class="select-form select-time" hidden="hidden">
				<input type="text" class="time-text" id="txTime"
					oninput="this.value = this.value.replace(/[^0-9]/g, '');"><span>시간</span>
				<select id="timeNum">
					<option value="1">초과</option>
					<option value="2">미만</option>
				</select>
				<button type="button" class="search-bt">검색</button>
			</form>
		</div>

		<div class="condition-div">
			<table class="condition-table">
				<colgroup>
					<col style="width: 6%;" />
					<col style="width: 10%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
					<col style="width: 12%;" />
				</colgroup>
				<tr id="tableTr1">

				</tr>
				<tbody id="conTBody">
				<c:if test="${!empty conditionSumList}">
					<c:forEach var="i" items="${conditionSumList}">
						<tr>
							<td class="condition-td" scope="col">
								<p class="td-p">${i.EMP_NAME}</p>
								<ul>
									<li>${i.POSITION_NAME}</li>
									<li>${i.DEPARTMENT_NAME}</li>
								</ul>
							</td>
							<td class="condition-td" scope="col"><c:set var="shour"
									value="${Math.floor(i.SUM_TIME/3600) }" /> <c:set var="smin"
									value="${Math.floor(i.SUM_TIME%3600/60) }" /> <c:set var="ssec"
									value="${i.SUM_TIME%3600%60 }" />
								<p class="td-p">
									<fmt:formatNumber value='${shour}' pattern='##' />
									h
									<fmt:formatNumber value='${smin}' pattern='##' />
									m
									<fmt:formatNumber value='${ssec}' pattern='##' />
									s
								</p>
								<ul>
									<c:set var="shour" value="${Math.floor(i.NORMAL_TIME/3600) }" />
									<c:set var="smin" value="${Math.floor(i.NORMAL_TIME%3600/60) }" />
									<c:set var="ssec" value="${i.NORMAL_TIME%3600%60 }" />
									<li>기본:<fmt:formatNumber value='${shour}' pattern='##' />h
										<fmt:formatNumber value='${smin}' pattern='##' />m <fmt:formatNumber
											value='${ssec}' pattern='##' />s
									</li>
									<c:set var="shour" value="${Math.floor(i.EXCESS_TIME/3600) }" />
									<c:set var="smin" value="${Math.floor(i.EXCESS_TIME%3600/60) }" />
									<c:set var="ssec" value="${i.EXCESS_TIME%3600%60 }" />
									<li>초과:<fmt:formatNumber value='${shour}' pattern='##' />h
										<fmt:formatNumber value='${smin}' pattern='##' />m <fmt:formatNumber
											value='${ssec}' pattern='##' />s
									</li>
								</ul></td>
							<c:forEach var="addDate" begin="0" end="6">
								<c:set var="dateCheck" value="0" />
								<c:forEach var="j" items="${conditionList}">
									<c:if
										test="${nowMili+(24*60*60*addDate) == j.attendanceDayRegdate.getTime()/1000 && j.empNo==i.EMP_NO}">
										<td class="condition-td" scope="col">
										<c:choose>
										<c:when test="${nowMili+(24*60*60*addDate)+10*60*60 < j.attendanceDayOnHour.getTime()/1000}">
											<p class="td-p" style="color:#f14f4f">
												<fmt:formatDate value="${j.attendanceDayOnHour}"
													pattern="HH:mm:dd" />
												-
												<fmt:formatDate value="${j.attendanceDayOffHour}"
													pattern="HH:mm:dd" />
											</p>
										</c:when>
										<c:otherwise>
											<p class="td-p">
												<fmt:formatDate value="${j.attendanceDayOnHour}"
													pattern="HH:mm:dd" />
												-
												<fmt:formatDate value="${j.attendanceDayOffHour}"
													pattern="HH:mm:dd" />
											</p>
										</c:otherwise>
										</c:choose>
											
											<ul>
												<c:set var="shour"
													value="${Math.floor(j.normalTimeDay/3600) }" />
												<c:set var="smin"
													value="${Math.floor(j.normalTimeDay%3600/60) }" />
												<c:set var="ssec" value="${j.normalTimeDay%3600%60 }" />
												<li>기본:<fmt:formatNumber value='${shour}' pattern='##' />h
													<fmt:formatNumber value='${smin}' pattern='##' />m <fmt:formatNumber
														value='${ssec}' pattern='##' />s</li>
												<c:set var="shour"
													value="${Math.floor(j.excessTimeDay/3600) }" />
												<c:set var="smin"
													value="${Math.floor(j.excessTimeDay%3600/60) }" />
												<c:set var="ssec" value="${j.excessTimeDay%3600%60 }" />
												<li>초과:<fmt:formatNumber value='${shour}' pattern='##' />h
													<fmt:formatNumber value='${smin}' pattern='##' />m <fmt:formatNumber
														value='${ssec}' pattern='##' />s</li>
											</ul>
										</td>
										<c:set var="dateCheck" value="${dateCheck+1}" />
									</c:if>
								</c:forEach>
								<c:if test="${dateCheck==0 }">
									<td class="condition-td" scope="col">
										<p class="td-p">-</p>
										<ul>
											<li>-</li>
											<li>-</li>
										</ul>
									</td>
								</c:if>
							</c:forEach>

						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty conditionSumList}">
					<tr>
						<td colspan="9" align="center">정보 없음</td>
					</tr>
				</c:if>
				</tbody>
			</table>
		</div>

	</article>
</div>
<%@ include file="bottom.jsp"%>