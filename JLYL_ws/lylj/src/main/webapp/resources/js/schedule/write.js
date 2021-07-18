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
							$('.del-select').html(res);
                          $('#myModaladd').modal('hide');
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
                          $('#myModaladd').modal('hide');
                      }
                    });
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