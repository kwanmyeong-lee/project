$(function() {
		$.datepicker.setDefaults({
				closeText : "닫기",
				currentText : "오늘",
				prevText : '이전 달',
				nextText : '다음 달',
				showOtherMonths: true,
				showMonthAfterYear:true,
				changeYear:true,
				changeMonth:true,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
						'7월', '8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				weekHeader : "주",
				yearSuffix : '년',
				dateFormat:'yy-mm-dd'
		});
		
		$('#startDate').datepicker();
		$('#startDate').datepicker("setDate","today");
		
		$('#endDate').datepicker();
		$('#endDate').datepicker("setDate","today");

		$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );		
		$('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#endDate").datepicker( "option", "minDate", selectedDate );
	        timeChange();
	    });
	    
	    $('.chk-day').change(function() {
	        if ($(this).prop('checked')) {
	            $('.selectTime').hide();
	        } else {
	            $('.selectTime').show();
	        }
	    });
	
	    $('#startTime').change(function() {
	        timeChange();
	    });
	
	    $('#endDate').change(function() {
	        timeChange();
	    });
	
	    $('#startDate').change(function() {
	        timeChange();
	    });
	    
	    $('#btnAdd').click(function(){
		if($(this).parent().prev().find('input[name=scheduleFolderName]').val()==""){
			swal ( "" , "일정목록명을 입력하세요" ,  "error" );
		}else{
			$.ajax({    
                      type:'POST',
                      url:"insertScFolder",
                      data:$('#listAdd').serializeArray(),
                      dataType: "json",
                      success : function(data) {
							var res="";
							var dataSize =-1; 
							$(data).each(function() {
								dataSize++;
							});
							res+='<li class="nav-item">'
									+'<a class="nav-link" href="#"><input type="checkbox" class="ckSch" checked="checked">'
                    				+'<span class="list-span">'+data[dataSize].scheduleFolderName+'</span>'
                    				+'<input type="hidden" id="scFolNo'+data[dataSize].scheduleFolderNo+'" value="'+data[dataSize].scheduleFolderNo+'">'
                    				+'</a></li>';
						  $('#scFolList').append(res);
                          $('#myModaladd').modal('hide');
                          
                          if($('#hWrite').text()=="일정등록"){
							res="";
							$(data).each(function(index) {
								res+='<option value="'+data[index].scheduleFolderNo+'">'+data[index].scheduleFolderName+'</option>';
							});
							$('#selectMycal').html(res);
						  }
                      }
                    });
              }
		});
		
		$('#btnEdit').click(function(){
			$.ajax({    
                      type:'POST',
                      url:"updateScFolder",
                      data:$('#listEd').serializeArray(),
                      dataType: "json",
                      success : function(data) {
							var res="";
							var scFNo=$('#listEd').find('select[name=scheduleFolderNo]').val();
							var scFoNo="#scFolNo"+scFNo;
							var scFName=$('#listEd').find('input[name=scheduleFolderName]').val();
							
							res+='<input type="checkbox" class="ckSch" checked="checked">'
                    				+'<span class="list-span">'+scFName+'</span>'
                    				+'<input type="hidden" id="scFolNo'+scFNo
                    				+'" value="'+scFNo+'">';
							
							$(scFoNo).parent().html(res);
							
							$(data.list).each(function(index) {
								var texts = data.list[index].scheduleFolderNo;
								event2 = calendar.getEventById(texts);
								if(event2==null)
									return;
        		                event2.remove();
                    		});
                    		
							$(data.list).each(function(index) {
								calendar.addEvent({
									id:data.list[index].scheduleFolderNo,
		                            title: data.list[index].scheduleTitle,
		                            start: data.list[index].scheduleStart,
		                            end: data.list[index].scheduleEnd,
		                            allDay: (data.list[index].scheduleAllday=="true"),
		                            color:data.list[index].scheduleColor,
                            		classNames:[data.list[index].scheduleNo]
                        		});
                    		});
                    		
                    		if($('#hWrite').text()=="일정등록"){
							res="";
							$(data.sfList).each(function(index) {
								res+='<option value="'+data.sfList[index].scheduleFolderNo+'">'+data.sfList[index].scheduleFolderName+'</option>';
							});
							$('#selectMycal').html(res);
						  	}
							
                          	$('#myModaledit').modal('hide');
                      }
                    });
		});
		
		$('#btnDelete').click(function(){
			$.ajax({    
                      type:'POST',
                      url:"deleteScFolder",
                      data:$('#listDel').serializeArray(),
                      dataType: "json",
                      success : function(data) {
							var res="";
							var scFNo=$('#listDel').find('select[name=scheduleFolderNo]').val();
							var scFoNo="#scFolNo"+scFNo;
							var scFName=$('#listDel').find('input[name=scheduleFolderName]').val();
							
							$(scFoNo).parent().parent().remove();
							
							$(data.list).each(function(index) {
								var texts = data.list[index].scheduleFolderNo;
								event2 = calendar.getEventById(texts);
								if(event2==null)
									return;
        		                event2.remove();
                    		});  
                    		
                    		if($('#hWrite').text()=="일정등록"){
							res="";
							$(data.sfList).each(function(index) {
								res+='<option value="'+data.sfList[index].scheduleFolderNo+'">'+data.sfList[index].scheduleFolderName+'</option>';
							});
							$('#selectMycal').html(res);
						  	}
                    		
                          	$('#myModaldelete').modal('hide');
                      }
                    });
		});
		
});

function timeChange() {
    var startday = new Date($('#startDate').val());
    var endday = new Date($('#endDate').val());
    var btday = startday.getTime() - endday.getTime();

    if (btday < 0) {
        for (var i = 0; i < 48; i++) {
            var showTime = '#option-endTime' + i;
            $(showTime).show();
        }
    } else if (btday == 0) {
        var selectStartTime = Number($('#startTime').val());
        var selectEndTime = Number($('#endTime').val());
        if (selectStartTime > selectEndTime) {
            $('#endTime').val(selectStartTime).prop('selectded', true);
        }
        for (var i = 0; i < selectStartTime; i++) {
            var hideTime = '#option-endTime' + i;
            $(hideTime).hide();
        }
        for (var i = selectStartTime; i < 48; i++) {
            var showTime = '#option-endTime' + i;
            $(showTime).show();
        }
    }
}

function timeDefault(h,m){
	var thour = Number(h);
	var tmin=0; 
	
	if(Number(m)==30){
		tmin = 1;
	}
	thour*=2;
	thour+=tmin;
	return thour;  
}

function timeSetting(st,et) {
    $('#startTime').val(st).prop('selectded', true);
    $('#endTime').val(et).prop('selectded', true);

    for (var i = 0; i < st; i++) {
         var hideTime = '#option-endTime' + i;
         $(hideTime).hide();
    }
    for (var i = st; i < 48; i++) {
         var showTime = '#option-endTime' + i;
         $(showTime).show();
    }
}
