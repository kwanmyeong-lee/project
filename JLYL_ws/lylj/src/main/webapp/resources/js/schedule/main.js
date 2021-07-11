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

