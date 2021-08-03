$(function() {
    $('.btnSchAdd').click(function() {
        location.href = "write";
    });

    $('#btn-write').click(function(){
		location.href ="write";
	});
	
    
	/* 일정 등록시 */
    $('#btn-add').click(function(){
		if($('#addtitle').val()==""){
			swal ( "" , "일정명을 입력하세요" ,  "error" );
		}else if($('#selectMycal').val()=="" || $('#selectMycal').val()==null){
			swal ( "" , "내 캘린더를 등록하세요" ,  "error" );
		}else{
            /* 일정명, 일정 시작날짜와시간,일정 마지막날짜시간, 종일여부 이용하여 일정 등록 */
            var startTimes = $('#startTime').val();
            var stnum= "#option-startTime"+startTimes;
            var startTimes = $(stnum).text();
            
            var endTimes = $('#endTime').val();
            var etnum= "#option-endTime"+endTimes;
            var endTimes = $(etnum).text();
            
            var scheduleTitle = $('#addtitle').val();
            var scheduleStart = $('#startDate').val()+" "+ startTimes;
            var scheduleEnd = $('#endDate').val()+" "+ endTimes;
            var scheduleAllday = $('.chk-day').prop('checked');

            var scheduleFolderNo = $('#selectMycal').val();
            var sccolor = "#hiddenMycal"+scheduleFolderNo;
        	var scheduleColor = $(sccolor).val()
            
            var scheduleThemeNo =1;
            var empNo = $('#empNo').val();
            
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
                              scheduleColor:scheduleColor
                      }),
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
						/* 일정 등록 성공 후 달력에 event 추가 */
						var listCheck = "#scFolNo"+scheduleFolderNo;
						if($(listCheck).prev().prev().prop('checked')){
                          calendar.addEvent({
							  id:scheduleFolderNo,
                              title:scheduleTitle,
                                start:scheduleStart,
                                end:scheduleEnd,
                                allDay:(scheduleAllday==true),
                                color:scheduleColor,
                            	classNames:[data]
                          });
                        }
                          $('#myModal').modal('hide');
                      }
                    });
                 }
	});
	
	$('#cal-add').click(function(){
		$('#myModaladd').modal('show');
	});
	
	/* 일정 목록 수정 */
	$('#cal-edit').click(function(){
		$.ajax({    
                      type:'get',
                      url:"listScFolder",
                      dataType: "json",
                      success : function(data) {
							var res="";
							$(data).each(function(index) {
								res+='<option value="'+data[index].scheduleFolderNo+'">'+data[index].scheduleFolderName+'</option>';
							});
							$('.edit-select').html(res);
                      }
                    });
		
		$('#myModaledit').modal('show');
	});
	
	/* 일정 목록 삭제 */
	$('#cal-delete').click(function(){
		$.ajax({    
                      type:'get',
                      url:"listScFolder",
                      dataType: "json",
                      success : function(data) {
							var res="";
							$(data).each(function(index) {
								res+='<option value="'+data[index].scheduleFolderNo+'">'+data[index].scheduleFolderName+'</option>';
							});
							$('.del-select').html(res);
                      }
                    });
         $('#myModaldelete').modal('show');
		
	});
	
	/* nav-itme에 일정목록명 클릭할 경우 앞의 checkbox 상태에 따라 달력의 일정 제거 또는 생성*/
	$(document).on("click",".list-span",function(){
		var texts=$(this).next().val();
		var event2 = calendar.getEventById(texts);
		if($(this).prev('.ckSch').prop('checked')){//해당 목록명 앞 체크박스가 체크되어 있는 경우 체크 해지후 목록명이 같은 달력의 event 전체 삭제
			$(this).prev('.ckSch').prop('checked',false);
			$.ajax({    
                      type:'POST',
                      url:"listScheduleByScFolderNo",
                      data:texts,
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
							$(data).each(function() {
								event2 = calendar.getEventById(texts);
        		                event2.remove();
                    		});   
                      }
                    });
			
			
		}else{//체크박스가 해지되어있는 경우 해당 목록명과 같은 event 달력에 생성
			$(this).prev('.ckSch').prop('checked',true);		
			$.ajax({    
                      type:'POST',
                      url:"listScheduleByScFolderNo",
                      data:texts,
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
	
							$(data).each(function(index) {
        		                calendar.addEvent({
									id:data[index].scheduleFolderNo,
		                            title: data[index].scheduleTitle,
		                            start: data[index].scheduleStart,
		                            end: data[index].scheduleEnd,
		                            allDay: (data[index].scheduleAllday=="true"),
		                            color:data[index].scheduleColor,
                            		classNames:[data[index].scheduleNo]
                        		});

                    		});   
                      }
                    });
			}
	});
	
	/* 체크박스 상태에 따른 해당 일정목록명과 동일한 event 달력에서 제거, 생성 (위와 동일)*/
	$(document).on("change",".ckSch",function(){
		var texts=$(this).next().next().val();
		var event2 = calendar.getEventById(texts);
		if(!$(this).prop('checked')){
			$.ajax({    
                      type:'POST',
                      url:"listScheduleByScFolderNo",
                      data:texts,
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
							$(data).each(function() {
								event2 = calendar.getEventById(texts);
        		                event2.remove();
                    		});   
                      }
                    });
		}else{
			$.ajax({    
                      type:'POST',
                      url:"listScheduleByScFolderNo",
                      data:texts,
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
	
							$(data).each(function(index) {
        		                calendar.addEvent({
									id:data[index].scheduleFolderNo,
		                            title: data[index].scheduleTitle,
		                            start: data[index].scheduleStart,
		                            end: data[index].scheduleEnd,
		                            allDay: (data[index].scheduleAllday=="true"),
		                            color:data[index].scheduleColor,
                            		classNames:[data[index].scheduleNo]
                        		});

                    		});   
                      }
                    });
			}
		
	});
	
	
	
});


