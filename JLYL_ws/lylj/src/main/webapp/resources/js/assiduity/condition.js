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
		var departmentNo=$('#departmentNoHidden').val();
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
