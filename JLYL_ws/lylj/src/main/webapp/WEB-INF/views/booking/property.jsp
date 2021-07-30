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
@import url('https://fonts.googleapis.com/css?family=Lato');

/* default */
*,
*::after,
*::before {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* body */
.divBox {
  min-height: 80vh;
  padding: 40px;

  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;

  
  font-family: "Lato", "Segoe Ui", -apple-system, BlinkMacSystemFont, sans-serif;
}

/* .flip-card-container */
.flip-card-container {
  --hue: 150;
  --primary: hsl(var(--hue), 50%, 50%);
  --white-1: hsl(0, 0%, 90%);
  --white-2: hsl(0, 0%, 80%);
  --dark: hsl(var(--hue), 25%, 10%);
  --grey: hsl(0, 0%, 50%);

  width: 310px;
  height: 500px;
  margin: 40px;

  perspective: 1000px;
}

/* .flip-card */
.flip-card {
  width: inherit;
  height: inherit;

  position: relative;
  transform-style: preserve-3d;
  transition: .6s .1s;
}

/* hover and focus-within states */

.flip-card-container:focus-within .flip-card {
  transform: rotateY(180deg);
}

/* .card-... */
.card-front,
.card-back {
  width: 100%;
  height: 100%;
  border-radius: 24px;

  background: var(--dark);
  position: absolute;
  top: 0;
  left: 0;
  overflow: hidden;

  backface-visibility: hidden;

  display: flex;
  justify-content: center;
  align-items: center;
}

/* .card-front */
.card-front {
  transform: rotateY(180deg);
  z-index: 2;
}

/* .card-back */
.card-back {
  transform: rotateY(0deg);
  z-index: 1;
}

/* figure */
figure {
  z-index: -1;
}

/* figure, .img-bg */
figure,
.img-bg {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;
}

/* img */
.imgBox {
  height: 100%;
  border-radius: 24px;
}

/* figcaption */
.figcaptionBox {
  display: block;

  width: auto;
  margin-top: 12%;
  padding: 8px 22px;

  font-weight: bold;
  line-height: 1.6;
  letter-spacing: 2px;
  word-spacing: 6px;
  text-align: right;

  position: absolute;
  top: 0;
  right: 12px;

  color: var(--white-1);
  background: hsla(var(--hue), 25%, 10%, .5);
}

/* .img-bg */
.img-bg {
  background: hsla(var(--hue), 25%, 10%, .5);
}

.card-front .img-bg {
  clip-path: polygon(0 20%, 100% 40%, 100% 100%, 0 100%);
}

.card-front .img-bg::before {
  content: "";

  position: absolute;
  top: 34%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(18deg);

  width: 100%;
  height: 6px;
  border: 1px solid var(--primary);
  border-left-color: transparent;
  border-right-color: transparent;

  transition: .1s;
}

.card-back .img-bg {
  clip-path: polygon(0 0, 100% 0, 100% 80%, 0 60%);
}

/* hover state */
.flip-card-container:hover .card-front .img-bg::before {
  border-left-color: var(--primary);
  border-right-color: var(--primary);
}

/* ul */
.ulBox {
  padding-top: 50%;
  margin: 0 auto;
  width: 70%;
  height: 100%;

  list-style: none;
  color: var(--white-1);

  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

/* li */
.liBox {
  width: 100%;
  margin-top: 12px;
  padding-bottom: 12px;

  font-size: 14px;
  text-align: center;

  position: relative;
}

.liBox:nth-child(2n) {
  color: var(--white-2);
}

.liBox:not(:last-child)::after {
  content: "";

  position: absolute;
  bottom: 0;
  left: 0;

  width: 100%;
  height: 1px;

  background: currentColor;
  opacity: .2;
}

/* button */
.buttonBox {
  font-family: inherit;
  font-weight: bold;
  color: var(--white-1);

  letter-spacing: 2px;

  padding: 9px 20px;
  border: 1px solid var(--grey);
  border-radius: 1000px;
  background: transparent;
  transition: .3s;

  cursor: pointer;
}

.buttonBox:hover,
.buttonBox:focus {
  color: var(--primary);
  background: hsla(var(--hue), 25%, 10%, .2);
  border-color: currentColor;
}

.buttonBox:active {
  transform: translate(2px);
}

/* .design-container */
.design-container {
  --tr: 90;
  --op: .5;

  width: 100%;
  height: 100%;

  background: transparent;
  position: absolute;
  top: 0;
  left: 0;

  pointer-events: none;
}

/* .design */
.design {
  display: block;

  background: var(--grey);
  position: absolute;

  opacity: var(--op);
  transition: .3s;
}

.design--1,
.design--2,
.design--3,
.design--4 {
  width: 1px;
  height: 100%;
}

.design--1,
.design--2 {
  top: 0;
  transform: translateY(calc((var(--tr) - (var(--tr) * 2)) * 1%))
}

.design--1 {
  left: 20%;
}

.design--2 {
  left: 80%;
}

.design--3,
.design--4 {
  bottom: 0;
  transform: translateY(calc((var(--tr) + (var(--tr) - var(--tr))) * 1%))
}

.design--3 {
  left: 24%;
}

.design--4 {
  left: 76%;
}

.design--5,
.design--6,
.design--7,
.design--8 {
  width: 100%;
  height: 1px;
}

.design--5,
.design--6 {
  left: 0;
  transform: translateX(calc((var(--tr) - (var(--tr) * 2)) * 1%));
}

.design--5 {
  top: 41%;
}

.design--6 {
  top: 59%;
}

.design--7,
.design--8 {
  right: 0;
  transform: translateX(calc((var(--tr) + (var(--tr) - var(--tr))) * 1%))
}

.design--7 {
  top: 44%;
}

.design--8 {
  top: 56%;
}

/* states */
.buttonBox:hover+.design-container,
.buttonBox:active+.design-container,
.buttonBox:focus+.design-container {
  --tr: 20;
  --op: .7;
}

.abs-site-link {
  position: fixed;
  bottom: 20px;
  left: 20px;
  color: hsla(0, 0%, 100%, .6);
  font-size: 16px;
  font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, sans-serif;
}
.btns{
	
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





<div class="divBox">
<!-- flip-card-container -->
<div class="flip-card-container" style="--hue: 220">
  <div class="flip-card">

    <div class="card-front">
      <figure>
        <div class="img-bg"></div>
        <figcaption class="figcaptionBox">Brohm Lake</figcaption>
      </figure>
      
      	<ul class="ulBox">
        <li class="liBox">Detail 1</li>
        <li class="liBox">Detail 2</li>
        <li class="liBox">Detail 3</li>
        <li class="liBox">Detail 4</li>
        <li class="liBox">Detail 5</li>
      </ul >
		
      
    </div>

    <div class="card-back">
      <figure>
        <div class="img-bg"></div>
      </figure>
		
		
      <button class="buttonBox">추가</button>

      <div class="design-container">
        <span class="design design--1"></span>
        <span class="design design--2"></span>
        <span class="design design--3"></span>
        <span class="design design--4"></span>
        <span class="design design--5"></span>
        <span class="design design--6"></span>
        <span class="design design--7"></span>
        <span class="design design--8"></span>
      </div>
    </div>

  </div>
</div>
<!-- /flip-card-container -->

<!-- flip-card-container -->
<div class="flip-card-container" style="--hue: 170">
  <div class="flip-card">

    <div class="card-front">
      <figure>
        <div class="img-bg"></div>
        <img class="imgBox" src="https://images.unsplash.com/photo-1545436864-cd9bdd1ddebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Image 2">
        <figcaption class="figcaptionBox">Légende</figcaption>
      </figure>

      <ul class="ulBox">
        <li class="liBox">Detail 1</li>
        <li class="liBox">Detail 2</li>
        <li class="liBox">Detail 3</li>
        <li class="liBox">Detail 4</li>
        <li class="liBox">Detail 5</li>
      </ul>
    </div>

    <div class="card-back">
      <figure>
        <div class="img-bg"></div>
        <img  class="imgBox" src="https://images.unsplash.com/photo-1545436864-cd9bdd1ddebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="image-2">
      </figure>

      <button class="buttonBox">수정</button>

      <div class="design-container">
        <span class="design design--1"></span>
        <span class="design design--2"></span>
        <span class="design design--3"></span>
        <span class="design design--4"></span>
        <span class="design design--5"></span>
        <span class="design design--6"></span>
        <span class="design design--7"></span>
        <span class="design design--8"></span>
      </div>
    </div>

  </div>
</div>
<!-- /flip-card-container -->

<!-- flip-card-container -->
<div class="flip-card-container" style="--hue: 350">
  <div class="flip-card">

    <div class="card-front">
      <figure>
        <div class="img-bg"></div>
        <img class="imgBox" src="https://images.unsplash.com/photo-1486162928267-e6274cb3106f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Brohm Lake">
        <figcaption class="figcaptionBox">Brohm Lake</figcaption>
      </figure>

      <ul class="ulBox">
        <li class="liBox">Detail 1</li>
        <li class="liBox">Detail 2</li>
        <li class="liBox">Detail 3</li>
        <li class="liBox">Detail 4</li>
        <li class="liBox">Detail 5</li>
      </ul>
    </div>

    <div class="card-back">
      <!-- only if the image is necessary -->
      <figure>
        <div class="img-bg"></div>
        <img class="imgBox" src="https://images.unsplash.com/photo-1486162928267-e6274cb3106f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Brohm Lake">
      </figure>

      <button class="buttonBox">삭제</button>

      <!-- can add svg here and remove these eight spans -->
      <div class="design-container">
        <span class="design design--1"></span>
        <span class="design design--2"></span>
        <span class="design design--3"></span>
        <span class="design design--4"></span>
        <span class="design design--5"></span>
        <span class="design design--6"></span>
        <span class="design design--7"></span>
        <span class="design design--8"></span>
      </div>
    </div>

  </div>
</div>
<!-- /flip-card-container -->
</div>
<div id="bookMainDiv">
<div class="container">
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
  
</div>
</div>
<%@ include file="../inc/bottom.jsp"%>
