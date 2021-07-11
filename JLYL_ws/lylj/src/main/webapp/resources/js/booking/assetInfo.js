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
			
	            startD = moment(arg.start).format('YYYY-MM-DD');
	            endD = endD.substr(1, endD.indexOf("T") - 1);
	
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
            if (confirm("일정을 삭제하시겠습니까?")) {
                arg.event.remove()
            }
        },
        eventAdd: function(arg) {

        },
        eventChange: function(arg) {
            AppCalendar.saveEvent("up", arg);
        },
        eventRemove: function(arg) {
            alert("삭제 완료");
        },

        events: function(info, successCallback, failureCallback) {
            $.ajax({
                type: 'GET',
                url: "../schedule/listSchedule",
                dataType: "json",
                success: function(data) {
                    var events = [];
                    $(data).each(function(index) {
                        events.push({
                            title: data[index].title,
                            start: data[index].startDate,
                            end: data[index].endDate,
                            allDay: data[index].allday
                        });

                    });

                    successCallback(events);
                }
            });
        }
    });
    calendar.render();

    $('.add-button').click(function() {
        allSave();
    });



});