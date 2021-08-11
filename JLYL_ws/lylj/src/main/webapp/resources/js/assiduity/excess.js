$(function(){
	$(document).on("click",'.success',function(){ 
		var attendanceDayNo = $(this).prev().val();
		var $its =$(this);		
		$.ajax({
			type:"get",
			url:"updateExcess",
			data:{
				attendanceDayNo : attendanceDayNo,
				flag : 2
			},
			dataType:"json",
			success: function(data){
				$its.parent().parent().find('.check').prop("disabled",true);
				$its.parent().parent().find('.check').prop("checked",false);
				$its.prop("disabled",true);
				$its.next().prop("disabled",true);
			}
		});
		
	});
	$(document).on("click",'.cancle',function(){ 
		var attendanceDayNo = $(this).prev().prev().val();
		var $its =$(this);
		$.ajax({
			type:"get",
			url:"updateExcess",
			data:{
				attendanceDayNo : attendanceDayNo,
				flag : 2
			},
			dataType:"json",
			success: function(data){
				$its.parent().parent().find('.check').prop("disabled",true);
				$its.parent().parent().find('.check').prop("checked",false);
				$its.prop("disabled",true);
				$its.prev().prop("disabled",true);
			}
		});
		
	});
	$(document).on("click",'#successAll',function(){ 
		$('.check').each(function(){
			
			if($(this).prop("checked")){
				var attendanceDayNo=$(this).prev().val();
				var $its =$(this);
				$.ajax({
					type:"get",
					url:"updateExcess",
					data:{
						attendanceDayNo : attendanceDayNo,
						flag : 2
					},
					dataType:"json",
					success: function(data){
						$its.prop("checked",false);
						$its.prop("disabled",true);
						$its.parent().parent().find('.success').prop("disabled",true);
						$its.parent().parent().find('.cancle').prop("disabled",true);
					}
				});
			}
		});
	});
	$(document).on("click",'#cancleAll',function(){ 
		$('.check').each(function(){
			
			if($(this).prop("checked")){
				var attendanceDayNo=$(this).prev().val();
				var $its =$(this);
				$.ajax({
					type:"get",
					url:"updateExcess",
					data:{
						attendanceDayNo : attendanceDayNo,
						flag : 1
					},
					dataType:"json",
					success: function(data){
						$its.prop("checked",false);
						$its.prop("disabled",true);
						$its.parent().parent().find('.success').prop("disabled",true);
						$its.parent().parent().find('.cancle').prop("disabled",true);
					}
				});
			}
		});
	});
	
	$(document).on('click','.px-1',function(){
		var currentPage = $(this).text();
		var btCheck =0;
		
		excessViewAjax(currentPage, btCheck);
	});
	
	$(document).on('click','.ar-forward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var btCheck=1;
		
		excessViewAjax(currentPage, btCheck);
	});
	
	$(document).on('click','.ar-backward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var btCheck=2;
		
		excessViewAjax(currentPage, btCheck);
	});
	
	$(document).on('change','#checkAll',function(){
		$('.check').each(function(){
			if($(this).prop("disabled")==false){		
				$(this).prop("checked",$("#checkAll").prop("checked"));
			}
		});
	});
});

function excessViewAjax(currentPage,btCheck){
	
	$.ajax({
		type:"get",
		url:"excessView",
		data:{
			currentPage : currentPage,
			btCheck : btCheck
		},
		dataType:"json",
		success: function(data){
			str="";
			
				
			if(data.conditionList.length>0){
				
				for(var i="0"; i<data.conditionList.length; i++){
					str+='<tr>';
					str+='<td><input type="hidden" value="'+data.conditionList[i].attendanceDayNo+'"><input type="checkbox" class="check"></td>';
					str+='<td>'+data.conditionList[i].empName+'</td>';
					str+='<td>'+data.conditionList[i].departmentName+'</td>';
					str+='<td>'+data.conditionList[i].positionName+'</td>';
					var year = new Date(data.conditionList[i].attendanceDayOnHour).getFullYear();
					var month = "00"+Math.floor(new Date(data.conditionList[i].attendanceDayOnHour).getMonth()+1);
					var date = "00"+Math.floor(new Date(data.conditionList[i].attendanceDayOnHour).getDate());
					month = month.slice(-2);
					date = date.slice(-2);
					str+='<td>'+year+'-'+month+'-'+date+' (';
					
					var hour ="00"+new Date(data.conditionList[i].attendanceDayOnHour).getHours();
					var min = "00"+Math.floor(new Date(data.conditionList[i].attendanceDayOnHour).getMinutes());
					var sec = "00"+Math.floor(new Date(data.conditionList[i].attendanceDayOnHour).getSeconds());
					hour = hour.slice(-2);
					min = min.slice(-2);
					sec = sec.slice(-2);
					str+=hour+':'+min+':'+sec+' ~ ';
					
					hour ="00"+new Date(data.conditionList[i].attendanceDayOffHour).getHours();
					min = "00"+Math.floor(new Date(data.conditionList[i].attendanceDayOffHour).getMinutes());
					sec = "00"+Math.floor(new Date(data.conditionList[i].attendanceDayOffHour).getSeconds());
					hour = hour.slice(-2);
					min = min.slice(-2);
					sec = sec.slice(-2);
					str+=hour+':'+min+':'+sec+')</td>';
					
					var exTime= miliHMS(data.conditionList[i].excessTimeDay);
					str+='<td>'+exTime+'</td>';
					str+='<td class="ths"><input type="hidden" value="'+data.conditionList[i].attendanceDayNo+'"><button type="button" class="btn btn-outline-success btt success" >승인</button>';
					str+='<button type="button" class="btn btn-outline-danger btt cancle">거절</button></td>';
					str+='</tr>';
				}
				
           		
			}else{
				str+='<tr><td colspan="7" align="center">승인 대기 없음</td></tr>';
           		
			}
			
			$('#excessTBody').html(str);
				
			var pageStr="";
        	if(data.pagingInfo.firstPage>1){
        		pageStr+='<a class="arrow ar-backward" href="#"><i class="fas fa-backward"></i></a>'
        	}
			for(var i=data.pagingInfo.firstPage; i<=data.pagingInfo.lastPage; i++){
				if(i==data.pagingInfo.currentPage){
					pageStr+='<a class="px-1 active" href="#">';
					pageStr+=i;
					pageStr+='</a>';
				}else{
					pageStr+='<a class="px-1" href="#" >';
					pageStr+=i;
					pageStr+='</a>';
				}
			}
			if(data.pagingInfo.lastPage<data.pagingInfo.totalPage){
				pageStr+='<a class="arrow ar-forward" href="#"><i class="fas fa-forward"></i></a>'
			}

			
        	
        	$('.page_nation').html(pageStr);
		}
	});
}

function miliHMS(mili){
	var hour = "00"+Math.floor(mili/3600);
	var min = "00"+Math.floor(mili%3600/60);
	var sec = "00"+Math.floor(mili%3600%60);
	hour = hour.slice(-2);
	min = min.slice(-2);
	sec = sec.slice(-2);
	
	return hour+"h "+min+"m "+sec+"s";
}

window.onload= function(){
	excessViewAjax(1,0);
}