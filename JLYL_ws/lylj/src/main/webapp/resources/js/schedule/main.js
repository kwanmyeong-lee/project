
$(function(){
	$('.btnSchAdd').click(function(){
		location.href="write";
	});
	
	$('.chk-day').change(function(){
		if($(this).prop('checked')){
			$('.selectTime').hide();
		}else{
			$('.selectTime').show();			
		}
	});
	
	$('#startTime').change(function(){
		timeChange();
	});
	
	$('#endDate').change(function(){
		timeChange();
	});
	
	$('#startDate').change(function(){
		timeChange();
	});
	
});

function timeChange(){
	var startday =new Date($('#startDate').val());
		var endday= new Date($('#endDate').val());
		var btday = startday.getTime()-endday.getTime();
		
		if(btday<0){
		for(var i = 0; i<48;i++){
			var showTime = '#option-endTime'+i;
			$(showTime).show();
		}
		}else if(btday==0){
			var selectEndTime=$('#startTime').val();
		$('#endTime').val(selectEndTime).prop('selectded',true);
		for(var i=0; i<selectEndTime; i++){
			var hideTime = '#option-endTime'+i;
			$(hideTime).hide();
		}
		for(var i = selectEndTime; i<48;i++){
			var showTime = '#option-endTime'+i;
			$(showTime).show();
		}
		}
}