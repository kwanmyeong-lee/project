$(function() { // document ready
	
	/* 캘린더 */
    $('#calendar').fullCalendar({
        header: {
            left: 'promptResource today prev,next',
            center: 'title',
            right: 'basicWeek,timelineDay'
        },
        contentHeight: 'auto', // 높이 자동  
        buttonText: {
            today: "오늘",
            month: "월별",
            week: "주별",
            day: "일별",
            list: "목록"
        },
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
        dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
        titleFormat: {
            month: "YYYY년 MMMM",
            week: "(YYYY-MM-DD)",
            day: " YYYY-MM-DD [(]ddd[)]"
        },

        resourceAreaWidth: '10%',
        defaultView: 'timelineDay',
        resourceLabelText: '예약 대상',
        scrollTime: '00:00:00',
        resources: function(callback) {
			/* 자산 List 가져와 달력에 표시 */
			$.ajax({//자산 List 반환
                type: 'GET',
                url: "calDraw",
                dataType: "json",
                success: function(data) {
                    var events = [];
                    $(data).each(function(index) {
                        events.push({
							id:data[index].bookingTargetNo,
                            title: data[index].bookingTargetName,
                        });
                    });
                    callback(events);
                }
        	});
  		},
  		events: function(start, end, timezone, callback) {
			/* 모든 자산의 스케쥴 List 가져와 달력에 표시 */
		    $.ajax({//모든 자산의 스케쥴 List
			  type: 'GET',
		      url: 'selectAllSchedule',
		      dataType: 'json',
		      success: function(data) {
		        var events = [];
		        $(data).each(function(index) {
		          events.push({
		            id:data[index].bookingTargetNo,
	                resourceId: data[index].bookingTargetNo,
                    title: data[index].scheduleTitle,
                    start: data[index].scheduleStart,
                    end: data[index].scheduleEnd,
                    allDay: (data[index].scheduleAllday=="true"),
                    color:data[index].scheduleColor
		          });
		        });
		        callback(events);
		      }
		    });
		 },
        slotLabelFormat: ['HH'] // 시간 칼럼 표시방법
    });
});

/* 캘린더 다시 그리기 */
function reloadCal(){
	$('#calendar').fullCalendar({
        header: {
            left: 'promptResource today prev,next',
            center: 'title',
            right: 'basicWeek,timelineDay'
        },
        contentHeight: 'auto', // 높이 자동  
        buttonText: {
            today: "오늘",
            month: "월별",
            week: "주별",
            day: "일별",
            list: "목록"
        },
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
        dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
        titleFormat: {
            month: "YYYY년 MMMM",
            week: "(YYYY-MM-DD)",
            day: " YYYY-MM-DD [(]ddd[)]"
        },

        resourceAreaWidth: '10%',
        defaultView: 'timelineDay',
        resourceLabelText: '예약 대상',
        scrollTime: '00:00:00',
        resources: function(callback) {
	
    			$.ajax({
                type: 'GET',
                url: "calDraw",
                dataType: "json",
                success: function(data) {
                    var events = [];
                    $(data).each(function(index) {
                        events.push({
							id:data[index].bookingTargetNo,
                            title: data[index].bookingTargetName,
                        });

                    });
					
                    callback(events);
                }
            });
  		},
  		events: function(start, end, timezone, callback) {
		    $.ajax({
			  type: 'GET',
		      url: 'selectAllSchedule',
		      dataType: 'json',
		      success: function(data) {
		        var events = [];
		        $(data).each(function(index) {
		          events.push({
		            id:data[index].bookingTargetNo,
	                resourceId: data[index].bookingTargetNo,
                    title: data[index].scheduleTitle,
                    start: data[index].scheduleStart,
                    end: data[index].scheduleEnd,
                    allDay: (data[index].scheduleAllday=="true"),
                    color:data[index].scheduleColor
		          });
		        });
		        callback(events);
		      }
		    });
		 },
        slotLabelFormat: ['HH'] // 시간 칼럼 표시방법
    });
}