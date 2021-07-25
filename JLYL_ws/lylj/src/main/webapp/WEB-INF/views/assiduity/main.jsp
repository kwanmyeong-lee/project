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
	margin-bottom: 50px;
}
.week-div{
	display:inline-block;
	padding-top: 20px;
	padding-bottom: 20px;
	width: 15%;
	text-align: center;
}
/* accordion */
.accordion{
	clear: both;
}
.abody{
	padding-left:0; 
	padding-right:0; 
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
	border-bottom: 1px solid gray;
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
.content-link:hover{
	cursor:pointer;
	background: #edf4fb;
}
.content-content{
	border-bottom: 1px solid #00a1b9; 
	border-right: 1px solid #00a1b9; 
	border-left: 1px solid #00a1b9; 
}
.content-link{
	border-top: 1px solid #00a1b9; 
	border-right: 1px solid #00a1b9; 
	border-left: 1px solid #00a1b9; 
}
.content-link.collapsed{
	border:0;
}
/* now-div */
.now-div{
	padding-bottom: 10px;
	margin-top: 20px;
}
.now-span{
	padding-left: 10px;
	padding-right: 10px;
	width: 50px;
	font-size: 30px;
	color: black;
}
.now-span:hover{
	cursor:pointer;
}
#todayYearMonth{
	font-size:15px;
}

/* ulCol */
#ulCol{
	float: right;
}
#ulCol li{
	float: right;
	margin-left: 30px; 
}
#liCol2{
	color:#f14f4f; 
}

/* content-table */
.content-table{
	width: 100%;
}
.content-table td:nth-child(2n){
	border-left: 1px dotted black;
}
.content-table td:nth-child(2n-1){
	border-left: 1px solid black;
	height: 35px;
}
</style>

