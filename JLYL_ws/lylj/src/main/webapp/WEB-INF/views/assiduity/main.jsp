<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


<style>
	#clockDate{
		color:white;
		font-size: 12px;
		border-top: 1px solid white;
		padding: 5px;
		padding-bottom: 0;
	}
	#clockTime{
		color:white;
		text-align:center;
		font-size: 40px;
	}
	.commute-ul{
	list-style-type: none;
	padding: 5px;
	color: white;
	font-size: 13px;
}
.commute-dl>dt{
	display: inline;
}
.commute-dl>dd{
	float: right;
}

.btn-commute{
	width: 85px;
	font-size: 14px;
}
.commute-div{
	text-align: center;
	border-bottom: 3px dotted white;
	padding-bottom: 5px;
}
.main-week-div{
	border: 1px solid black;
	padding-left: 20px;
	padding-right: 20px;
	width: 90%;
	text-align: center;
	display: inline-block;
}
.week-div{
	display:inline-block;
	padding-top: 20px;
	padding-bottom: 20px;
	width: 15%;
	text-align: center;
}
.accordion{
	clear: both;
}
.divide-bar{
	display: inline-block;
    margin: 24px 8px;
    width: 1px;
    height: 58px;
    background: #eaeaea;
    vertical-align: top;
}
.m-d{
	text-align: center;
}

.week-p1{
	color: black;
	margin: 0px;
	font-size: 0.8em;
}
.week-p2{
	color:#00a1b9;
	font-size: 2em;
	margin: 0px;
}
.week-pp{
	color: #888888;
}
.bt-sp{
	float: right;
}	
.accordion-button{
	display: inline-block;
}

/* <!-- week-header --> */
.week-header{
	clear:both;
	border: 1px solid black;
}
.w-h{
	display:inline-block;
	width: 15%;
}
.header-date{
	text-align: center;
}
.header-approval{
	width: 8%;
	text-align: center;
}
.header-detail{
	width: 30%;
}

/* week-content */
.week-content{
	clear: both;
}
.w-c{
	display:inline-block;
	width: 15%;
}
.content-date{
	text-align: center;
}
.content-approval{
	width: 8%;
	text-align: center;
}
.content-detail{
	width: 30%;
}

/* now-div */
.now-div{
	padding-bottom: 10px;
}
.now-span{
	padding-left: 10px;
	padding-right: 10px;
	width: 50px;
	font-size: 30px;
	color: black;
}	
</style>

<script type="text/javascript">
$(function(){
	$('#nowLeft').click(function(){
		var nd = new Date($('#nowYearMonth').text());
		var pd = MinusMonth(nd);
		pd= moment(pd).format("YYYY-MM");
		
		$('#nowYearMonth').text(pd);
		dayView(pd);
	});
	
	$('#nowRight').click(function(){
		var nd = new Date($('#nowYearMonth').text());
		var pd = AddMonth(nd);
		pd= moment(pd).format("YYYY-MM");

		$('#nowYearMonth').text(pd);
		dayView(pd);
	});
});

function Clock(){
 
 var now = new Date();
 
 var year = moment(now).format('YYYY'); 
 var month = moment(now).format('MM'); 
 var day = moment(now).format('DD');
 var weeknum = moment(now).format('d');
 var hour = moment(now).format('HH');  
 var min = moment(now).format('mm');  
 var sec = moment(now).format('ss');
 
 var week=["일","월","화","수","목","금","토"];
 
 $('#clockDate').text(year+"-"+ month+"-"+day+" ("+week[weeknum]+")");
 $('#clockTime').text(hour+":"+min+":"+sec);
 
 setTimeout("Clock()", 1000);
}

function AddMonth(date){
	var now = new Date(date);
	var year= moment(now).format('YYYY');
	var month= moment(now).format('MM');
	var lastDay= Number(moment(new Date(year,month,0)).format('DD'))+1;
	var ptime= new Date(year,month-1,lastDay);
	
	return ptime;
}

function MinusMonth(date){
	var now = new Date(date);
	var year= moment(now).format('YYYY');
	var month= moment(now).format('MM');
	var ptime= new Date(year,month-1,0);
	
	return new Date(ptime);
}

function NowYD(){
	var ntime= new Date();
	
	var yd= moment(ntime).format('YYYY-MM');
	
	$('#nowYearMonth').text(yd);
}

function getWeekOfMonth(date){
	var selectedDayOfMonth=date.getDate();
	
	var first= new Date(date.getFullYear()+'/'+(date.getMonth()+1)+'/01');
	var monthFirstDateDay = first.getDay();
	
	return Math.ceil((selectedDayOfMonth + monthFirstDateDay)/7);
}

