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
            
            var scheduleTitle = $('#addtitle').val();
            var scheduleStart = $('#startDate').val();
            var scheduleEnd = $('#endDate').val();
            var scheduleAllday = $('.chk-day').prop('checked');
            var scheduleFolderNo = 1;
            var scheduleThemeNo =1 ;
            var empNo =1;
            $.ajax({    
                      type:'POST',
                      url:"insertSchedule",
                      data:JSON.stringify({scheduleTitle:scheduleTitle,
                              scheduleStart:scheduleStart,
                              scheduleEnd:scheduleEnd,
                              scheduleAllday:scheduleAllday,
                              scheduleThemeNo:scheduleThemeNo,
                              empNo:empNo
                      }),
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
                          calendar.addEvent({
                              title:scheduleTitle,
                                start:scheduleStart,
                                end:scheduleEnd,
                                allDay:scheduleAllday
                          });
                          $('#myModal').modal('hide');
                      }
                    });
                 }
	});
	$('#cal-add').click(function(){
		$('#myModaladd').modal('show');
	});
	
	$('#cal-edit').click(function(){
		$('#myModaledit').modal('show');
	});
	
	$('#cal-delete').click(function(){
		$('#myModaldelete').modal('show');
	});
	
	$('.list-span').click(function(){
		if($(this).prev('.ckSch').prop('checked')){
			$(this).prev('.ckSch').prop('checked',false)
		}else{
			$(this).prev('.ckSch').prop('checked',true)
		}
	});
	
	
	
});

