
	var calendar;
    $(function() {
        var calendarEl = document.getElementById('calendar');

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
          locale : "ko",
          dayMaxEvents: true,
          select:function(arg){
        	  $('#myModal').modal('show');
        	  /* var title= prompt("일정명:");
        	  if(title){
        		  var obj = new Object();
        		  obj.title = title;
        		  obj.startDate = arg.start;
        		  obj.endDate = arg.end;
        		  obj.allday = arg.allDay;
        		  var jsondata= JSON.stringify(obj);

            	  $.ajax({
      				type:'POST',
      				url:"insertSchedule",
      				data:jsondata,
      				contentType: "application/json; charset=utf-8;",
      	            dataType: "json",
      				success : function(data) {
      					alert("성공");
      				}
      			  });
            	  
        		  calendar.addEvent({
        			  title:title,
        		  	  start:arg.start,
        		  	  end:arg.end,
        		  	  allDay:arg.allDay
        		  })
        	  } */
        	  
          },
          droppable:true,
          drop:function(arg){
          },
          eventClick:function(arg){
        	  if(confirm("일정을 삭제하시겠습니까?")){
        		  arg.event.remove()
        	  }
          },
          eventAdd: function(arg) {		
      		
      	  }, 
      	  eventChange: function(arg) {	
      		AppCalendar.saveEvent("up", arg);
      	  }, 
      	  eventRemove: function(arg) {	
      		
      	  },
    	  
          events: function(info, successCallback, failureCallback){ 
        	  $.ajax({
  				type:'GET',
  				url:"listSchedule",
  	            dataType: "json",
  				success : function(data) {
  					 var events=[];
  					$(data).each(function(index){
  						events.push({
	  						title: data[index].title,
	  						start: data[index].startDate,
	  						end: data[index].endDate,
	  						allDay: data[index].allday
  						});
  						 
  					 });
  					 
  					successCallback(events);
  				}
  			  });
      		}
        });
        calendar.render();
        
		$('.add-button').click(function(){
			allSave();
		});
		
		//datepicker
		

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
		
		$('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#endDate").datepicker( "option", "minDate", selectedDate );
	    });
		
	});

	