function dayView(date){
	var now = new Date(date);
	var year = moment(now).format('YYYY');
	var month = moment(now).format('MM');
	var firstDay = new Date(year,month-1,1);
	var lastDay= Number(moment(new Date(year,month,0)).format('DD'));
	var week= ["일","월","화","수","목","금","토"];
	
	var weekNoChecks = new Date(year,month-1,lastDay);
	var weekNoCheck = getWeekOfMonth(weekNoChecks);
	
	//주차검사
	for(var i=1; i<=weekNoCheck; i++){
		var d1 = "#collapseOne"+i;
		$(d1).parent().show();
	}
		for(var i=weekNoCheck+1; i<7; i++){
			var d1 = "#collapseOne"+i;
			$(d1).parent().hide();
		}	
	
	var weekNo= getWeekOfMonth(firstDay);
	var weekDay= firstDay.getDay();
		
		//저번달
		if(weekDay!=0){
			var pastDay=new Date();
			pastDay.setDate(firstDay.getDate()-weekDay);
			for(var j=0; j<weekDay; j++){
				var num= moment(pastDay).format('DD');
				var d = ".content-date"+j;
				
				$('#collapseOne1').find(d).children('span').text(num+" "+week[j]);
				$('#collapseOne1').find(d).children('span').css("opacity","0.3");
				
				if(week[j]=="일"){
					$('#collapseOne1').find(d).children('span').css("color","red");
				}else if(week[j]=="토"){
					$('#collapseOne1').find(d).children('span').css("color","blue");
				}
				pastDay.setDate(pastDay.getDate()+1);
			}
		}
	
	//이번달
	for(var i =0; i<lastDay; i++){
		weekDay= firstDay.getDay();
		weekNo= getWeekOfMonth(firstDay);
			
			
		var d1 = "#collapseOne"+weekNo;
		var d2 = ".content-date"+weekDay;
		var num= moment(firstDay).format('DD');
		$(d1).find(d2).children('span').text(num+" "+week[weekDay]);
		if(week[weekDay]=="일"){
			$(d1).find(d2).children('span').css("color","red");
		}else if(week[weekDay]=="토"){
			$(d1).find(d2).children('span').css("color","blue");
		}
		
		if(weekNo==1 || weekNo==weekNoCheck){
			$(d1).find(d2).children('span').css("opacity","1");			
		}
		firstDay.setDate(firstDay.getDate()+1);
	}
	
	//다음달
	var lastWeekDay = weekNoChecks.getDay();
	if(lastWeekDay!=6){
		var futureDay=new Date();
		futureDay.setDate(weekNoChecks.getDate()+1);
		for(var j=lastWeekDay+1; j<7; j++){
			var num= moment(futureDay).format('DD');
			var d = ".content-date"+j;
			var d1 = "#collapseOne"+weekNoCheck;
			
			$(d1).find(d).children('span').text(num+" "+week[j]);
			$(d1).find(d).children('span').css("opacity","0.3");
			
			if(week[j]=="일"){
				$(d1).find(d).children('span').css("color","red");
			}else if(week[j]=="토"){
				$(d1).find(d).children('span').css("color","blue");
			}
			futureDay.setDate(futureDay.getDate()+1);
		}	
	}
	
	
}

var nowDates= new Date();
window.onload= function(){
	Clock();
	NowYD();
	dayView(nowDates);	
}

</script>


        <title>assiduitygMain</title>
        <div>
            <article>
               <h3>근태현황</h3>
               <div class="now-div text-center">
               		<span class="now-span" id="nowLeft"><i class="fas fa-chevron-left"></i></span>
               		<span class="now-span" id="nowYearMonth">aaa</span>
               		<span class="now-span" id="nowRight"><i class="fas fa-chevron-right"></i></span>
               </div>
               <div class="m-d">
               <div class="main-week-div">
               		<div class="week-div">
               			<p class="week-p1">이번주 누적</p>
               			<p class="week-p2" >000</p>
               		</div>
               		<span class="divide-bar"></span>
               		<div class="week-div">
               			<p class="week-p1">이번주 초과</p>
               			<p class="week-p2" >000</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1">이번주 잔여</p>
               			<p class="week-p2" >000</p>
               		</div>
               		<span class="divide-bar"></span>
               		<div class="week-div">
               			<p class="week-p1 week-pp">이번달 누적</p>
               			<p class="week-p2 week-pp" >000</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">이번달 연장</p>
               			<p class="week-p2 week-pp" >000</p>
               		</div>
               </div>
               </div>
               
<div class="accordion" id="accordionExample">

  <c:forEach var="weekNo" begin="1" end="6">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne${weekNo }">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne${weekNo }" aria-bs-expanded="false" aria-bs-controls="collapseOne${weekNo }">
        ${weekNo }주차<span class="bt-sp" id="weekNum${weekNo }">누적근무시간</span>
      </button>
    </h2>
    <div id="collapseOne${weekNo }" class="accordion-collapse collapse" aria-labelledby="headingOne${weekNo }" data-bs-parent="#accordionExample">
      <div class="accordion-body abody">
      	<div class="week-header">
      		<div class="w-h header-date">일자</div>
      		<div class="w-h header-start">업무시작</div>
      		<div class="w-h header-end">업무종료</div>
      		<div class="w-h header-all">총 근무시간</div>
      		<div class="w-h header-detail">근무시간 상세</div>
      		<div class="w-h header-approval">승인여부</div>
      	</div>
      	<c:forEach var="weekDay" begin="0" end="6"> 	
	      	<div class="content-link collapsed" 
					data-bs-toggle="collapse" data-bs-target="#content${weekNo }Div${weekDay }"
					aria-bs-expanded="true" aria-bs-controls="contentDiv">
				<div class="w-c content-date${weekDay }"><span>일자</span></div>
	      		<div class="w-c content-start${weekDay }"><span>일자</span></div>
	      		<div class="w-c content-end${weekDay }"><span>일자</span></div>
	      		<div class="w-c content-all${weekDay }"><span>일자</span></div>
	      		<div class="w-c content-detail${weekDay }"><span>일자</span></div>
	      		<div class="w-c content-approval${weekDay }"><span>일자</span></div>
			</div>
			<div id="content${weekNo }Div${weekDay }" class="collapse " aria-labelledby="headingOne${weekNo }" data-bs-parent=".abody">
	                        <p>내 근태 현황</p>
	        </div>
        </c:forEach>
      </div>
    </div>
  </div>
  </c:forEach>
</div>

               
            </article>
        </div>
            <%@ include file="bottom.jsp"%>