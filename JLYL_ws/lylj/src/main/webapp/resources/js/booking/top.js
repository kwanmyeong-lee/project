$(function(){
$('.btnRentAdmin').click(function(){
	location.href="rent";
});

$('#asset-add').click(function(){
		$('#myModaladd').modal('show');
	});
	
	$('#asset-edit').click(function(){
		$('#myModaledit').modal('show');
	});
	
	$('#asset-delete').click(function(){
		$('#myModaldelete').modal('show');
	});
});