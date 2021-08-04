var calendar;
var endD;
var startD;
$(function() {
    var calendarEl = document.getElementById('calendar');
	
	/* FullCalendar 이용한 캘린더 생성 */
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
        select: function(arg) {	// 달력의 날짜를 선택한 경우 
			$.ajax({//일정 목록 불러오기
                      type:'get',
                      url:"listScFolder",
                      dataType: "json",
                      success : function(data) {
							/* 일정 등록 모달에 있는 select(일정목록명)을 셋팅하고 일정목록명에 맞는 컬러 색과 목록번호를 hidden에 각각 넣음 */
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
			
			/* 시작시간 마지막시간 셋팅*/
            startD = moment(arg.start).format('YYYY-MM-DD HH');
            endD = moment(arg.end).format('YYYY-MM-DD HH');
            
			var sh=	moment(arg.start).format('HH');
			var eh=	moment(arg.end).format('HH');
			var sm=	moment(arg.start).format('mm');
			var em=	moment(arg.end).format('mm');
			var st = timeDefault(sh,sm);
			var et = timeDefault(eh,em);
			timeSetting(st,et);
			
			
			/* 데이터픽커 날짜셋팅 */
            $('#startDate').datepicker("setDate", startD);
            $("#endDate").datepicker("option", "minDate", $('#startDate').val());
            $('#endDate').datepicker("setDate", endD);

            

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
        eventClick: function(arg) {	//일정 클릭시 이벤트
			$('#detailScheduleNo').text(arg.event.classNames);
			var scheduleNo=$('#detailScheduleNo').text();
			$.ajax({//해당 스케줄번호의 스케줄 정보 가져오기 
                      type:'POST',
                      url:"selectScheduleByScheduleNo",
                      data:scheduleNo,
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
							/* 스케줄 정보 모달에 출력 */
							$('#detailStart').text("");
							$('#detailEnd').text("");
							$('#detailContent').html("");
							$('#detailFolder').text("");
							
							$('#myDetailModal').modal('show');
							$('#detailTitle').text(data.scvo.scheduleTitle);
							$('#detailStart').text("["+data.scvo.scheduleStart+"] ~ ");
							$('#detailEnd').text("["+data.scvo.scheduleEnd+"]");
							$('#detailColor').val(data.scvo.scheduleColor);
							$('#detailFolder').text(data.scFolderName);
							if(data.scvo.scheduleAllday=="true"){
								$('#detailAllday').text(" 종일");
							}else{
								$('#detailAllday').text("");
							}
							if(data.scvo.scheduleContent!=null){
								var content = data.scvo.scheduleContent.replace(/(?:\r\n|\r|\n)/g, '<br>');
								$('#detailContent').html(content);
							}
                      }
                    });
                    
            /* 모달의 정보삭제 누를 경우 이벤트 삭제 */
            $('#btn-delete').click(function(){
				var scheduleNo=$('#detailScheduleNo').text();
				$.ajax({    
		                      type:'POST',
		                      url:"deleteScheduleByScheduleNo",
		                      data:scheduleNo,
		                      contentType: "application/json; charset=utf-8;",
		                      dataType: "json",
		                      success : function(data) {
									if(arg.event.classNames==scheduleNo){
										arg.event.remove();
									}
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
            
            $.ajax({//스케줄 일정 전체 불러오기 
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

});