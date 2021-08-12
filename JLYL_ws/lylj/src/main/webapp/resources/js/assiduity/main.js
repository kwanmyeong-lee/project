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
		borderColorRemove();
		
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
		borderColorRemove();
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
		borderColorRemove();
	});
	
	$('#btnCome').click(function(){
		var now = $('#clockTime').text();
		var ymd= new Date();
		ymd= moment(ymd).format("YYYY-MM-DD");
		
		var attendanceDayRegdate = ymd;
		var empNo = $('.empNo').val();
		var attendanceDayOnHour = ymd+" "+now;
		
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
						$(parent).prev().find('span').eq(5).text("대기");
					}
					
					$(parent).prev().find('span').eq(4).text(allText);
					
	    			
	    			
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
        beforeSend: function() {
			 $('.loading').show();
		},
		complete: function() {
	        $('.loading').hide();
	    },
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
	if(hour>99){
		hour = hour.slice(-3);
	}else{
		hour = hour.slice(-2);
	}
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

function borderColorRemove(){
	$('.content-collapse').each(function(){
			$(this).removeClass('show');
		});
		$('.content-link').each(function(){
			$(this).addClass('collapsed')
		});
}

var nowDates= new Date();
window.onload= function(){
	Clock();
	NowYD();
	dayView(nowDates);
	exView();
}