<script type="text/javascript">
$(function(){
	$('#nowLeft').click(function(){
		var nd = new Date($('#nowYearMonth').text());
		var pd = MinusMonth(nd);
		var pd1 = moment(pd).format("YYYY-MM-DD");
		pd= moment(pd).format("YYYY-MM");
		
		$('#nowYearMonth').text(pd);
		dayView(pd);
		
		var empNo = $('.empNo').val();
		
		selectMonthAjax(empNo, pd);
		selectMonthWorkTime(empNo, pd);
		selectMonthSumTime(empNo,pd1);
		selectMonthExTime(empNo,pd1);
		
		
	});
	
	$('#nowRight').click(function(){
		var nd = new Date($('#nowYearMonth').text());
		var pd = AddMonth(nd);
		var pd1 = moment(pd).format("YYYY-MM-DD");
		pd= moment(pd).format("YYYY-MM");
		
		$('#nowYearMonth').text(pd);
		dayView(pd);
		
		var empNo = $('.empNo').val();
		
		selectMonthAjax(empNo, pd);
		selectMonthWorkTime(empNo, pd);
		selectMonthSumTime(empNo,pd1);
		selectMonthExTime(empNo,pd1);
	});
	
	$('#todayYearMonth').click(function(){
		var nd = new Date();
		var nd1 = moment(nd).format("YYYY-MM-DD");
		nd= moment(nd).format("YYYY-MM");

		$('#nowYearMonth').text(nd);
		dayView(nd);
		
		var empNo = $('.empNo').val();
		
		selectMonthAjax(empNo, nd);
		selectMonthWorkTime(empNo, nd);
		selectMonthSumTime(empNo,nd1);
		selectMonthExTime(empNo,nd1);
	});
	
	$('#btnCome').click(function(){
		var now = $('#clockTime').text();
		var ymd= new Date();
		ymd= moment(ymd).format("YYYY-MM-DD");
		
		var attendanceDayRegdate = ymd;
		var empNo = $('.empNo').val();
		var attendanceDayOnHour = ymd+" "+now
		
		$.ajax({    
            type:'get',
            url:"insertComTime",
            data:{empNo:empNo, attendanceDayOnHour:attendanceDayOnHour,
            	attendanceDayRegdate:attendanceDayRegdate},
            dataType: "json",
            success : function(data) {
 				
            	var coT = ymd+"T"+now
            	coT= new Date(coT);
            	var laT= ymd+"T"+"10:00:00";
            	laT= new Date(laT);
            	
            	
        		$('#comeTime').text(now);
        		$('#btnCome').prop("disabled",true);
        		var comeNum = hourMin(now);
        		
        		var comef="#content-td"+comeNum;
        		
        		var nDate=new Date();
        		var weekNum= getWeekOfMonth(nDate);
        		var weekDay=moment(nDate).format('d');
        		
        		var parent="#content"+weekNum+"Div"+weekDay;
        		
        		$(parent).prev().find('span').eq(1).text(now);
        		if(coT.getTime()>laT.getTime()){
        			$(parent).prev().find('span').eq(1).css("color","#f14f4f");
            	}
        		$(parent).find(comef).css("background","blue");
            }
          });
		
		
		
	});
		
	$('#btnLeave').click(function(){
		if($('#btnCome').prop("disabled")==true){
			var now = $('#clockTime').text();
			var cTime = $('#comeTime').text();
			var dayWorkTime=workTime(cTime,now);
			
			var ymd= new Date();
			ymd= moment(ymd).format("YYYY-MM-DD");
			
			var attendanceDayOffHour = ymd+" "+now;
			var empNo = $('.empNo').val();
			var attendanceDayWorkHour = ymd+" "+dayWorkTime;
			var attendanceDayRegdate = ymd;
			var attendanceDayOnHour = ymd+" "+cTime;
			
			$.ajax({    
	            type:'get',
	            url:"updateLeaveTime",
	            data:{empNo:empNo, attendanceDayOffHour:attendanceDayOffHour,
	            	attendanceDayWorkHour:attendanceDayWorkHour,
	            	attendanceDayRegdate:attendanceDayRegdate,
	            	attendanceDayOnHour:attendanceDayOnHour
	            },
	            dataType: "json",
	            success : function(data) {
	            	
	            	$('#leaveTime').text(now);
	    			$('#btnLeave').prop("disabled",true);
	    			$('#dayWorkTime').text(dayWorkTime);
	        		
	        		var comeNum = hourMin(cTime);
	    			var leaveNum = hourMin(now);
	    			
	    			
	    			var nDate=new Date();
	    			var weekNum= getWeekOfMonth(nDate);
	    			var weekDay=moment(nDate).format('d');
	    			
	    			var parent="#content"+weekNum+"Div"+weekDay;
	    			$(parent).prev().find('span').eq(2).text(now);
	    			$(parent).prev().find('span').eq(3).text(dayWorkTime);
	    			
	    			for(var i=comeNum; i<=leaveNum; i++){
	    				var comef="#content-td"+i;
	    				$(parent).find(comef).css("background","blue");
	    			}
	    			
	    			
	    			
	    			var amTime= new Date(ymd+"T00:00:00").getTime()+(9*60*60*1000);
            		var pmTime = new Date(ymd+"T00:00:00").getTime()+(18*60*60*1000);
            		var attendanceDayOffHour = new Date(ymd+"T"+now).getTime();
            		var attendanceDayOnHour = new Date(ymd+"T"+cTime).getTime();
            		var amExTime=0;
            		var pmExTime=0;
            		
            		var allTime= new Date(ymd+"T"+dayWorkTime).getTime() - new Date(ymd+"T00:00:00").getTime();
            		
            		
            		
            		if(attendanceDayOffHour>pmTime){
            			if(attendanceDayOnHour>=pmTime){
            				pmExTime = attendanceDayOffHour - attendanceDayOnHour;
            			}else{
            				pmExTime = attendanceDayOffHour - pmTime;
            			}
            		}//오후 초과 시간
            		
            		if(attendanceDayOnHour<amTime){
            			if(attendanceDayOffHour<=amTime){
            				amExTime = attendanceDayOffHour - attendanceDayOnHour;
            			}else{
            				amExTime = amTime - attendanceDayOnHour;
            			}
            		}//오전 초과 시간
            		
					var normalTime = allTime - pmExTime - amExTime; //일과시간
        			
					
        			var allText ="기본:";
					var allEx = amExTime + pmExTime;
					
        			var nomalText =  miliHMS(normalTime);
					allText += nomalText;
					
					if(allEx !=0 ){
						var exText = miliHMS(allEx);
						allText+=" / 초과:" + exText;
					}
					
					$(parent).prev().find('span').eq(4).text(allText);
					$(parent).prev().find('span').eq(5).text("대기");
	    			
	    			
	            }
	          });
			
		}else{
			swal("출근을 해야합니다" ,  "" ,  "error" );
		}
	});
	
	$('.content-link').click(function(){
		var empNo = $('.empNo').val();
		var attendanceDayRegdate= $(this).find('input[type=hidden]').eq(0).val();
		var weekNum= $(this).find('input[type=hidden]').eq(1).val();
		var weekDay= $(this).find('input[type=hidden]').eq(2).val();
		
		$.ajax({    
            type:'get',
            url:"selectAttendDayView",
            data:{empNo:empNo, attendanceDayRegdate:attendanceDayRegdate},
            dataType: "json",
            success : function(data) {
            	
            	if(data!=null){
            		
	            	var cTime= new Date(data.attendanceDayOnHour);
	            	var lTime= new Date(data.attendanceDayOffHour);
	            	cTime= moment(cTime).format("HH:mm:ss");	
	            	lTime= moment(lTime).format("HH:mm:ss");	
	        		
	        		var comeNum = hourMin(cTime);
	    			var leaveNum = hourMin(lTime);
	    			
	    			var parent="#content"+weekNum+"Div"+weekDay;
	    			
	    			for(var i=comeNum; i<=leaveNum; i++){
	    				var comef="#content-td"+i;
	    				$(parent).find(comef).css("background","blue");
	    			}
	    			
            	}
            },
            error:function(request,status,error){
            	var parent="#content"+weekNum+"Div"+weekDay;
        		for(var i=0; i<=47; i++){
    				var comef="#content-td"+i;
    				$(parent).find(comef).css("background","white");
    			}
            }

            
          });
		
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

function selectMonthAjax(empNo, pd){
	$.ajax({    
        type:'get',
        url:"selectMonth",
        data:{empNo:empNo, selectDate:pd},
        dataType: "json",
        async : false,
        success : function(data) {
        	var smNum= 0;
        	
        	for(var i=0; i<42; i++){
        		var dayNumId = '#dayNum'+i;
        		$(dayNumId).html("<span>--:--:--</span>");
        		$(dayNumId).css("color","#808080");
        		$(dayNumId).next().html("<span>--:--:--</span>");
        		$(dayNumId).next().next().html("<span>--:--:--</span>");
        		$(dayNumId).next().next().next().html("<span>--:--:--</span>");
        		$(dayNumId).next().next().next().next().html("<span></span>");
        		
        		if(data.length>i){
            		if(data[i].attendanceDayOnHour!=null){
            			var tx =  moment(data[i].attendanceDayOnHour).format("HH:mm:ss");
            			tx ="<span>"+tx+"</sapn>"
            			$(dayNumId).html(tx);
            			var later = new Date(data[i].attendanceDayOnHour);
            			later.setSeconds(0);
            			later.setMinutes(0);
            			later.setHours(10);
            			if(new Date(data[i].attendanceDayOnHour)> later){
            				$(dayNumId).css("color","#f14f4f");
            			}
            		}
            		if(data[i].attendanceDayOffHour!=null){
            			var tx = moment(data[i].attendanceDayOffHour).format("HH:mm:ss");
            			tx ="<span>"+tx+"</sapn>"
            			$(dayNumId).next().html(tx);
            		}
            		if(data[i].attendanceDayWorkHour!=null){
            			var tx =  moment(data[i].attendanceDayWorkHour).format("HH:mm:ss");
            			tx ="<span>"+tx+"</sapn>"
            			$(dayNumId).next().next().html(tx);
            			
            			var amTime= new Date(data[i].attendanceDayRegdate).getTime()+(9*60*60*1000);
                		var pmTime = new Date(data[i].attendanceDayRegdate).getTime()+(18*60*60*1000);
                		var attendanceDayOffHour = new Date(data[i].attendanceDayOffHour).getTime();
                		var attendanceDayOnHour = new Date(data[i].attendanceDayOnHour).getTime();
                		var amExTime=0;
                		var pmExTime=0;
                		
                		var allTime= new Date(data[i].attendanceDayWorkHour).getTime() - new Date(data[i].attendanceDayRegdate).getTime();
                		
                		
                		
                		if(attendanceDayOffHour>pmTime){
                			if(attendanceDayOnHour>=pmTime){
                				pmExTime = attendanceDayOffHour - attendanceDayOnHour;
                			}else{
                				pmExTime = attendanceDayOffHour - pmTime;
                			}
                		}//오후 초과 시간
                		
                		if(attendanceDayOnHour<amTime){
                			if(attendanceDayOffHour<=amTime){
                				amExTime = attendanceDayOffHour - attendanceDayOnHour;
                			}else{
                				amExTime = amTime - attendanceDayOnHour;
                			}
                		}//오전 초과 시간
                		
    					var normalTime = allTime - pmExTime - amExTime; //일과시간
            			
    					
            			var allText ="<span>기본:";
    					var allEx = amExTime + pmExTime;
    					
            			var nomalText =  miliHMS(normalTime);
    					allText += nomalText;
    					
    					if(allEx !=0 ){
    						var exText = miliHMS(allEx);
    						allText+=" / 초과:" + exText;
    					}
    					
    					allText+="</span>";
    					
            			$(dayNumId).next().next().next().html(allText);
    					
            		}
            		if(data[i].attendanceDayHolidayFlag !=0){
            			var tx =  "<span>";
            			if(data[i].attendanceDayHolidayFlag=='1'){
            				tx+="대기</sapn>";
            			}else if(data[i].attendanceDayHolidayFlag=='2'){
            				tx+="승인</sapn>";
            			}else if(data[i].attendanceDayHolidayFlag=='3'){
            				tx+="취소</sapn>";
            			}
            			$(dayNumId).next().next().next().next().html(tx);
            		}
            		
            		
            		
        		}
      		
        	}
        	
        }
      });
}

function miliHMS(mili){
	var hour = "00"+Math.floor(mili/1000/3600);
	var min = "00"+Math.floor(mili/1000%3600/60);
	var sec = "00"+Math.floor(mili/1000%3600%60);
	hour = hour.slice(-2);
	min = min.slice(-2);
	sec = sec.slice(-2);
	
	return hour+"h "+min+"m "+sec+"s";
}

function selectMonthWorkTime(empNo, pd){
	$.ajax({    
        type:'get',
        url:"selectMonthWorkTime",
        data:{empNo:empNo, selectDate:pd},
        dataType: "json",
        async : false,
        success : function(data) {
        	for(var i=0; i<6; i++){
        		var tx = "#weekbtspan"+(i+1);
        		$(tx).text("00h 00m 00s");
        		if(data.length>i){
        			var hour = "00"+Math.floor(data[i]/3600);
        			var min = "00"+Math.floor(data[i]%3600/60);
        			var sec = "00"+Math.floor(data[i]%3600%60);
        			hour = hour.slice(-2);
        			min = min.slice(-2);
        			sec = sec.slice(-2);
	        		$(tx).text(hour+"h "+min+"m "+sec+"s");
        			
        		}
        	}
        	
        }
      });
}
function selectMonthSumTime(empNo, pd){
	$.ajax({    
        type:'get',
        url:"selectMonthSumTime",
        data:{empNo:empNo, nowDate:pd},
        dataType: "json",
        async : false,
        success : function(data) {
        	var tx = miliHMS(data*1000);
        	$('#sumMonth').text(tx);
        	
        }
      });
}
function selectMonthExTime(empNo, pd){
	$.ajax({    
        type:'get',
        url:"selectMonthExTime",
        data:{empNo:empNo, nowDate:pd},
        dataType: "json",
        async : false,
        success : function(data) {
        	var tx = miliHMS(data*1000);
        	$('#exMonth').text(tx);
        	
        }
      });
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
			var pastDay=firstDay;
			pastDay.setDate(firstDay.getDate()-weekDay);
 			for(var j=0; j<weekDay; j++){
				var num= moment(pastDay).format('DD');
				var d = ".content-date"+j;
				
				$('#collapseOne1').find(d).children('span').text(num+" "+week[j]);
				$('#collapseOne1').find(d).children('span').css("opacity","0.3");
				
				
				var yyyymms = moment(pastDay).format('YYYY-MM');
				$('#collapseOne1').find(d).children('input[type=hidden]').eq(0).val(yyyymms+"-"+num);
				$('#collapseOne1').find(d).children('input[type=hidden]').eq(1).val(1);
				$('#collapseOne1').find(d).children('input[type=hidden]').eq(2).val(j);
				
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
		
		var yyyymms = moment(firstDay).format('YYYY-MM');
		$(d1).find(d2).children('input[type=hidden]').eq(0).val(yyyymms+"-"+num);
		$(d1).find(d2).children('input[type=hidden]').eq(1).val(weekNo);
		$(d1).find(d2).children('input[type=hidden]').eq(2).val(weekDay);
		
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
			
			var yyyymms = moment(futureDay).format('YYYY-MM');
			$(d1).find(d).children('input[type=hidden]').eq(0).val(yyyymms+"-"+num);
			$(d1).find(d).children('input[type=hidden]').eq(1).val(weekNoCheck);
			$(d1).find(d).children('input[type=hidden]').eq(2).val(j);
			
			if(week[j]=="일"){
				$(d1).find(d).children('span').css("color","red");
			}else if(week[j]=="토"){
				$(d1).find(d).children('span').css("color","blue");
			}
			futureDay.setDate(futureDay.getDate()+1);
		}	
	}
	
	
}

function workTime(cTime,lTime){
	/* var hour= ctime.substring(0,ctime.indexOf(":"));
	var time= ctime.substring(ctime.indexOf(":")+1,ctime.lastIndexOf(":"));
	var min= ctime.substring(ctime.lastIndexOf(":")+1); */
	
	lTime="2021-01-01 "+lTime;
	cTime="2021-01-01 "+cTime;
	
	var comeTime = new Date(cTime);
	var leaveTime = new Date(lTime);
	var dayWorkTime = new Date(leaveTime.getTime() - comeTime.getTime()+ (1000*60*60*15));
	
	dayWorkTime = moment(dayWorkTime).format("HH:mm:ss");	
	
	return dayWorkTime; 
}

function hourMin(time){
	var hour= time.substring(0,time.indexOf(":"));
	var min= time.substring(time.indexOf(":")+1,time.lastIndexOf(":"));
	min=Number(min);
	
	var num= Number(hour)*2;
	if(min>=30){
		num++;
	}
	
	return num;
}

function exView(){
	var dayNum = $('#exNum').val();
	for(var i=0; i<dayNum; i++){
		var dayNumId = '#dayNum'+i;
		var DayWorkHour = Number($(dayNumId).next().next().find('input[type=hidden]').val());
		
		if(DayWorkHour!=0){			
			DayWorkHour = Number($(dayNumId).next().next().find('input[type=hidden]').val());
			var DayOffHour = Number($(dayNumId).next().find('input[type=hidden]').val());
			var DayOnHour = Number($(dayNumId).find('input[type=hidden]').eq(1).val());
			var DayRegdate = Number($(dayNumId).find('input[type=hidden]').eq(0).val());
			
			var amTime= DayRegdate+(9*60*60*1000);
    		var pmTime = DayRegdate+(18*60*60*1000);
    		var amExTime=0;
    		var pmExTime=0;

    		var allTime=DayWorkHour-DayRegdate;
    	
    
    		
    		if(DayOffHour>pmTime){
    			if(DayOnHour>=pmTime){
    				pmExTime = DayOffHour - DayOnHour;
    			}else{
    				pmExTime = DayOffHour - pmTime;
    			}
    		}//오후 초과 시간
    		
    		if(DayOnHour<amTime){
    			if(DayOffHour<=amTime){
    				amExTime = DayOffHour - DayOnHour;
    			}else{
    				amExTime = amTime - DayOnHour;
    			}
    		}//오전 초과 시간
    		
			var normalTime = allTime - pmExTime - amExTime; //일과시간
			
			
			var allText ="<span>기본:";
			var allEx = amExTime + pmExTime;
			
			var nomalText =  miliHMS(normalTime);
			allText += nomalText;
			
			if(allEx !=0 ){
				var exText = miliHMS(allEx);
				allText+=" / 초과:" + exText;
			}
			
			allText+="</span>";
			
			$(dayNumId).next().next().next().html(allText);
			
		}
	}
	
	
}

var nowDates= new Date();
window.onload= function(){
	Clock();
	NowYD();
	dayView(nowDates);
	exView();
}

</script>
        <title>assiduitygMain</title>
        <div>
            <article>
               <h3>근태현황</h3>
               <input type="hidden" class="empNo" value="${empNo }">
			   <input type="hidden" class="empName" value="${empName }">
			   
               <div class="now-div text-center">
               		<span class="now-span" id="nowLeft"><i class="fas fa-chevron-left"></i></span>
               		<span class="now-span" id="nowYearMonth"></span>
               		<span class="now-span" id="nowRight"><i class="fas fa-chevron-right"></i></span>
               		<span class="now-span" id="todayYearMonth">이번 달</span>
               </div>
               <div class="m-d">
               <div class="main-week-div">
               		<div class="week-div">
	               		<c:set var="shour" value="${Math.floor(selectSumWeekWork/3600) }"/>
		        		<c:set var="smin" value="${Math.floor(selectSumWeekWork%3600/60) }"/>
		      	  		<c:set var="ssec" value="${selectSumWeekWork%3600%60 }"/>
               			<p class="week-p1">이번주 누적</p>
               			<p class="week-p2" ><fmt:formatNumber value='${shour}' pattern='00'/>h <fmt:formatNumber value='${smin}' pattern='00'/>m <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
               		</div>
               		<span class="divide-bar"></span>
               		<div class="week-div">
               			<c:set var="shour" value="${Math.floor(selectSumWeekWorkEx/3600) }"/>
		        		<c:set var="smin" value="${Math.floor(selectSumWeekWorkEx%3600/60) }"/>
		      	  		<c:set var="ssec" value="${selectSumWeekWorkEx%3600%60 }"/>
               			<p class="week-p1">이번주 초과</p>
               			<p class="week-p2" ><fmt:formatNumber value='${shour}' pattern='00'/>h <fmt:formatNumber value='${smin}' pattern='00'/>m <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
               		</div>
               		<div class="week-div">
               			<c:set var="shour" value="${Math.floor(selectLeftTimeWeek/3600) }"/>
		        		<c:set var="smin" value="${Math.floor(selectLeftTimeWeek%3600/60) }"/>
		      	  		<c:set var="ssec" value="${selectLeftTimeWeek%3600%60 }"/>
               			<p class="week-p1">이번주 잔여</p>
               			<p class="week-p2" ><fmt:formatNumber value='${shour}' pattern='00'/>h <fmt:formatNumber value='${smin}' pattern='00'/>m <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
               		</div>
               		<span class="divide-bar"></span>
               		<div class="week-div">
               			<c:set var="shour" value="${Math.floor(selectSumMonthWork/3600) }"/>
		        		<c:set var="smin" value="${Math.floor(selectSumMonthWork%3600/60) }"/>
		      	  		<c:set var="ssec" value="${selectSumMonthWork%3600%60 }"/>
               			<p class="week-p1 week-pp">선택한 달 누적</p>
               			<p class="week-p2 week-pp" id="sumMonth"><fmt:formatNumber value='${shour}' pattern='00'/>h <fmt:formatNumber value='${smin}' pattern='00'/>m <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
               		</div>
               		<div class="week-div">
               			<c:set var="shour" value="${Math.floor(selectSumMonthWorkEx/3600) }"/>
		        		<c:set var="smin" value="${Math.floor(selectSumMonthWorkEx%3600/60) }"/>
		      	  		<c:set var="ssec" value="${selectSumMonthWorkEx%3600%60 }"/>
               			<p class="week-p1 week-pp">선택한 달 초과</p>
               			<p class="week-p2 week-pp" id="exMonth"><fmt:formatNumber value='${shour}' pattern='00'/>h <fmt:formatNumber value='${smin}' pattern='00'/>m <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
               		</div>
               </div>
               </div>
               
               <div>
               	<ul id="ulCol">
               		<li id="liCol2">지각</li>
               		<li id="liCol1">정상</li>
               	</ul>
               </div>
<c:set var="dayNum" value="0"/>
<div class="accordion" id="accordionExample">
  <c:forEach var="weekNo" begin="1" end="6">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne${weekNo }">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne${weekNo }" aria-bs-expanded="false" aria-bs-controls="collapseOne${weekNo }">
        ${weekNo }주차
        <c:choose>
        
        <c:when test="${weekTimelist.size()>=weekNo }">
	        <c:set var="sumhour" value="${Math.floor(weekTimelist.get(weekNo-1)/3600) }"/>
	        <c:set var="summin" value="${Math.floor(weekTimelist.get(weekNo-1)%3600/60) }"/>
	        <c:set var="sumsec" value="${weekTimelist.get(weekNo-1)%3600%60 }"/>
	        <span class="bt-sp" id="weekbtspan${weekNo }"><fmt:formatNumber value='${sumhour}' pattern='00'/>h <fmt:formatNumber value='${summin}' pattern='00'/>m <fmt:formatNumber value='${sumsec}' pattern='00'/>s</span>
        </c:when>
        <c:otherwise>
        	<span class="bt-sp" id="weekbtspan${weekNo }"></span>
        </c:otherwise>
        </c:choose>
        <span class="bt-sp" id="weekNum${weekNo }">누적근무시간</span>
      </button>
    </h2>
    <div id="collapseOne${weekNo }" class="accordion-collapse collapse" aria-labelledby="headingOne${weekNo }" data-bs-parent="#accordionExample">
      <div class="accordion-body abody abody${weekNo }">
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
					aria-bs-expanded="true" aria-bs-controls="#content${weekNo }Div${weekDay }">
				<div class="w-c content-date content-date${weekDay }">
					<span>일자</span>
					<input type="hidden">
					<input type="hidden">
					<input type="hidden">
				</div>
				<c:choose>
				<c:when test="${attendMonthList.size()-1 ge dayNum}">
		      		<div class="w-c content-start content-start${weekDay }" id="dayNum${dayNum }">
		      			<c:if test="${!empty attendMonthList.get(dayNum).attendanceDayOnHour}">
		      				<c:set var="lateCheck" value="${attendMonthList.get(dayNum).attendanceDayRegdate }"></c:set>
		      				<c:set var="lateCheck" value="${lateCheck.getTime()+(10*60*60*1000)}"></c:set>
		      				<c:if test="${lateCheck< attendMonthList.get(dayNum).attendanceDayOnHour.getTime() }">
		      					<span style="color:#f14f4f;"><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayOnHour}" pattern="HH:mm:ss"/></span>
		      				</c:if>
		      				<c:if test="${lateCheck>=attendMonthList.get(dayNum).attendanceDayOnHour.getTime() }">
		      					<span><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayOnHour}" pattern="HH:mm:ss"/></span>
		      				</c:if>
		      				<input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayRegdate.getTime()}">
		      				<input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayOnHour.getTime()}">
		      			</c:if>
		      			<c:if test="${empty attendMonthList.get(dayNum).attendanceDayOnHour}">
		      				<span>--:--:--</span>
		      			</c:if>
		      		</div>
		      		<div class="w-c content-end content-end${weekDay }">
		      			<c:if test="${!empty attendMonthList.get(dayNum).attendanceDayOffHour}">
		      				<span><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayOffHour}" pattern="HH:mm:ss"/></span>
		      				<input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayOffHour.getTime()}">
		      			</c:if>
		      			<c:if test="${empty attendMonthList.get(dayNum).attendanceDayOffHour.getTime()}">
		      				<span>--:--:--</span>
		      			</c:if>
		      		</div>
		      		<div class="w-c content-all content-all${weekDay }">
		      			<c:if test="${!empty attendMonthList.get(dayNum).attendanceDayWorkHour}">
		      				<span><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayWorkHour}" pattern="HH:mm:ss"/></span>
		      				<input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayWorkHour.getTime()}">
		      			</c:if>
		      			<c:if test="${empty attendMonthList.get(dayNum).attendanceDayWorkHour.getTime()}">
		      				<span>--:--:--</span>
		      				<input type="hidden" value="0">
		      			</c:if>
		      		</div>
		      		<div class="w-c content-detail content-detail${weekDay }">
		      			<span>--:--:--</span>
		      		</div>
		      		<div class="w-c content-approval content-approval${weekDay }">
		      			<c:if test="${!empty attendMonthList.get(dayNum).attendanceDayHolidayFlag}">
		      				<c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='0'}">
			      				<span></span>
		      				</c:if>
		      				<c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='1'}">
			      				<span>대기</span>
		      				</c:if>
		      				<c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='2'}">
			      				<span>승인</span>
		      				</c:if>
		      				<c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='3'}">
			      				<span>취소</span>
		      				</c:if>
		      			</c:if>
		      			<c:if test="${empty attendMonthList.get(dayNum).attendanceDayHolidayFlag}">
		      				<span></span>
		      			</c:if>
		      		</div>
		      		<c:set var="dayNum" value="${dayNum+1 }"/>
		      		
	      		</c:when>
	      		<c:when test="${attendMonthList.size()-1 lt dayNum && dayNum<42}">
		      		<div class="w-c content-start content-start${weekDay }" id="dayNum${dayNum }"><span>--:--:--</span></div>
		      		<div class="w-c content-end content-end${weekDay }"><span>--:--:--</span></div>
		      		<div class="w-c content-all content-all${weekDay }"><span>--:--:--</span></div>
		      		<div class="w-c content-detail content-detail${weekDay }"><span>--:--:--</span></div>
		      		<div class="w-c content-approval content-approval${weekDay }"><span></span></div>
		      		<c:set var="dayNum" value="${dayNum+1 }"/>
	      		</c:when>
	      		</c:choose>
	      		
			</div>
			<div id="content${weekNo }Div${weekDay }" class="content-collapse collapse" aria-labelledby="headingOne${weekNo }" data-bs-parent=".abody${weekNo }">
				<div class="content-content">
				<table class="content-table">
					<tr>
						<c:forEach var="i" begin="0" end="23">
	                   		<th colspan="2"><fmt:formatNumber value="${i }" pattern="00"  />:00</th>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="i" begin="0" end="47">
	                   		<td id="content-td${i }"></td>
						</c:forEach>
					</tr>
	            </table>
	            </div>
	        </div>
        </c:forEach>
      </div>
    </div>
  </div>
  </c:forEach>
</div>
<input type="hidden"  id="exNum" value="${attendMonthList.size()}">
            </article>
        </div>
            <%@ include file="bottom.jsp"%>