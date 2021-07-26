<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link
	href="<c:url value="/resources/css/assiduity/top.css"/>"
	rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/top.js"/>'></script>

<style>
.ann-div{
	clear: both;
}
.ann-table{
	width: 100%;
	border: 1px solid;
}	
.ann-th{
	border-bottom: 1px solid;
}
.ann-td{
	border-bottom: 1px solid;
}

/* stats-terms */
.stats-terms2{
	display: none;
}
.stats-check{
	position: absolute;
	background-color: white;
	box-shadow: 0px 0px 5px 2px #62b0cb;
	display: none;
}
.check-span:hover{
	cursor: pointer;
}
#checkDiv2{
	margin-left: 108px;
}

</style>

<script type="text/javascript">
	$(function(){
		$(document).on("click",'html',function(e){ 
			if($('.stats-check1').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch1') && !$(e.target).hasClass('stats-terms')) { 
					$('#checkDiv1').hide();

				} 
			}
			if($('.stats-check2').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch2') && !$(e.target).hasClass('st-tr2')) { 
					$('#checkDiv2').hide();

				} 
			}
			if($('.stats-check3').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch3') && !$(e.target).hasClass('st-tr3')) { 
					$('#checkDiv3').hide();

				} 
			}
			if($('.stats-check4').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch4') && !$(e.target).hasClass('st-tr4') && !$(e.target).hasClass('ui-datepicker') && !$(e.target).hasClass('ui-datepicker-calendar') ) { 
					$('#checkDiv4').hide();

				} 
			}
		});
		
		$('#termsBtn1').click(function(){
			$('#checkDiv1').toggle();
		});
		
		$('.check-span1').click(function(){
			if($(this).prev('.check-box1').prop("checked")==false){
				$(this).prev('.check-box1').prop("checked",true);
			}else{
				$(this).prev('.check-box1').prop("checked",false);
			}
			$('#termsBtn2').toggle();
		});
		
		$('.check-box1').change(function(){
			$('#termsBtn2').toggle();
		});
		
		$('#termsBtn2').click(function(){
			$('#checkDiv2').toggle();
		});
		$('.check-span2').click(function(){
			if($(this).prev('.check-box2').prop("checked")==false){
				$(this).prev('.check-box2').prop("checked",true);
			}else{
				$(this).prev('.check-box2').prop("checked",false);
			}
			$('#termsBtn3').toggle();
		});
		
		$('.check-box2').change(function(){
			$('#termsBtn3').toggle();
		});
		
		$('#termsBtn3').click(function(){
			var x = $(this).offset().left;
			var y = $(this).offset().top+$(this).outerHeight();
			$('#checkDiv3').css("top",y);
			$('#checkDiv3').css("left",x);
			$('#checkDiv3').toggle();
		});
		
		$('#termsBtn4').click(function(){
			var x = $(this).offset().left+"px";
			var y = $(this).offset().top+$(this).outerHeight()+"px";
			$('#checkDiv4').css("top",y);
			$('#checkDiv4').css("left",x);
			$('#checkDiv4').toggle();
			
		});
		$('.check-span3').click(function(){
			if($(this).prev('.check-box3').prop("checked")==false){
				$(this).prev('.check-box3').prop("checked",true);
			}else{
				$(this).prev('.check-box3').prop("checked",false);
			}
			$('#termsBtn4').toggle();
		});
		
		$('.check-box3').change(function(){
			$('#termsBtn4').toggle();
		});
		
		$('#btName').click(function(){
			var searchEmpText = $("#searchEmp").val();
			$('#termsBtn2').text("부서원: "+searchEmpText);
			$('#sEmp').val(searchEmpText);
			
			statsViewAjax();
		});
		$('#btDepart').click(function(){
			var searchDepartText = $("#searchDepart").val();
			$('#termsBtn3').text("부서명: "+searchDepartText);
			$('#sDepart').val(searchDepartText);
			
			statsViewAjax();
			
		});
		$('#btDate').click(function(){
			var startDateText = $('#startDate').val();
			var endDateText = $('#endDate').val();
			$('#termsBtn4').text("날짜: "+startDateText+" - "+endDateText);
			$('#sDate').val(startDateText);
			$('#eDate').val(endDateText);
			
			statsViewAjax();
					
			
		});
		
		$('#nowLeft').click(function(){
			var nd = new Date($('#nowYearMonth').text());
			var pd = MinusMonth(nd);
			var pd1 = moment(pd).format("YYYY-MM-DD");
			pd= moment(pd).format("YYYY-MM");
			
			$('#nowYearMonth').text(pd);
			$('#sDate').val("");
			$('#eDate').val("");
			$('#termsBtn4').text("날짜:");
			
			statsViewAjax();
		});
		
		$('#nowRight').click(function(){
			var nd = new Date($('#nowYearMonth').text());
			var pd = AddMonth(nd);
			var pd1 = moment(pd).format("YYYY-MM-DD");
			pd= moment(pd).format("YYYY-MM");
			
			$('#nowYearMonth').text(pd);
			$('#sDate').val("");
			$('#eDate').val("");
			$('#termsBtn4').text("날짜:");
			statsViewAjax();
			
		});
		$('#todayYearMonth').click(function(){
			NowYD();
			$('#sDate').val("");
			$('#eDate').val("");
			$('#termsBtn4').text("날짜:");
			statsViewAjax();
			
		});
		
		
		
		
		$.datepicker.setDefaults({
			
			closeText : "닫기",
			currentText : "오늘",
			prevText : '이전 달',
			nextText : '다음 달',
			showOtherMonths: true,
			showMonthAfterYear:true,
			changeYear:false,
			changeMonth:false,
			stepMonths: '0',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
					'8월', '9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			weekHeader : "주",
			yearSuffix : '년',
			dateFormat:'yy-mm-dd'
		});
		
		$('#startDate').datepicker();
		$('#startDate').datepicker("setDate","today");
		
		$('#endDate').datepicker();
		$('#endDate').datepicker("setDate","today");
	
		$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );		
		$('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#endDate").datepicker( "option", "minDate", selectedDate );
	    });

		
	});
	
	
	function statsViewAjax(){
		var selectItem1 =0;
		var selectItem2 =0;
		var selectItem3 =0;
	
		if($("#termsBtn2").css("display")=="inline-block"){
			selectItem1=1;
		}	
		if($("#termsBtn3").css("display")=="inline-block"){
			selectItem2=1;
		}	
		if($("#termsBtn4").css("display")=="inline-block"){
			selectItem3=1;
		}
		var searchEmp = $('#sEmp').val();
		var searchDepart = $('#sDepart').val();
		var startDate = $('#sDate').val();
		var endDate = $('#eDate').val();
		var selectDate =$('#nowYearMonth').text()+"-01";
		
		
		
		$.ajax({
			type:"get",
			url:"statsView",
			data:{selectItem1 : selectItem1,
				selectItem2: selectItem2,
				selectItem3 : selectItem3,
				searchEmp : searchEmp,
				searchDepart :searchDepart,
				startDate :startDate,
				endDate :endDate,
				selectDate : selectDate
			},
			dataType:"json",
			success: function(data){
				var str = "";
				var comeNum=0;
				var leaveNum=0;
				var absenceNum =0;
				var excessNum=0;
				if(data.conditionList.length>0){
					for(var i=0; i<data.conditionList.length;i++){
						str +='<tr>';
						str +='<td class="ann-td">'+data.conditionList[i].empName+'</td>';
						str +='<td class="ann-td">'+data.conditionList[i].departmentName+'</td>';
						str +='<td class="ann-td">'+moment(data.conditionList[i].attendanceDayRegdate).format("YYYY-MM-DD")+'</td>';
						str +='<td class="ann-td">'+moment(data.conditionList[i].attendanceDayOnHour).format("HH:mm:ss")+'</td>';
						str +='<td class="ann-td">'+moment(data.conditionList[i].attendanceDayOffHour).format("HH:mm:ss")+'</td>';
						str +='</tr>';
						var reg = new Date(data.conditionList[i].attendanceDayRegdate);
						var reg = new Date(data.conditionList[i].attendanceDayRegdate);
						reg.setHours(10);
						reg.setMinutes(0);
						reg.setSeconds(0);
						if(reg.getTime()<new Date(data.conditionList[i].attendanceDayOnHour).getTime()){
							comeNum++;
						}
						reg.setHours(18);
						if(reg.getTime()>new Date(data.conditionList[i].attendanceDayOffHour).getTime()){
							leaveNum++;
						}
						
						if(data.conditionList[i].excessTimeDay>0){
							excessNum++;
						}
						
						
					}
					var year = selectDate.substr(0,selectDate.indexOf("-"));
					var month = selectDate.substr(selectDate.lastIndexOf("-")+1);
					var sDay=1;
					var eDay = new Date(year,month,0).getDate();
					
					if(startDate!=null && startDate!=""){
						sDay= startDate.substr(startDate.lastIndexOf("-")+1);
						eDay= endDate.substr(endDate.lastIndexOf("-")+1);
					}
					
					var sumDay = Number(eDay)-Number(sDay)+1;
					absenceNum = sumDay*data.empCnt-data.conditionList.length;
	           		$('#pDataCheck').text(data.conditionList.length+"개의 정보가 있습니다.");
	           		$('#absenceNum').text(absenceNum);
	           		$('#leaveNum').text(leaveNum);
	           		$('#comeNum').text(comeNum);
	           		$('#excessNum').text(excessNum);
	           		
				}else{
					str+='<tr><td colspan="5" align="center">정보 없음</td></tr>';
					$('#pDataCheck').text("결과 없음");
	           		$('#absenceNum').text(0);
	           		$('#leaveNum').text(0);
	           		$('#comeNum').text(0);
	           		$('#excessNum').text(0);
				}
				
				$('#viewTBody').html(str);
			}
		});
	}
	
	function AddMonth(date){
		var now = new Date(date);
		var year= moment(now).format('YYYY');
		var month= moment(now).format('MM');
		var lastDay= Number(moment(new Date(year,month,0)).format('DD'))+1;
		var ptime= new Date(year,month-1,lastDay);
		$('#startDate').datepicker("setDate",ptime);
		$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );	
		$('#endDate').datepicker("setDate",ptime);
		return ptime;
	}

	function MinusMonth(date){
		var now = new Date(date);
		var year= moment(now).format('YYYY');
		var month= moment(now).format('MM');
		var ptime= new Date(year,month-1,0);
		$('#startDate').datepicker("setDate",ptime);
		$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );	
		$('#endDate').datepicker("setDate",ptime);
		return new Date(ptime);
	}
	
	function NowYD(){
		var ntime= new Date();
		$('#startDate').datepicker("setDate","today");
		$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );	
		$('#endDate').datepicker("setDate","today");
		var yd= moment(ntime).format('YYYY-MM');
		
		$('#nowYearMonth').text(yd);
	}
	
	window.onload = function() {
	    Clock();
	    NowYD();
	    statsViewAjax();
	}	
	
