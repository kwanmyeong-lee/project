$(function(){
	$(document).on('click','.px-1',function(){
		var empNo = $('#empNoHidden').val();
		var currentPage = $(this).text();
		var btCheck =0;
		
		pagingAjax(empNo, currentPage, btCheck);
	});
	
	$(document).on('click','.ar-forward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var empNo = $('#empNoHidden').val();
		var btCheck=1;
		
		pagingAjax(empNo, currentPage, btCheck);
	});
	
	$(document).on('click','.ar-backward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var empNo = $('#empNoHidden').val();
		var btCheck=2;
		
		pagingAjax(empNo, currentPage, btCheck);
	});
	
	
	
});

function pagingAjax(empNo, currentPage, btCheck){
	$.ajax({    
        type:'get',
        url:"currentList",
        data:{empNo:empNo, 
        	  currentPage:currentPage,
        	  btCheck:btCheck},
        dataType: "json",
        success : function(data) {
        	var str='';
        	
        	for(var i=0; i<data.breakdayList.length; i++){
        		str+='<tr>';
        		str+='<td class="ann-td">';
        		str+=data.breakdayList[i].empName;
        		str+='</td>';
        		str+='<td class="ann-td">';
        		str+=$('#departmentNameHidden').val();
        		str+='</td>';
        		str+='<td class="ann-td">';
        		str+=data.breakdayList[i].breakthemeName;
        		str+='</td>';
        		str+='<td class="ann-td">';
        		str+=moment(data.breakdayList[i].breakdayStart).format('YYYY-MM-DD');
        		str+=" ~ ";
        		str+=moment(data.breakdayList[i].breakdayEnd).format('YYYY-MM-DD');
        		str+='</td>';
        		str+='<td class="ann-td">';
        		str+=data.breakdayList[i].breakdayUse;
        		str+='</td></tr>';
        		
        		
        	}
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

			
        	
        	$('.table-tbody').html(str);
        	$('.page_nation').html(pageStr);
        }
      });
	
}
window.onload = function() {
    Clock();
    NowYD();
}