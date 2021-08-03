$(function(){
	/* 승인 클릭 시 */
	$(document).on("click",'.success',function(){ 
		var bookingNo = $(this).prev().val();
		var scheduleNo = $(this).parent().parent().find('.hidden-scheduleNo').val();
		var $its =$(this);
		$.ajax({//승인으로 update
			type:"get",
			url:"updateAppFlag",
			data:{
				bookingNo : bookingNo,
				bookingAppFlag : "2",
				scheduleNo : scheduleNo 
			},
			dataType:"json",
			success: function(data){
				/* 승인 반려 다시 누르지 못하게 버튼,체크박스 막기 */
				$its.parent().parent().find('.check').prop("disabled",true);
				$its.parent().parent().find('.check').prop("checked",false);
				$its.prop("disabled",true);
				$its.next().prop("disabled",true);
					
				
			}
		});
		
	});
	
	/* 반려 클릭 시 */
	$(document).on("click",'.cancle',function(){ 
		var bookingNo = $(this).prev().prev().val();
		var scheduleNo = $(this).parent().parent().find('.hidden-scheduleNo').val();
		var $its =$(this);
		$.ajax({//반려로 업데이트
			type:"get",
			url:"updateAppFlag",
			data:{
				bookingNo : bookingNo,
				bookingAppFlag : "1",
				scheduleNo : scheduleNo 
			},
			dataType:"json",
			success: function(data){
				/* 승인 반려 다시 누르지 못하게 버튼,체크박스 막기 */
				$its.parent().parent().find('.check').prop("disabled",true);
				$its.parent().parent().find('.check').prop("checked",false);
				$its.prop("disabled",true);
				$its.prev().prop("disabled",true);
					
				
			}
		});
		
	});
	
	/* 체크된 목록 전체 승인 */
	$(document).on("click",'#successAll',function(){ 
		$('.check').each(function(){//체크된 목록을 각각 처리
			
			if($(this).prop("checked")){
				var bookingNo=$(this).prev().val();
				var scheduleNo=$(this).prev().prev().val();
				var $its =$(this);
				$.ajax({//승인
					type:"get",
					url:"updateAppFlag",
					data:{
						bookingNo : bookingNo,
						bookingAppFlag : "2",
						scheduleNo : scheduleNo 
					},
					dataType:"json",
					success: function(data){
						/* 승인 반려 다시 누르지 못하게 버튼,체크박스 막기 */
						$its.prop("checked",false);
						$its.prop("disabled",true);
						$its.parent().parent().find('.success').prop("disabled",true);
						$its.parent().parent().find('.cancle').prop("disabled",true);
					}
				});
			}
		});
	});
	
	/* 체크된 목록 전체 반려 */
	$(document).on("click",'#cancleAll',function(){ 
		$('.check').each(function(){//체크된 목록을 각각 처리
			
			if($(this).prop("checked")){
				var bookingNo=$(this).prev().val();
				var scheduleNo=$(this).prev().prev().val();
				var $its =$(this);
				$.ajax({//반려
					type:"get",
					url:"updateAppFlag",
					data:{
						bookingNo : bookingNo,
						bookingAppFlag : "1",
						scheduleNo : scheduleNo 
					},
					dataType:"json",
					success: function(data){
						/* 승인 반려 다시 누르지 못하게 버튼,체크박스 막기 */
						$its.prop("checked",false);
						$its.prop("disabled",true);
						$its.parent().parent().find('.success').prop("disabled",true);
						$its.parent().parent().find('.cancle').prop("disabled",true);
					}
				});
			}
		});
	});
	
	/* 페이징 처리 */
	$(document).on('click','.px-1',function(){
		var currentPage = $(this).text();
		var btCheck =0;
		rentViewAjax(currentPage,btCheck);
		
	});
	
	$(document).on('click','.ar-forward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var btCheck=1;
		rentViewAjax(currentPage,btCheck);
	});
	
	$(document).on('click','.ar-backward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var btCheck=2;
		rentViewAjax(currentPage,btCheck);
	});
	
	/* 모든 체크박스를 자신의 상태와 동일하게 만듬 */
	$(document).on('change','#checkAll',function(){
		$('.check').each(function(){
			if($(this).prop("disabled")==false){		
				$(this).prop("checked",$("#checkAll").prop("checked"));
			}
		});
	});
});

/* 페이징에 맞는 목록 List만 출력하는 함수*/
function rentViewAjax(currentPage,btCheck){
	
	$.ajax({
		type:"get",
		url:"selectAllApp",
		data:{//승인대기중인 목록 List 반환
			currentPage : currentPage,
			btCheck : btCheck
		},
		dataType:"json",
		success: function(data){
			/* 승인 대기 목록 view */
			str="";
			if(data.bookingList.length>0){
				for(var i=0; i<data.bookingList.length; i++){
					str+='<tr>';
					str+='<td><input type="hidden" class="hidden-scheduleNo" value="'+data.bookingList[i].scheduleNo+'"><input type="hidden" value="'+data.bookingList[i].bookingNo+'"><input type="checkbox" class="check"></td>';
					str+='<td>'+data.bookingList[i].bookingTargetName+'</td>';
					str+='<td>'+data.bookingList[i].empName+'</td>';
					str+='<td>'+data.bookingList[i].bookingStart+' ~ '+data.bookingList[i].bookingEnd+'</td>';
					var year = new Date(data.bookingList[i].bookingCurrent).getFullYear();
					var month = "00"+Math.floor(new Date(data.bookingList[i].bookingCurrent).getMonth()+1);
					var date = "00"+Math.floor(new Date(data.bookingList[i].bookingCurrent).getDate());
					month = month.slice(-2);
					date = date.slice(-2);
					str+='<td>'+year+'-'+month+'-'+date+' ';
					
					var hour ="00"+new Date(data.bookingList[i].bookingCurrent).getHours();
					var min = "00"+Math.floor(new Date(data.bookingList[i].bookingCurrent).getMinutes());
					var sec = "00"+Math.floor(new Date(data.bookingList[i].bookingCurrent).getSeconds());
					hour = hour.slice(-2);
					min = min.slice(-2);
					sec = sec.slice(-2);
					str+=hour+':'+min+':'+sec+'</td>';
					
					str+='<td class="ths"><input type="hidden" value="'+data.bookingList[i].bookingNo+'"><button type="button" class="btn btn-outline-success btt success" >승인</button>';
					str+='<button type="button" class="btn btn-outline-danger btt cancle">반려</button></td>';
					str+='</tr>';
				}
			}else{
				str+='<tr><td colspan="6" align="center">예약 신청 없음</td></tr>';
			}
			
			$('#excessTBody').html(str);
			
			/* 페이징 view */	
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

/* 초를 00h 00m 00s로 변환 하는 함수 */
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
	rentViewAjax(1,0);
}