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
        editable: false,
        selectable: false,
        locale: "ko",
        nowIndicator: true,
        dayMaxEvents: true,
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
            $.ajax({
                type: 'GET',
                url: "schedule/listSchedule",
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


});