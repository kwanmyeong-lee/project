<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<!-- 달력 -->
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

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
	border-bottom:1px solid;
}
.condition-td{
	border-bottom:1px solid;
}
.select-form{
	display: inline-block;
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
		
	});
	
	function conditionDate(date){
		var now = new Date(date);
		var dayNum= moment(now).format("d");
		
		now.setDate(now.getDate()-dayNum);
		var sDate= moment(now).format("YYYY-MM-DD");
		$('#nowYearMonth1').text(sDate);
		
		now.setDate(now.getDate()+6);
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
               		<span class="now-span" id="nowLeft"><i class="fas fa-chevron-left"></i></span>
               		<span class="now-span" id="nowYearMonth1"></span>
               		<span class="now-span">~</span>
               		<span class="now-span" id="nowYearMonth2"></span>
               		<span class="now-span" id="nowRight"><i class="fas fa-chevron-right"></i></span>
               		<span class="now-span" id="todayYearMonth">오늘</span>
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
	               		<input type="text" ><span>시간</span>
	               		<select>
	               			<option>초과</option>
	               			<option>미만</option>
	               		</select>
	               		<button>검색</button>
               		</form>
               </div>
               
				<div class="condition-div">
					<table class="condition-table">
						<tr>
							<th class="condition-th">이름</th>
							<th class="condition-th">누적근무시간</th>
							<th class="condition-th">01(일)</th>
							<th class="condition-th">01(월)</th>
							<th class="condition-th">01(화)</th>
							<th class="condition-th">01(수)</th>
							<th class="condition-th">01(목)</th>
							<th class="condition-th">01(금)</th>
							<th class="condition-th">01(토)</th>
						</tr>
						<c:forEach var="i" begin="0" end="8">
							<tr>
									<td class="condition-td">이름</td>
									<td class="condition-td">누적시간</td>
								<c:forEach var="j" begin="0" end="6">
									<td class="condition-td">a</td>
								</c:forEach>
						
							</tr>
						</c:forEach>
					</table>
				</div>

            </article>
        </div>
            <%@ include file="bottom.jsp"%>