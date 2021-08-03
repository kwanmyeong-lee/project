$(function() {
		/* 데이터픽커 설정*/
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
		
		/*statrtDate에 datepiccker 적용 */
		$('#startDate').datepicker();
		$('#startDate').datepicker("setDate","today"); // 날짜를 오늘로 셋팅
		$('#endDate').datepicker();
		$('#endDate').datepicker("setDate","today");
		
		/* endDate의 datepicker 옵션 변경 */
		$("#endDate").datepicker( "option", "minDate", $('#startDate').val() );//startDate의 날짜보다 전의 날짜 선택 불가능
		$('#startDate').datepicker("option", "onClose", function ( selectedDate ) { //startDate의 데이터픽커가 닫히면 function실행
	        $("#endDate").datepicker( "option", "minDate", selectedDate );//닫힐때의 startDate값보다 전의 날짜 선택 불가능
	        timeChange();
	    });
	    
	    /* .chk-day(체크박스)가 변할경우 시간 선택창 보임,숨김*/
	    $('.chk-day').change(function() {
	        if ($(this).prop('checked')) {
	            $('.selectTime').hide();
	        } else {
	            $('.selectTime').show();
	        }
	    });
	
		/* 내용이 변경 될 경우 시간 맞춤 */
	    $('#startTime').change(function() {
	        timeChange();
	    });
	
	    $('#endDate').change(function() {
	        timeChange();
	    });
	
	    $('#startDate').change(function() {
	        timeChange();
	    });
	    
	    /* 일정 목록 등록 */
	    $('#btnAdd').click(function(){
		if($(this).parent().prev().find('input[name=scheduleFolderName]').val()==""){ //타이틀 미입력시 등록x
			swal ( "" , "일정목록명을 입력하세요" ,  "error" );
		}else{
			$.ajax({    
                      type:'POST',
                      url:"insertScFolder",
                      data:$('#listAdd').serializeArray(),
                      dataType: "json",
                      success : function(data) {
							/* 등록 성공시 nav-item에 추가된 일정 목록을 추가 */
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
                          
                          /* 일정 등록 페이지일 경우 select 옵션 추가 */
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
		
		/* 일정 목록 수정 */
		$('#btnEdit').click(function(){
			if($(this).parent().prev().find('input[name=scheduleFolderName]').val()==""){
			swal ( "" , "일정목록명을 입력하세요" ,  "error" );
		}else{
			$.ajax({    
                      type:'POST',
                      url:"updateScFolder",
                      data:$('#listEd').serializeArray(),
                      dataType: "json",
                      success : function(data) {
							/* 현재 nav-itme의 목록명을 수정함 */
							var res="";
							var scFNo=$('#listEd').find('select[name=scheduleFolderNo]').val();
							var scFoNo="#scFolNo"+scFNo;
							var scFName=$('#listEd').find('input[name=scheduleFolderName]').val();
							
							res+='<input type="checkbox" class="ckSch" checked="checked">'
                    				+'<span class="list-span">'+scFName+'</span>'
                    				+'<input type="hidden" id="scFolNo'+scFNo
                    				+'" value="'+scFNo+'">';
							
							$(scFoNo).parent().html(res);
							
							/* 현재 달력에 수정 전 목록명으로 만들어진 event 전체를 먼저 제거 */
							$(data.list).each(function(index) {
								var texts = data.list[index].scheduleFolderNo;
								event2 = calendar.getEventById(texts);
								if(event2==null)
									return;
        		                event2.remove();
                    		});
                    		
                    		/* 현재 달력에 수정 후 목록명으로 event를 만들어 추가 */
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
                    		
                    		/* 일정 등록 페이지인 경우 select 옵션 수정 */
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
                }
		});
		
		/* 일정 목록 삭제 */
		$('#btnDelete').click(function(){
			$.ajax({    
                      type:'POST',
                      url:"deleteScFolder",
                      data:$('#listDel').serializeArray(),
                      dataType: "json",
                      success : function(data) {
							/* nav-item의 일정 목록 삭제 */
							var res="";
							var scFNo=$('#listDel').find('select[name=scheduleFolderNo]').val();
							var scFoNo="#scFolNo"+scFNo;
							var scFName=$('#listDel').find('input[name=scheduleFolderName]').val();
							
							$(scFoNo).parent().parent().remove();
							
							
							/* 달력에서 해당 일정 목록 전체 삭제 */
							$(data.list).each(function(index) {
								var texts = data.list[index].scheduleFolderNo;
								event2 = calendar.getEventById(texts);
								if(event2==null)
									return;
        		                event2.remove();
                    		});  
                    		
                    		/* 일정 등록 페이지일 경우 옵션 삭제 */
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

/* 일정 끝시간이 일정 시작시간보다 과거 선택 못하도록 하는 함수  */
function timeChange() {
    var startday = new Date($('#startDate').val()); //일정 시작 날짜
    var endday = new Date($('#endDate').val()); //일정 마지막 날짜
    var btday = startday.getTime() - endday.getTime(); //둘의 차이

    if (btday < 0) {//마지막 날짜가 시작 날짜보다 미래인 경우 마지막 날짜의 시간은 24시간 모두 선택가능(30분간격)
        for (var i = 0; i < 48; i++) {
            var showTime = '#option-endTime' + i;
            $(showTime).show();
        }
    } else if (btday == 0) {//만약 날짜가 동일한 경우
        var selectStartTime = Number($('#startTime').val()); //일정 시작 시간
        var selectEndTime = Number($('#endTime').val()); //일정 마지막 시간
        if (selectStartTime > selectEndTime) {//시작 시간이 끝 시간보다 미래일 경우 마지막시간을 시작 시간으로 변경 
            $('#endTime').val(selectStartTime).prop('selectded', true);
        }
        for (var i = 0; i < selectStartTime; i++) {// 시작시간보다 과거인 마지막 시간의 select 옵션을 숨김
            var hideTime = '#option-endTime' + i;
            $(hideTime).hide();
        }
        for (var i = selectStartTime; i < 48; i++) { // 시작시간보다 미래거나 같은 시간인 마지막 시간만 보여줌
            var showTime = '#option-endTime' + i;
            $(showTime).show();
        }
    }
}

/* 24시간을 30분간격으로 총 48개로 나눔. 현재 시간을 48중 어디인지 계산하는 함수  */
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

/* 날짜,시간을 변수로 입력 받아 그에 맞는 value selected 해주는 함수 */
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
