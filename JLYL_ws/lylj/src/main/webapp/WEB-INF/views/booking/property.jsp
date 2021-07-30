<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>


<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">

<!-- alert창 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#h33{
	margin-top: 40px;
	color : #3a3a3a;
}
.tt{
	display: inline;
	font-size: 27px;
}
</style>
<script>
$(function(){
	$('#check1').click(function(){
			$('#addText1').show();
			$('#addSel').hide();
			$('#addText2').hide();
			$('#addText2').val("");
			
	});
	$('#check2').click(function(){
			$('#addText1').hide();
			$('#addSel').show();
			$('#addText1').val("");
			$('#addText2').show();
			
			var ob = $(this).prev().prev().val();
			propertySelView(0,ob);
	});
	
	$('.btns-1').click(function(){
		if($('#addText1').val()=="" && $('#addText2').val()==""){
			swal ( "" , "추가할 이름을 입력하세요" ,  "error" );
		}else{
			if($('input[name=radio-add]:checked').val()==1){
				var ser = 1;
				var bookingTargetNo = 0;
				var bookingTargetName = $('#addText2').val();
				var bookingFolderNo = $('#addSel').val();
				tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo);
			}else if($('input[name=radio-add]:checked').val()==0){
				var ser = 1;
				var bookingFolderNo = 0;
				var bookingFolderName  = $('#addText1').val();
				folSer(ser, bookingFolderNo, bookingFolderName );
			}
		}
	});
	
	$('.btns-2').click(function(){
		if($('#editText').val()=="" || $('#editSel').val()==0 ){
			swal ( "" , "수정대상/수정명을 입력하세요" ,  "error" );
		}else{
			if($('input[name=radio-edit]:checked').val()==1){
				var ser = 2;
				var bookingTargetNo = $('#editSel').val();
				var bookingTargetName = $('#editText').val();
				var bookingFolderNo = 0;
				tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo);
			}else if($('input[name=radio-edit]:checked').val()==0){
				var ser = 2;
				var bookingFolderNo =  $('#editSel').val();
				var bookingFolderName  = $('#editText').val();
				folSer(ser, bookingFolderNo, bookingFolderName );
			}
		}
	});
	$('.btns-3').click(function(){
		if($('#delSel').val()==0){
			swal ( "" , "삭제 대상을 고르세요" ,  "error" );
		}else{
			if($('input[name=radio-del]:checked').val()==1){
				var ser = 3;
				var bookingTargetNo =  $('#delSel').val();
				var bookingTargetName = 0;
				var bookingFolderNo = 0;
				tarSer(ser, bookingTargetNo, bookingTargetName, bookingFolderNo);
			}else if($('input[name=radio-del]:checked').val()==0){
				var ser = 3;
				var bookingFolderNo =  $('#delSel').val();
				var bookingFolderName  = 0;
				folSer(ser, bookingFolderNo, bookingFolderName );
			}
		}
	});
	$('.selFol').click(function(){
		var ob = $(this).prev().val();
		propertySelView(0,ob);
	});
	$('.selTar').click(function(){
		var ob = $(this).prev().prev().val();
		propertySelView(1,ob);
	});
	
	
});
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
</script>

<div id="bookMainDiv">
<div class="container">
	<h3 id="h33">자산관리</h3>
  <br>
  <br>
  <i class="far fa-edit btns-1 btns fa-5x"></i>
  <div class="tt">
  	<input type="hidden" value="#addSel">
  	<input type="radio" value="0" name="radio-add" id="check1" checked="checked" value="0">목록
  	<input type="radio" value="1" name="radio-add" id="check2" class="selFol" value="1">자산
  	<input type="text" placeholder="목록명" id="addText1" style="display: inline;">
  	<select id="addSel" style="display: none;">
  		<option value="0">-목록명-</option>
  	</select>
  	<input type="text" placeholder="자산명" id="addText2" style="display: none;">
  </div>
  <br>
  <br>
  <br>
  <br>
  <i class="fas fa-wrench btns-2 btns fa-5x"></i>
  <div class="tt">
  	<input type="hidden" value="#editSel">
  	<input type="radio" name="radio-edit" class="selFol" value="0">목록
  	<input type="radio" name="radio-edit" class="selTar" value="1">자산
  	<select id="editSel">
  		<option value="0">-목록명-</option>
  	</select>
  	<input type="text" id="editText" placeholder="수정명">
  </div>
  <br>
  <br>
  <br>
  <br>
  <i class="fas fa-trash-alt btns-3 btns fa-5x"></i>
  <div class="tt">
 	 <input type="hidden" value="#delSel">
  	<input type="radio" name="radio-del" class="selFol" value="0">목록
  	<input type="radio" name="radio-del" class="selTar" value="1">자산
  	<select id="delSel">
  		<option value="0">-목록명-</option>
  	</select>
  </div>
  <br>
  <br>
  
  
  
</div>
</div>
<%@ include file="../inc/bottom.jsp"%>
