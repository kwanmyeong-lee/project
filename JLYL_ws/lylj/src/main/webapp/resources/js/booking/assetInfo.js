var calendar;
var endD;
var startD;
$(function() {
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek'
        },
        navLinks: false, // can click day/week names to navigate views
        businessHours: true, // display business hours
        editable: true,
        selectable: true,
        locale: "ko",
        nowIndicator: true,
        dayMaxEvents: true,
        select: function(arg) {
            var nowTime = new Date();
            startD = moment(arg.start).format('YYYY-MM-DD HH:mm');
			startD = new Date(startD);
			
			if(startD.getTime()-nowTime.getTime()<0){
				swal ( "" , "당일/지난날짜 예약불가능" ,  "error" );
			}else{
	            $('#myModal').modal('show');
	
	            endD = JSON.stringify(arg.end);
			
	            startD = moment(arg.start).format('YYYY-MM-DD HH');
				endD = moment(arg.end).format('YYYY-MM-DD HH');
								
				var sh=	moment(arg.start).format('HH');
				var eh=	moment(arg.end).format('HH');
				var sm=	moment(arg.start).format('mm');
				var em=	moment(arg.end).format('mm');
				var st = timeDefault(sh,sm);
				var et = timeDefault(eh,em);
				timeSetting(st,et);
				
	            /*alert(startD+" "+endD);
	            startD=startD.substr(1,startD.indexOf("T")-1);
	            endD=endD.substr(1,endD.indexOf("T")-1);          
	            
	            $('#startDate').datepicker( "setDate", new Date(startD));
				$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );
				$('#endDate').datepicker( "setDate", new Date(endD));
				*/
	
	            $('#startDate').datepicker("setDate", startD);
	            $("#endDate").datepicker("option", "minDate", $('#startDate').val());
	            $('#endDate').datepicker("setDate", endD);
			}
             /*var title= prompt("일정명:");
        	  if(title){
        		  var obj = new Object();
        		  obj.title = title;
        		  obj.startDate = arg.start;
        		  obj.endDate = arg.end;
        		  obj.allday = arg.allDay;
        		  var jsondata= JSON.stringify(obj);
					
            	  $.ajax({
      				type:'POST',
      				url:"insertSchedule",
      				data:jsondata,
      				contentType: "application/json; charset=utf-8;",
      	            dataType: "json",
      				success : function(data) {
      					alert("성공");
      				}
      			  });
      			  
      			  
            	  
        		  calendar.addEvent({
        			  title:title,
        		  	  start:arg.start,
        		  	  end:arg.end,
        		  	  allDay:arg.allDay
        		  })
        	  }*/ 

        },
        selectOverlap:false,
        buttonText: {
            today: "오늘",
            month: "월별",
            week: "주별",
            day: "일별",
            list: "목록"
        },
        droppable: true,
        drop: function(arg) {},
        eventClick: function(arg) {
        },
        eventAdd: function(arg) {

        },
        eventChange: function(arg) {
        },
        eventRemove: function(arg) {
        },

        events: function(info, successCallback, failureCallback) {
			var bTNo = $('.bTNo').val();
            $.ajax({
                type: 'POST',
                url: "calDrawByBTNo",
                data:{bTNo:bTNo},
                dataType: "json",
                success: function(data) {
                    var events = [];
                    $(data).each(function(index) {
                        events.push({
                            id:data[index].bookingTargetNo,
                            title: data[index].scheduleTitle,
                            start: data[index].scheduleStart,
                            end: data[index].scheduleEnd,
                            allDay: (data[index].scheduleAllday=="true"),
                            color:data[index].scheduleColor,
                            classNames:[data[index].scheduleNo]
                        });

                    });

                    successCallback(events);
                }
            });
        }
    });
    calendar.render();

  
	$('#btdd').click(function(){
		
            var startTimes = $('#startTime').val();
            var stnum= "#option-startTime"+startTimes;
            var startTimes = $(stnum).text();
            
            var endTimes = $('#endTime').val();
            var etnum= "#option-endTime"+endTimes;
            var endTimes = $(etnum).text();
            
            var scheduleTitle = "["+$('.empNo').val()+"] "+$('.empName').val();
            var scheduleStart = $('#startDate').val()+" "+ startTimes;
            var scheduleEnd = $('#endDate').val()+" "+ endTimes;
            var scheduleAllday = $('.chk-day').prop('checked');

            var scheduleFolderNo = $('.bFNo').val();
        	var scheduleColor = "#2b97a7";
            
            var scheduleThemeNo =2;
            var empNo = $('.empNo').val();
            var scheduleContent = $('#scheduleContent').val();
            var bookingTargetNo = $('.bTNo').val();
            $.ajax({    
                      type:'POST',
                      url:"insertSchedule",
                      data:JSON.stringify({scheduleTitle:scheduleTitle,
                              scheduleStart:scheduleStart,
                              scheduleEnd:scheduleEnd,
                              scheduleAllday:scheduleAllday,
                              scheduleThemeNo:scheduleThemeNo,
                              scheduleFolderNo:scheduleFolderNo,
                              empNo:empNo,
                              scheduleColor:scheduleColor,
                              scheduleContent:scheduleContent,
                              bookingTargetNo:bookingTargetNo
                      }),
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
                          calendar.addEvent({
							    id:bookingTargetNo,
	                            title: scheduleTitle,
	                            start: scheduleStart,
	                            end: scheduleEnd,
	                            allDay: (scheduleAllday=="true"),
	                            color:scheduleColor,
	                            classNames:[data]
                          });
                          $('#myModal').modal('hide');
                      }
                    });
                
	});


});