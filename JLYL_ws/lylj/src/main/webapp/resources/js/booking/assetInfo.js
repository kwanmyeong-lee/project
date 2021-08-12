var calendar;
var endD;
var startD;

$(function() {
    var calendarEl = document.getElementById('calendar');
	/* 캘린더 */
    calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek'
        },
        navLinks: false, // can click day/week names to navigate views
        businessHours: true, // display business hours
        editable: false,
        selectable: true,
        locale: "ko",
        nowIndicator: true,
        dayMaxEvents: true,
        select: function(arg) {
			/* 날짜 선택 */
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
	
	            $('#startDate').datepicker("setDate", startD);
	            $("#endDate").datepicker("option", "minDate", $('#startDate').val());
	            $('#endDate').datepicker("setDate", endD);
			}

        },
        selectOverlap:false,
        buttonText: {
            today: "오늘",
            month: "월별",
            week: "주별",
            day: "일별",
            list: "목록"
        },
        droppable: false,
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
			/* 해당 자산의 예약된 스케줄 List event로 만듬 */
			var bTNo = $('.bTNo').val();
            $.ajax({//예약 스케줄List 반환
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

  	/* 해당 자산 예약하기 */
	$('#btdd').click(function(){
			/* 입력 받은 자산 정보 */
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
            $.ajax({//예약등록    
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
						  if(data==-1){
							alert("이미 예약된 날짜가 있습니다.")
						  }
						  else{
						  /* 등록한 정보 event로 추가 */
                          calendar.addEvent({
							    id:bookingTargetNo,
	                            title: scheduleTitle,
	                            start: scheduleStart,
	                            end: scheduleEnd,
	                            allDay: (scheduleAllday==true),
	                            color:scheduleColor,
	                            classNames:[data]
                          });
                          $('#myModal').modal('hide');
                          }
                      }
                    });
                
	});
	
	var todate = new Date();
	todate.setDate(todate.getDate()+1);
	$("#startDate").datepicker( "option", "minDate", todate);//startDate의 날짜보다 전의 날짜 선택 불가능


});