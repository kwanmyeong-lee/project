$(function() {
    $('.btnSchAdd').click(function() {
        location.href = "write";
    });

    $('#btn-write').click(function(){
		location.href ="write";
	});
    $('#btn-add').click(function(){
		if($('#addtitle').val()==""){
			swal ( "" , "일정명을 입력하세요" ,  "error" )
		}else{
            /*var scheduleTitle = $('#addtitle').val();
            var scheduleStart = $('#startDate').val();
            var scheduleEnd = $('#endDate').val();
            var scheduleAllday = $('.chk-day').prop('checked');
            /*var scheduleColor =
            /*var scheduleFolderNo =
            var scheduleThemeNo =1 ;
            var empNo ="${sessionScope.empNo}";*/
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
						var listCheck = "#scFolNo"+scheduleFolderNo;
						if($(listCheck).prev().prev().prop('checked')){
                          calendar.addEvent({
							  id:scheduleFolderNo,
                              title:scheduleTitle,
                                start:scheduleStart,
                                end:scheduleEnd,
                                allDay:(scheduleAllday=="true"),
                                color:scheduleColor
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
							$('.del-select').html(res);
                          $('#myModaladd').modal('hide');
                      }
                    });
		
		$('#myModaledit').modal('show');
	});
	
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
                          $('#myModaladd').modal('hide');
                      }
                    });
         $('#myModaldelete').modal('show');
		
	});
	
	$('.list-span').click(function(){
		var texts=$(this).next().val();
		var event2 = calendar.getEventById(texts);
		if($(this).prev('.ckSch').prop('checked')){
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
			
			
		}else{
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
		                            color:data[index].scheduleColor
                        		});

                    		});   
                      }
                    });
			}
	});
	
	$(".ckSch").change(function(){
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
		                            color:data[index].scheduleColor
                        		});

                    		});   
                      }
                    });
			}
		
	});
	
	
	
});


