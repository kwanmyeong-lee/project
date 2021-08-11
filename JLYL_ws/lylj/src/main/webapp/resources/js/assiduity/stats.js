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
			
			statsViewAjax(1,0);
		});
		$('#btDepart').click(function(){
			var searchDepartText = $("#searchDepart").val();
			$('#termsBtn3').text("부서명: "+searchDepartText);
			$('#sDepart').val(searchDepartText);
			
			statsViewAjax(1,0);
			
		});
		$('#btDate').click(function(){
			var startDateText = $('#startDate').val();
			var endDateText = $('#endDate').val();
			$('#termsBtn4').text("날짜: "+startDateText+" - "+endDateText);
			$('#sDate').val(startDateText);
			$('#eDate').val(endDateText);
			
			statsViewAjax(1,0);
					
			
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
			
			statsViewAjax(1,0);
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
			statsViewAjax(1,0);
			
		});
		$('#todayYearMonth').click(function(){
			NowYD();
			$('#sDate').val("");
			$('#eDate').val("");
			$('#termsBtn4').text("날짜:");
			statsViewAjax(1,0);
			
		});
		
		$(document).on('click','.px-1',function(){
			var empNo = $('#empNoHidden').val();
			var currentPage = $(this).text();
			var btCheck =0;
			
			statsViewAjax(currentPage, btCheck);
		});
		
		$(document).on('click','.ar-forward',function(){
			var currentPage = $('.px-1').eq(0).text();
			var empNo = $('#empNoHidden').val();
			var btCheck=1;
			
			statsViewAjax(currentPage, btCheck);
		});
		
		$(document).on('click','.ar-backward',function(){
			var currentPage = $('.px-1').eq(0).text();
			var empNo = $('#empNoHidden').val();
			var btCheck=2;
			
			statsViewAjax(currentPage, btCheck);
		});
		$('#xlsDown').click(function(){
			var str = "../download/stats?selectDate="+$('#nowYearMonth').text();
			location.href=str;
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
	
	function statsViewAjax(currentPage,btCheck){
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
				selectDate : selectDate,
				currentPage : currentPage,
				btCheck : btCheck
			},
			dataType:"json",
			beforeSend: function() {
       			 $('.loading').show();
    		},
    		complete: function() {
		        $('.loading').hide();
		    },
			success: function(data){
				var str = "";
				var comeNum=0;
				var leaveNum=0;
				var absenceNum =0;
				var excessNum=0;
				if(data.conditionList.length>0){
					for(var i=0; i<data.conditionList2.length;i++){
						str +='<tr>';
						str +='<td class="ann-td">'+data.conditionList2[i].empName+'</td>';
						str +='<td class="ann-td">'+data.conditionList2[i].departmentName+'</td>';
						str +='<td class="ann-td">'+moment(data.conditionList2[i].attendanceDayRegdate).format("YYYY-MM-DD")+'</td>';
						str +='<td class="ann-td">'+moment(data.conditionList2[i].attendanceDayOnHour).format("HH:mm:ss")+'</td>';
						str +='<td class="ann-td">'+moment(data.conditionList2[i].attendanceDayOffHour).format("HH:mm:ss")+'</td>';
						str +='</tr>';
						
					}
					for(var i=0; i<data.conditionList.length;i++){
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
					var month = selectDate.substring(5,7);
					var eDay = new Date(year,month,0);
					var presentDate = new Date();
					 var sumDay = 0;
					 
					if(startDate!=null && startDate!=""){
						sumDay=weekdayCnt(startDate,endDate);
					}else if(presentDate.getFullYear()==year && presentDate.getMonth()==Number(month)-1){
						sumDay=weekdayCnt(selectDate,presentDate);
					}else{
						sumDay=weekdayCnt(selectDate,eDay);
					}
					
					absenceNum = sumDay*data.empCnt-data.conditionList.length;
					if(absenceNum>0){
	           			$('#absenceNum').text(absenceNum);
	           		}else{
	           			$('#absenceNum').text(0);
					}
	           		$('#pDataCheck').text(data.conditionList.length+"개의 정보가 있습니다.");
	           		$('#leaveNum').text(leaveNum);
	           		$('#comeNum').text(comeNum);
	           		$('#excessNum').text(excessNum);
	           		$('#breakNum').text(data.breakCnt);
	           		
				}else{
					str+='<tr><td colspan="5" align="center">정보 없음</td></tr>';
					$('#pDataCheck').text("결과 없음");
	           		$('#absenceNum').text(0);
	           		$('#leaveNum').text(0);
	           		$('#comeNum').text(0);
	           		$('#excessNum').text(0);
	           		$('#breakNum').text(0);
				}
				
				$('#viewTBody').html(str);
				
				var pageStr="";
	        	if(data.pagingInfo.firstPage>1){
	        		pageStr+='<a class="arrow ar-backward" href="#"><i class="fas fa-backward"></i></a>'
	        	}
				for(var i=data.pagingInfo.firstPage; i<=data.pagingInfo.lastPage; i++){
					if(i==data.pagingInfo.currentPage){
						pageStr+='<a class="px-1 active" href="#">';
						pageStr+=i;
						pageStr+='</a>';
					}else{
						pageStr+='<a class="px-1" href="#" >';
						pageStr+=i;
						pageStr+='</a>';
					}
				}
				if(data.pagingInfo.lastPage<data.pagingInfo.totalPage){
					pageStr+='<a class="arrow ar-forward" href="#"><i class="fas fa-forward"></i></a>'
				}

				
	        	
	        	$('.page_nation').html(pageStr);
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
	
	function weekdayCnt(stDate,enDate){
		var date1 = new Date(stDate); // 2017-11-30
	    var date2 = new Date(enDate); // 2017-12-6
	    var count = 0;

		while(true) {  
		
		
		    var temp_date = date1;
		    if(temp_date.getTime() > date2.getTime()) {
		        console.log("count : " + count);
		        break;
		    } else {
		        var tmp = temp_date.getDay();
		        if(tmp == 0 || tmp == 6) {
		            // 주말
		            console.log("주말");
		        } else {
		            // 평일
		            console.log("평일");
		            count++;         
		        }
		        temp_date.setDate(date1.getDate() + 1); 
		    }
		}
		return count;
	}
	
	window.onload = function() {
	    Clock();
	    NowYD();
	    statsViewAjax(1,0);
	}	