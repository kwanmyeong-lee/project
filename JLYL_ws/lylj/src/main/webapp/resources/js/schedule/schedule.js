var calendar;
var endD;
var startD;
$(function() {
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        },
        navLinks: true, // can click day/week names to navigate views
        businessHours: true, // display business hours
        editable: true,
        selectable: true,
        locale: "ko",
        nowIndicator: true,
        dayMaxEvents: true,
        select: function(arg) {	
			$.ajax({    
                      type:'get',
                      url:"listScFolder",
                      dataType: "json",
                      success : function(data) {
							var res="";
							var resC="";
							$(data).each(function(index) {
								res+='<option value="'+data[index].scheduleFolderNo+'">'+data[index].scheduleFolderName+'</option>';
								resC+='<input type="hidden" id="hiddenMycal'+data[index].scheduleFolderNo+'" value="'+data[index].scheduleFolderColor+'">';
							});
							
							$('#selectFolcol').html(resC);
							$('#selectMycal').html(res);
                      }
                    });
                    
            $('#myModal').modal('show');
			
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
			$('#endDate').datepicker( "setDate", new Date(endD));*/


            $('#startDate').datepicker("setDate", startD);
            $("#endDate").datepicker("option", "minDate", $('#startDate').val());
            $('#endDate').datepicker("setDate", endD);

            /* var title= prompt("일정명:");
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
        	  } */

        },
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
			$('#detailScheduleNo').text(arg.event.classNames);
			var scheduleNo=$('#detailScheduleNo').text();
			$.ajax({    
                      type:'POST',
                      url:"selectScheduleByScheduleNo",
                      data:scheduleNo,
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
							$('#detailStart').text("");
							$('#detailEnd').text("");
							$('#detailContent').html("");
							$('#detailFolder').text("");
							
							$('#myDetailModal').modal('show');
							$('#detailTitle').text(data.scvo.scheduleTitle);
							$('#detailStart').text(data.scvo.scheduleStart);
							$('#detailEnd').text(data.scvo.scheduleEnd);
							$('#detailFolder').text(data.scFolderName);
							if(data.scvo.scheduleContent!=null){
								var content = data.scvo.scheduleContent.replace(/(?:\r\n|\r|\n)/g, '<br>');
								$('#detailContent').html(content);
							}
                      }
                    });
                    
            $('#btn-delete').click(function(){
				$.ajax({    
		                      type:'POST',
		                      url:"deleteScheduleByScheduleNo",
		                      data:scheduleNo,
		                      contentType: "application/json; charset=utf-8;",
		                      dataType: "json",
		                      success : function(data) {
									arg.event.remove();
									$('#myDetailModal').modal('hide');
		                      }
		             });
			});
            
        },
        eventAdd: function(arg) {

        },
        eventChange: function(arg) {
	
        },
        eventRemove: function(arg) {
        },

        events: function(info, successCallback, failureCallback) {
            
            $.ajax({
                type: 'GET',
                url: "listSchedule",
                dataType: "json",
                success: function(data) {
                    var events = [];
                    $(data).each(function(index) {
                        events.push({
							id:data[index].scheduleFolderNo,
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
        },
        eventDidMount: function(info) {
 				 
		}
        	
    });
    calendar.render(); 	

    $('.add-button').click(function() {
        allSave();
    });



});