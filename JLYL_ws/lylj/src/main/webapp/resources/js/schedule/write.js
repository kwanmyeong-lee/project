$(function(){
	$('#cancle').click(function(){
		location.href="scheduleMain";
		
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