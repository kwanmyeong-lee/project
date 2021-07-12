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
	});
	
	$('#nowRight').click(function(){
		var nd = new Date($('#nowYearMonth').text());
		var pd = AddMonth(nd);
		pd= moment(pd).format("YYYY-MM");

		$('#nowYearMonth').text(pd);
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

window.onload= Clock;
window.onload= NowYD;

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
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-bs-expanded="true" aria-bs-controls="collapseOne">
        1주차<span class="bt-sp" id="weekNum1">누적근무시간</span>
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body abody">
      	<div class="week-header">
      		<div class="w-h header-date">일자</div>
      		<div class="w-h header-start">업무시작</div>
      		<div class="w-h header-end">업무종료</div>
      		<div class="w-h header-all">총 근무시간</div>
      		<div class="w-h header-detail">근무시간 상세</div>
      		<div class="w-h header-approval">승인여부</div>
      	</div> 	
      	<div class="content-link collapsed" 
				data-bs-toggle="collapse" data-bs-target="#contentDiv1"
				aria-bs-expanded="true" aria-bs-controls="contentDiv">
			<div class="w-c content-date"><span>일자</span></div>
      		<div class="w-c content-start"><span>일자</span></div>
      		<div class="w-c content-end"><span>일자</span></div>
      		<div class="w-c content-all"><span>일자</span></div>
      		<div class="w-c content-detail"><span>일자</span></div>
      		<div class="w-c content-approval"><span>일자</span></div>
		</div>
		<div id="contentDiv1" class="collapse " aria-labelledby="headingOne" data-bs-parent=".abody">
                        <p>내 근태 현황</a>
        </div>
        
      	<div class="content-link collapsed" 
				data-bs-toggle="collapse" data-bs-target="#contentDiv2"
				aria-bs-expanded="true" aria-bs-controls="contentDiv">
			<div class="w-c content-date"><span>일자</span></div>
      		<div class="w-c content-start"><span>일자</span></div>
      		<div class="w-c content-end"><span>일자</span></div>
      		<div class="w-c content-all"><span>일자</span></div>
      		<div class="w-c content-detail"><span>일자</span></div>
      		<div class="w-c content-approval"><span>일자</span></div>
		</div>
		<div id="contentDiv2" class="collapse " aria-labelledby="headingOne" data-bs-parent=".abody">
                        <p>내 근태 현황</a>
        </div>
        
      	<div class="content-link collapsed" 
				data-bs-toggle="collapse" data-bs-target="#contentDiv3"
				aria-bs-expanded="true" aria-bs-controls="contentDiv">
			<div class="w-c content-date"><span>일자</span></div>
      		<div class="w-c content-start"><span>일자</span></div>
      		<div class="w-c content-end"><span>일자</span></div>
      		<div class="w-c content-all"><span>일자</span></div>
      		<div class="w-c content-detail"><span>일자</span></div>
      		<div class="w-c content-approval"><span>일자</span></div>
		</div>
		<div id="contentDiv3" class="collapse " aria-labelledby="headingOne" data-bs-parent=".abody">
                        <p>내 근태 현황</a>
        </div>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-bs-expanded="false" aria-bs-controls="collapseTwo">
        2주차<span class="bt-sp" id="weekNum2"></span>
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body abody">
      	<div class="week-header">
      		<div class="w-h header-date">일자</div>
      		<div class="w-h header-start">업무시작</div>
      		<div class="w-h header-end">업무종료</div>
      		<div class="w-h header-all">총 근무시간</div>
      		<div class="w-h header-detail">근무시간 상세</div>
      		<div class="w-h header-approval">승인여부</div>
      	</div> 	
      	<div class="content-link collapsed" 
				data-bs-toggle="collapse" data-bs-target="#contentDiv4"
				aria-bs-expanded="true" aria-bs-controls="contentDiv">
			<div class="w-c content-date"><span>일자</span></div>
      		<div class="w-c content-start"><span>일자</span></div>
      		<div class="w-c content-end"><span>일자</span></div>
      		<div class="w-c content-all"><span>일자</span></div>
      		<div class="w-c content-detail"><span>일자</span></div>
      		<div class="w-c content-approval"><span>일자</span></div>
		</div>
		<div id="contentDiv4" class="collapse " aria-labelledby="headingOne" data-bs-parent=".abody">
                        <p>내 근태 현황</p>
        </div>
        
      	
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-bs-expanded="false" aria-bs-controls="collapseThree">
        3주차<span class="bt-sp" id="weekNum3"></span>
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFour">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-bs-expanded="false" aria-bs-controls="collapseFour">
        4주차<span class="bt-sp" id="weekNum4"></span>
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingFive">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-bs-expanded="false" aria-bs-controls="collapseFive">
        5주차<span class="bt-sp" id="weekNum5"></span>
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>

               
            </article>
        </div>
            <%@ include file="bottom.jsp"%>