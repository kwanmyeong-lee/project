$(function() { // document ready
	  
	  $('#calendar').fullCalendar({
	    header: {
	      left: 'promptResource today prev,next',
	      center: 'title',
	      right: 'basicWeek,timelineDay'
	    },
	    contentHeight: 400,
	    buttonText: {
   			today : "오늘",
   			month : "월별",
   			week : "주별",
   			day : "일별",
   			list : "목록"
  		  },
  		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
   		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
   		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
   		dayNamesShort: ["일","월","화","수","목","금","토"],
		titleFormat: {
	    month: "YYYY년 MMMM",
	    week: "(YYYY-MM-DD)",
	    day: " YYYY-MM-DD [(]ddd[)]"
	    },
		selectable: true,	
	    defaultView: 'timelineDay',
	    resourceLabelText: 'Rooms',
	    resources: [
	      { id: 'a', title: 'Auditorium A' },
	      { id: 'b', title: 'Auditorium B', eventColor: 'green' },
	      { id: 'c', title: 'Auditorium C', eventColor: 'orange' },
	      { id: 'd', title: 'Auditorium D', children: [
	        { id: 'd1', title: 'Room D1' },
	        { id: 'd2', title: 'Room D2' }
	      ] },
	      { id: 'e', title: 'Auditorium E' },
	      { id: 'f', title: 'Auditorium F', eventColor: 'red' },
	     
	    ],
	    events: [
	      { id: '1', resourceId: 'b', start: '2015-08-07T02:00:00', end: '2015-08-07T07:00:00', title: 'event 1' },
	      { id: '2', resourceId: 'c', start: '2015-08-07T05:00:00', end: '2015-08-07T22:00:00', title: 'event 2' },
	      { id: '3', resourceId: 'd', start: '2015-08-06', end: '2015-08-08', title: 'event 3' },
	      { id: '4', resourceId: 'e', start: '2015-08-07T03:00:00', end: '2015-08-07T08:00:00', title: 'event 4' },
	      { id: '5', resourceId: 'f', start: '2015-08-07T00:30:00', end: '2015-08-07T02:30:00', title: 'event 5' }
	    ]
	  });
});
	

	
	
	   
	   
	    
	   
	   
	    