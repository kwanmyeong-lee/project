$(function() { // document ready

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
        events: [{
                id: '1',
                resourceId: 'b',
                start: '2021-07-10 02:00:00',
                end: '2021-07-10 07:00:00',
                title: 'yyy'
            },
            {
                id: '2',
                resourceId: 'c',
                start: '2021-07-10 05:00:00',
                end: '2021-07-10 22:00:00',
                title: 'event 2'
            },
            {
                id: '3',
                resourceId: 'd',
                start: '2021-07-10',
                end: '2021-07-10',
                title: 'event 3'
            },
            {
                id: '4',
                resourceId: 'e',
                start: '2021-07-10T03:00:00',
                end: '2021-07-10T08:00:00',
                title: 'event 4'
            },
            {
                id: '5',
                resourceId: 'f',
                start: '2021-07-10T00:30:00',
                end: '2021-07-10T02:30:00',
                title: 'event 5',
                color: 'blue'
            }
        ],
        /*selectable: true,
        select: function(start, end, event, view, resource) {
            $('#myModal').modal('show');
            var title = prompt("일정명:");
            var resourceId = resource.id
            if (title) {
                $('#calendar').fullCalendar('renderEvent', {
                    title: title,
                    start: start,
                    end: end,
                    resourceId: resourceId,
                }, true);
            }

        },

        eventClick: function(calEvent, jsEvent, view) {
            if (confirm("일정을 삭제하시겠습니까?")) {
                var calEvents = calEvent.id;
                alert(calEvents);
                $('#calendar').fullCalendar('removeEvents', calEvents);
            }
        },*/
        slotLabelFormat: ['HH'] // 시간 칼럼 표시방법
    });
});