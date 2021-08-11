$(function() {
		var fileTarget = $('.filebox .upload-hidden'); 
		
		/* 파일 업로드 */
		fileTarget.on('change', function(){ // 값이 변경되면 
			$('#fileChangHidden').val(0);
			if(!/\.(xls|xlsx)$/i.test($(this)[0].files[0].name)){
				$(this).val("");
				$(this).siblings('.upload-name').val("파일선택");
				return;
			}
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename);
			
		});
	
		/* 엑셀 목록 보기*/
		$('#excelView').click(function(){
			excelViewAjax(1,0);
			$('#fileChangHidden').val(1);
		});
		
		/* 양식 다운로드 */
		$('#excelDown').click(function(){
			location.href="../download/addressBookExcel";
		});
		
		
		/* 페이징 처리 */
		$(document).on('click','.px-1',function(){
			var currentPage = $(this).text();
			var btCheck =0;
			excelViewAjax(currentPage,btCheck);
			
		});
		
		$(document).on('click','.ar-forward',function(){
			var currentPage = $('.px-1').eq(0).text();
			var btCheck=1;
			excelViewAjax(currentPage,btCheck);
		});
		
		$(document).on('click','.ar-backward',function(){
			var currentPage = $('.px-1').eq(0).text();
			var btCheck=2;
			excelViewAjax(currentPage,btCheck);
		});
		/* 페이징 처리 */
		
		/* 엑셀 정보 주소록에 insert*/
		$('#excelInsert').click(function(){
			if($('#ex_filename').val()==""){ // 파일 유효성 검사
				Swal.fire({
					  icon: 'error',
					  text: "파일을 업로드 하세요",
					})
				return;
			}
			
			var formData = new FormData();
			formData.append("excelFile",$('#ex_filename')[0].files[0]);
			formData.append("empNo",$('#empNoHidden').val());
			$.ajax({
				type:"post",
				url:"../upload/insert",
				processData : false,
				contentType : false,
				data: formData,
				dataType:"json",
				success: function(data){
					if(data==0){
						Swal.fire("유효 데이터가 없습니다.")
					}else{
						Swal.fire({
							  icon: 'success',
							  title: data+'개 등록 성공!',
							  showConfirmButton: false,
							  timer: 1500
						});
					}
				}
			});
		});
		
		
	}); 

/* 페이징 처리 된 엑셀의 목록 가져오기 */
function excelViewAjax(currentPage, btCheck){
	if($('#ex_filename').val()==""){ // 파일 유효성 검사
		Swal.fire({
			  icon: 'error',
			  text: "파일을 업로드 하세요",
			})
		return;
	}
	
	var formData = new FormData();
	formData.append("excelFile",$('#ex_filename')[0].files[0]);
	formData.append("currentPage",currentPage);
	formData.append("btCheck",btCheck);
	$.ajax({
		type:"post",
		url:"../upload/read",
		processData : false,
		contentType : false,
		data: formData,
		dataType:"json",
		beforeSend: function() {
   			 $('.loading').show();
		},
		complete: function() {
	        $('.loading').hide();
	    },
		success: function(data){
			/* 엑셀 목록 view */
	    	var str="";
	    	for(var i=0;i<data.excelContent.length;i++){
	    		var imgUrl = "../resources/img/"
	    		
	    		str+='<tr class="tdStyle">';
	    		str+='<td id="userNameTd" class="userNameClick">';
	    		
	    		if(data.excelContent[i].H=="남자" || data.excelContent[i].H=="남" || data.excelContent[i].H=="1" || data.excelContent[i].H=="M" || data.excelContent[i].H=="m"){
	    			imgUrl += "profile_m.png";
		    		str+='<img alt="남자" src="'+imgUrl+'">';
	    		}else if(data.excelContent[i].H=="여자" || data.excelContent[i].H=="여" || data.excelContent[i].H=="2" || data.excelContent[i].H=="F" || data.excelContent[i].H=="f"){
	    			imgUrl += "profile_f.png";
		    		str+='<img alt="여자" src="'+imgUrl+'">';
	    		}else{
	    			imgUrl += "profile_o.jpg";
		    		str+='<img alt="" src="'+imgUrl+'">';
	    		}
	    		str+=data.excelContent[i].A+'</td>';
	    		str+='<td class="telTd">'+data.excelContent[i].B+'</td>';
	    		str+='<td class="emailTd">'+data.excelContent[i].C+'</td>';
	    		str+='<td class="positionTd">'+data.excelContent[i].D+'</td>';
	    		str+='<td class="officeNameTd">'+data.excelContent[i].E+'</td>';
	    		str+='<td class="officeTelTd">'+data.excelContent[i].F+'</td>';
	    		str+='<td class="bookFolTd" >'+data.excelContent[i].G+'</td>';
	    		str+='</tr>';
	    	}
	    	
	    	$('#excelBody').html(str);
	    	
	    	
	    	/* 페이징 */
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
	    	
        	
        	$('#rowCnt').text("총 행의 갯수 : "+data.totalRowCnt+"개, 필수값이 입력된 행의 갯수 : "+data.pagingInfo.totalRecord+"개");
	    
		}
	});
	
}	