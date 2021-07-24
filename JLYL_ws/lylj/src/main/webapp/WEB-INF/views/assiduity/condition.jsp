<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<!-- 달력 -->
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link
	href="<c:url value="/resources/css/assiduity/condition.css"/>"
	rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/condition.js"/>'></script>

<style>
.condition-div{
	clear: both;
	padding: 0;
}
.condition-table{
	width: 100%;
	border-top: 1px solid; 
}
.condition-th{
	border-bottom:1px solid gray;
}
.condition-td{
	border-bottom:1px solid gray;
	font-size: 13px;
	max-width: 100px;
}
.select-form{
	display: inline-block;
}
.time-text{
	width: 50px;
}
.condition-div ul{
	list-style: none;
	padding-left: 0;
}
.td-p{
	font-size: 18px;
}
</style>

<script type="text/javascript">
	$(function(){
		$('.condition-select').change(function(){
			if($(this).val()=="누적근무시간"){
				$('.select-time').prop("hidden",false);
				$('.select-name').prop("hidden",true);
			}else if($(this).val()=="부서원"){
				$('.select-time').prop("hidden",true);
				$('.select-name').prop("hidden",false);
			}else{
				$('.select-time').prop("hidden",true);
				$('.select-name').prop("hidden",true);
				
			}
		});
		
		$('#nowLeft1').click(function(){
			var now = new Date($('#nowYearMonth1').text());
			now.setDate(now.getDate()-1);
			
			conditionDate(now);
		});
		$('#nowRight1').click(function(){
			var now = new Date($('#nowYearMonth2').text());
			now.setDate(now.getDate()+1);
			
			conditionDate(now);
		});
		
	});
	
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
               		<span class="now-span" id="nowLeft1"><i class="fas fa-chevron-left"></i></span>
               		<span class="now-span" id="nowYearMonth1"></span>
               		<span class="now-span">~</span>
               		<span class="now-span" id="nowYearMonth2"></span>
               		<span class="now-span" id="nowRight1"><i class="fas fa-chevron-right"></i></span>
               		<span class="now-span" id="todayYearMonth1">오늘</span>
               </div>
               
               
               <div>
               	<ul id="ulCol">
               		<li id="liCol2">지각</li>
               		<li id="liCol1">정상</li>
               	</ul>
               </div>
               <div>
               		<select class="condition-select">
               			<option>검색조건 선택</option>
               			<option value="누적근무시간">누적근무시간</option>
               			<option value="부서원">부서원</option>
               		</select>
               		
               		<form class="select-form select-name" hidden="hidden">
               			<input type="text">
               			<button>검색</button>
               		</form> 
               		
               		<form class="select-form select-time" hidden="hidden">
	               		<input type="text" class="time-text" oninput="this.value = this.value.replace(/[^0-9]/g, '');"><span>시간</span>
	               		<select>
	               			<option>초과</option>
	               			<option>미만</option>
	               		</select>
	               		<button>검색</button>
               		</form>
               </div>
               
				<div class="condition-div">
					<table class="condition-table">
						<tr id="tableTr1">
							
						</tr>
						<c:if test="${!empty conditionSumList}">
						<c:forEach var="i" items="${conditionSumList}">
							<tr>
									<td class="condition-td">
										<p class="td-p">${i.EMP_NAME}</p>
										<ul>
											<li>${i.POSITION_NAME}</li>
											<li>${i.DEPARTMENT_NAME}</li>
										</ul>
									</td>
									<td class="condition-td">
										<c:set var="shour" value="${Math.floor(i.SUM_TIME/3600) }"/>
		        						<c:set var="smin" value="${Math.floor(i.SUM_TIME%3600/60) }"/>
		      	  						<c:set var="ssec" value="${i.SUM_TIME%3600%60 }"/>
										<p class="td-p"><fmt:formatNumber value='${shour}' pattern='##'/>h <fmt:formatNumber value='${smin}' pattern='##'/>m <fmt:formatNumber value='${ssec}' pattern='##'/>s</p>
										<ul>
											<c:set var="shour" value="${Math.floor(i.NORMAL_TIME/3600) }"/>
		        							<c:set var="smin" value="${Math.floor(i.NORMAL_TIME%3600/60) }"/>
		      	  							<c:set var="ssec" value="${i.NORMAL_TIME%3600%60 }"/>
											<li>기본:<fmt:formatNumber value='${shour}' pattern='##'/>h <fmt:formatNumber value='${smin}' pattern='##'/>m <fmt:formatNumber value='${ssec}' pattern='##'/>s</li>
											<c:set var="shour" value="${Math.floor(i.EXCESS_TIME/3600) }"/>
							        		<c:set var="smin" value="${Math.floor(i.EXCESS_TIME%3600/60) }"/>
							      	  		<c:set var="ssec" value="${i.EXCESS_TIME%3600%60 }"/>
											<li>초과:<fmt:formatNumber value='${shour}' pattern='##'/>h <fmt:formatNumber value='${smin}' pattern='##'/>m <fmt:formatNumber value='${ssec}' pattern='##'/>s</li>
										</ul>
									</td>
								<c:forEach var="addDate" begin="0" end="6">									
								<c:set var="dateCheck" value="0"/>
									<c:forEach var="j" items="${conditionList}">
										<c:if test="${nowMili+(24*60*60*addDate) == j.attendanceDayRegdate.getTime()/1000 && j.empNo==i.EMP_NO}">
											<td class="condition-td">
												<p class="td-p"><fmt:formatDate value="${j.attendanceDayOnHour}" pattern="HH:mm:dd"/> - <fmt:formatDate value="${j.attendanceDayOffHour}" pattern="HH:mm:dd"/></p>
												<ul>
													<c:set var="shour" value="${Math.floor(j.normalTimeDay/3600) }"/>
									        		<c:set var="smin" value="${Math.floor(j.normalTimeDay%3600/60) }"/>
									      	  		<c:set var="ssec" value="${j.normalTimeDay%3600%60 }"/>
													<li><fmt:formatNumber value='${shour}' pattern='##'/>h <fmt:formatNumber value='${smin}' pattern='##'/>m <fmt:formatNumber value='${ssec}' pattern='##'/>s</li>
													<c:set var="shour" value="${Math.floor(j.excessTimeDay/3600) }"/>
									        		<c:set var="smin" value="${Math.floor(j.excessTimeDay%3600/60) }"/>
									      	  		<c:set var="ssec" value="${j.excessTimeDay%3600%60 }"/>
													<li><fmt:formatNumber value='${shour}' pattern='##'/>h <fmt:formatNumber value='${smin}' pattern='##'/>m <fmt:formatNumber value='${ssec}' pattern='##'/>s</li>
												</ul>
											</td>
											<c:set var="dateCheck" value="${dateCheck+1}"/>
										</c:if>
									</c:forEach>
								<c:if test="${dateCheck==0 }">
										<td class="condition-td">
											<p class="td-p">-</p>
											<ul>
												<li>0h 0m 0s</li>
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
					</table>
				</div>

            </article>
        </div>
            <%@ include file="bottom.jsp"%>