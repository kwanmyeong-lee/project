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
		
		$('#startDate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#endDate").datepicker( "option", "minDate", selectedDate );
	    });
});