</script>
        <title>assiduitygMain</title>
        <div>
            <article>
               <h3>부서 근태통계</h3>
               <div class="now-div text-center" >
               		<span class="now-span" id="nowLeft"><i class="fas fa-chevron-left"></i></span>
               		<span class="now-span" id="nowYearMonth"></span>
               		<span class="now-span" id="nowRight"><i class="fas fa-chevron-right"></i></span>
               		<span class="now-span" id="todayYearMonth">이번 달</span>
               </div>
               <div class="m-d">
               <div class="main-week-div">
               		<div class="week-div">
               			<p class="week-p1 week-pp">늦은출근</p>
               			<p class="week-p2 week-pp" id="comeNum">-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">이른퇴근</p>
               			<p class="week-p2 week-pp" id="leaveNum">-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">결근</p>
               			<p class="week-p2 week-pp" id="absenceNum">-</p>
               		</div> 
               		<div class="week-div">
               			<p class="week-p1 week-pp">휴가</p>
               			<p class="week-p2 week-pp" >-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">초과근무</p>
               			<p class="week-p2 week-pp" id="excessNum">-</p>
               		</div>
               </div>
               </div>
               <input type="hidden" id="sDate" value="">
               <input type="hidden" id="eDate" value="">
               <input type="hidden" id="sEmp" value="">
               <input type="hidden" id="sDepart" value="">
               <div class="stats-terms" >
               		<button type="button" class="btn btn-outline-info stats-terms" id="termsBtn1">+조건 추가</button>
               		<button type="button" class="btn btn-outline-info stats-terms2 st-tr2" id="termsBtn2" >부서원:</button>
               		<button type="button" class="btn btn-outline-info stats-terms2 st-tr3" id="termsBtn3" >부서명:</button>
               		<button type="button" class="btn btn-outline-info stats-terms2 st-tr4" id="termsBtn4" >날짜:</button>
               
               		<div class="stats-check stats-check1 st-ch1" id="checkDiv1" >
	               		<input type="checkbox" class="check-box1 st-ch1" ><span class="check-span1 st-ch1">부서원</span><br>
	               		<input type="checkbox" class="check-box2 st-ch1" ><span class="check-span2 st-ch1">부서명</span><br>
	               		<input type="checkbox" class="check-box3 st-ch1" ><span class="check-span3 st-ch1">날짜</span><br>
               		</div>
               		
               		<div class="stats-check stats-check2 st-ch2" id="checkDiv2">
	               		<input type="text" class="check-text st-ch2" id="searchEmp"><br>
	               		<button type="button" class="btn-info box-ok" id="btName">확인</button>
	               		<button type="button" class="btn btn-light box-cancle">취소</button>
               		</div>
               		
               		<div class="stats-check stats-check3 st-ch3" id="checkDiv3" >
	               		<input type="text" class="check-text st-ch3" id="searchDepart"><br>
	               		<button type="button" class="btn-info box-ok" id="btDepart">확인</button>
	               		<button type="button" class="btn btn-light box-cancle">취소</button>
               		</div>
               		
               		<div class="stats-check stats-check4 st-ch4" id="checkDiv4">
	               		<input type="text" class="check-text2 st-ch4" id="startDate" readonly="readonly"><span class="st-ch4">~</span><input type="text" class="check-text2 st-ch4" id="endDate" readonly="readonly">
	               		<br>
	               		<button type="button" class="btn-info box-ok" id="btDate">확인</button>
	               		<button type="button" class="btn btn-light box-cancle">취소</button>
               		</div>
               
               		<P id="pDataCheck">데이터 있습니다</P>
               		
               		
               
               </div>
               
               
               
               <br>
               <br>
               
               <div class="ann-div">
               <table class="ann-table">
               <tr>
               		<th class="ann-th">이름</th>
               		<th class="ann-th">부서명</th>
               		<th class="ann-th">날짜</th>
               		<th class="ann-th">출근</th>
               		<th class="ann-th">퇴근</th>
               </tr>
               <tbody id="viewTBody">
               <tr>
               		
               </tr>
               </tbody>
               </table>
				</div>
				

            </article>
        </div>
            <%@ include file="bottom.jsp"%>