$(function(){
	
	/* 등록의 radio1 클릭시 목록 보이기 */
	$('#check1').click(function(){
			$('#addText1').show();
			$('#addSel').hide();
			$('#addText2').hide();
			$('#addText2').val("");
			
	});
	
	/* 등록의 radio2 클릭시 자산 보이기 */
	$('#check2').click(function(){
			$('#addText1').hide();
			$('#addSel').show();
			$('#addText1').val("");
			$('#addText2').show();
			
			var ob = $(this).prev().prev().prev().val();
			propertySelView(0,ob);
	});
	
	/* 등록 이미지 클릭시 */
	$('.btns-1').click(function(){
		if($('#addText1').val()=="" && $('#addText2').val()==""){
			swal ( "" , "추가할 이름을 입력하세요" ,  "error" );
		}else{
			if($('input[name=radio-add]:checked').val()==1){//자산 등록
				var ser = 1;
				var bookingTargetNo = 0;
				var bookingTargetName = $('#addText2').val();
				var bookingFolderNo = $('#addSel').val();
				tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo);
			}else if($('input[name=radio-add]:checked').val()==0){//목록 등록
				var ser = 1;
				var bookingFolderNo = 0;
				var bookingFolderName  = $('#addText1').val();
				folSer(ser, bookingFolderNo, bookingFolderName );
			}
		}
	});
	
	/* 수정 이미지 클릭시 */
	$('.btns-2').click(function(){
		if($('#editText').val()=="" || $('#editSel').val()==0 ){
			swal ( "" , "수정대상/수정명을 입력하세요" ,  "error" );
		}else{
			if($('input[name=radio-edit]:checked').val()==1){//자산 수정
				var ser = 2;
				var bookingTargetNo = $('#editSel').val();
				var bookingTargetName = $('#editText').val();
				var bookingFolderNo = 0;
				tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo);
			}else if($('input[name=radio-edit]:checked').val()==0){//목록 수정
				var ser = 2;
				var bookingFolderNo =  $('#editSel').val();
				var bookingFolderName  = $('#editText').val();
				folSer(ser, bookingFolderNo, bookingFolderName );
			}
		}
	});
	
	/* 삭제 이미지 클릭시 */
	$('.btns-3').click(function(){
		if($('#delSel').val()==0){
			swal ( "" , "삭제 대상을 고르세요" ,  "error" );
		}else{
			if($('input[name=radio-del]:checked').val()==1){//자산 삭제
				var ser = 3;
				var bookingTargetNo =  $('#delSel').val();
				var bookingTargetName = 0;
				var bookingFolderNo = 0;
				tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo);
			}else if($('input[name=radio-del]:checked').val()==0){//목록 삭제
				var ser = 3;
				var bookingFolderNo =  $('#delSel').val();
				var bookingFolderName  = 0;
				folSer(ser, bookingFolderNo, bookingFolderName );
			}
		}
	});
	
	/* 목록 radio 클릭시 */
	$('.selFol').click(function(){
		var ob = $(this).prev().val();
		propertySelView(0,ob);
	});
	
	/* 자산 radio 클릭시 */
	$('.selTar').click(function(){
		var ob = $(this).prev().prev().prev().val();
		propertySelView(1,ob);
	});
	
	
});

/* 자산, 예약 목록명 조회후 select option으로 만드는 함수 */
function propertySelView(raCheck, ob){
	
	$.ajax({
		type:"get",
		url:"propertySelView",
		data:{
			raCheck : raCheck
		},
		dataType:"json",
		success: function(data){
			var str="";
			if(raCheck==0){
				str+='<option value="0">-목록명-</option>';
				for(var i=0; i<data.boFolList.length; i++){
					str+='<option value="'+data.boFolList[i].bookingFolderNo+'">'+data.boFolList[i].bookingFolderName+'</option>'
				}
			}else{
				str+='<option value="0">-자산명-</option>';
				for(var i=0; i<data.boTargetList.length; i++){
					str+='<option value="'+data.boTargetList[i].bookingTargetNo+'">'+data.boTargetList[i].bookingTargetName+'</option>'
				}
			}
			$(ob).html(str);
		}
	});
}

/* 자산 등록, 수정, 삭제 함수*/
function tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo){
	
	$.ajax({
		type:"get",
		url:"targetSer",
		data:{
			ser : ser,
			bookingTargetNo : bookingTargetNo,
			bookingTargetName : bookingTargetName,
			bookingFolderNo : bookingFolderNo 
		},
		dataType:"json",
		success: function(data){
			if(ser==1){
				swal("자산 등록 성공!", "", "success");
			}else if(ser==2){
				swal("자산 수정 성공!", "", "success");
			}else if(ser==3){
				swal("자산 삭제 성공!", "", "success");
			}
		}
	});
}

/* 예약 목록명 등록, 수정, 삭제 함수*/
function folSer(ser, bookingFolderNo , bookingFolderName){
	
	$.ajax({
		type:"get",
		url:"folSer",
		data:{
			ser : ser,
			bookingFolderNo : bookingFolderNo,
			bookingFolderName : bookingFolderName,
		},
		dataType:"json",
		success: function(data){
			if(ser==1){
				swal("목록 등록 성공!", "", "success");
			}else if(ser==2){
				swal("목록 수정 성공!", "", "success");
			}else if(ser==3){
				swal("목록 삭제 성공!", "", "success");
			}
		}
	});
}