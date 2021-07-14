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
	
	$('#todayYearMonth').click(function(){
		var nd = new Date();
		nd= moment(nd).format("YYYY-MM");

		$('#nowYearMonth').text(nd);
		dayView(nd);
	});
	
	$('#btnCome').click(function(){
		var now = $('#clockTime').text();
		
		$('#comeTime').text(now);
		$(this).prop("disabled",true);
		var comeNum = hourMin(now);
		
		var comef="#content-td"+comeNum;
		
		var nDate=new Date();
		var weekNum= getWeekOfMonth(nDate);
		var weekDay=moment(nDate).format('d');
		
		var parent="#content"+weekNum+"Div"+weekDay;
		
		$(parent).find(comef).css("background","blue");
		
		
	});
		
	$('#btnLeave').click(function(){
		if($('#btnCome').prop("disabled")==true){
			var now = $('#clockTime').text();
			$('#leaveTime').text(now);
			$(this).prop("disabled",true);
			
			var cTime = $('#comeTime').text();
			var lTime = $('#leaveTime').text();
			var dayWorkTime=workTime(cTime,lTime);
			
			$('#dayWorkTime').text(dayWorkTime);
			
			
			var comeNum = hourMin("08:24:00");
			var leaveNum = hourMin(now);
			
			
			var nDate=new Date();
			var weekNum= getWeekOfMonth(nDate);
			var weekDay=moment(nDate).format('d');
			
			var parent="#content"+weekNum+"Div"+weekDay;

			for(var i=comeNum; i<=leaveNum; i++){
				var comef="#content-td"+i;
				$(parent).find(comef).css("background","blue");
			}
		}else{
			alert("출근을 하세요");
		}
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
			var pastDay=firstDay;
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

