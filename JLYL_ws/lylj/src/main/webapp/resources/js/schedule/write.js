$(function(){
	$('#cancle').click(function(){
		location.href="scheduleMain";
		
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
							$('.edit-select').html(res);
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
                      }
                    });
         $('#myModaldelete').modal('show');
		
	});
	
	/* 목록명 클릭시 해당 체크박스 상태 변환 */
	$('.list-span').click(function(){
		if($(this).prev('.ckSch').prop('checked')){
			$(this).prev('.ckSch').prop('checked',false)
		}else{
			$(this).prev('.ckSch').prop('checked',true)
		}
	});
	
	/* 일정 등록 */
	$('#btWrite').click(function(){
			var startTimes = $('#startTime').val();
           	var stnum= "#option-startTime"+startTimes;
            var startTimes = $(stnum).text();
            
            var endTimes = $('#endTime').val();
            var etnum= "#option-endTime"+endTimes;
            var endTimes = $(etnum).text();
            
            var scheduleTitle = $('#addtitle').val();
            var scheduleStart = $('#startDate').val()+" "+ startTimes;
            var scheduleEnd = $('#endDate').val()+" "+endTimes;
            var scheduleAllday = $('.chk-day').prop('checked');
			
            var scheduleFolderNo = $('#selectMycal').val();
        	var scheduleColor = $('#myBestColor').val()
            
            var scheduleThemeNo =1;
            var empNo = $('#empNo').val();
            var scheduleContent=$('#scheduleContent').val();
            
            $.ajax({//스케줄 등록
                      type:'POST',
                      url:"insertSchedule",
                      data:JSON.stringify({
							  scheduleTitle:scheduleTitle,
                              scheduleStart:scheduleStart,
                              scheduleEnd:scheduleEnd,
                              scheduleAllday:scheduleAllday,
                              scheduleThemeNo:scheduleThemeNo,
                              scheduleFolderNo:scheduleFolderNo,
                              empNo:empNo,
                              scheduleColor:scheduleColor,
                              scheduleContent:scheduleContent
                      }),
                      contentType: "application/json; charset=utf-8;",
                      dataType: "json",
                      success : function(data) {
						swal("일정 등록 성공", "", "success");
                         
                      }
           });
	});
});