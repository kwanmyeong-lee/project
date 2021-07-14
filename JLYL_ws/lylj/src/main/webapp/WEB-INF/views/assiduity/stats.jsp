<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


<link
	href="<c:url value="/resources/css/assiduity/top.css"/>"
	rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/top.js"/>'></script>

<style>
.ann-div{
	clear: both;
}
.ann-table{
	width: 100%;
	border: 1px solid;
}	
.ann-th{
	border-bottom: 1px solid;
}
.ann-td{
	border-bottom: 1px solid;
}

/* stats-terms */
.stats-terms2{
	display: none;
}
.stats-check{
	position: absolute;
	background-color: white;
	box-shadow: 0px 0px 5px 2px #62b0cb;
	display: none;
}
.check-span:hover{
	cursor: pointer;
}
#checkDiv2{
	margin-left: 108px;
}

</style>

<script type="text/javascript">
	$(function(){
		$('html').click(function(e){ 
			if($('.stats-check1').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch1') && !$(e.target).hasClass('stats-terms')) { 
					$('#checkDiv1').hide();

				} 
			}
			if($('.stats-check2').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch2') && !$(e.target).hasClass('st-tr2')) { 
					$('#checkDiv2').hide();

				} 
			}
			if($('.stats-check3').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch3') && !$(e.target).hasClass('st-tr3')) { 
					$('#checkDiv3').hide();

				} 
			}
			if($('.stats-check4').css("display")!="none"){
				if(!$(e.target).hasClass('st-ch4') && !$(e.target).hasClass('st-tr4')) { 
					$('#checkDiv4').hide();

				} 
			}
		});
		
		$('#termsBtn1').click(function(){
			$('#checkDiv1').toggle();
		});
		
		$('.check-span1').click(function(){
			if($(this).prev('.check-box1').prop("checked")==false){
				$(this).prev('.check-box1').prop("checked",true);
			}else{
				$(this).prev('.check-box1').prop("checked",false);
			}
			$('#termsBtn2').toggle();
		});
		
		$('.check-box1').change(function(){
			$('#termsBtn2').toggle();
		});
		
		$('#termsBtn2').click(function(){
			$('#checkDiv2').toggle();
		});
		$('.check-span2').click(function(){
			if($(this).prev('.check-box2').prop("checked")==false){
				$(this).prev('.check-box2').prop("checked",true);
			}else{
				$(this).prev('.check-box2').prop("checked",false);
			}
			$('#termsBtn3').toggle();
		});
		
		$('.check-box2').change(function(){
			$('#termsBtn3').toggle();
		});
		
		$('#termsBtn3').click(function(){
			var x = $(this).offset().left;
			var y = $(this).offset().top+$(this).outerHeight();
			$('#checkDiv3').css("top",y);
			$('#checkDiv3').css("left",x);
			$('#checkDiv3').toggle();
		});
		
		$('#termsBtn4').click(function(){
			var x = $(this).offset().left+"px";
			var y = $(this).offset().top+$(this).outerHeight()+"px";
			$('#checkDiv4').css("top",y);
			$('#checkDiv4').css("left",x);
			$('#checkDiv4').toggle();
			
		});
		$('.check-span3').click(function(){
			if($(this).prev('.check-box3').prop("checked")==false){
				$(this).prev('.check-box3').prop("checked",true);
			}else{
				$(this).prev('.check-box3').prop("checked",false);
			}
			$('#termsBtn4').toggle();
		});
		
		$('.check-box3').change(function(){
			$('#termsBtn4').toggle();
		});
		
		

		
	});

</script>
        <title>assiduitygMain</title>
        <div>
            <article>
               <h3>부서 근태통계</h3>
               <div class="now-div text-center">
               		<span class="now-span" id="nowYearMonth"></span>
               </div>
               <div class="m-d">
               <div class="main-week-div">
               		<div class="week-div">
               			<p class="week-p1 week-pp">늦은출근</p>
               			<p class="week-p2 week-pp" >-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">이른퇴근</p>
               			<p class="week-p2 week-pp" >-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">결근</p>
               			<p class="week-p2 week-pp" >-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">휴가</p>
               			<p class="week-p2 week-pp" >-</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">연장근무</p>
               			<p class="week-p2 week-pp" >-</p>
               		</div>
               </div>
               </div>
               
               <div class="stats-terms" >
               		<button type="button" class="btn btn-outline-info stats-terms" id="termsBtn1">+조건 추가</button>
               		<button type="button" class="btn btn-outline-info stats-terms2 st-tr2" id="termsBtn2" >부서원</button>
               		<button type="button" class="btn btn-outline-info stats-terms2 st-tr3" id="termsBtn3" >날짜</button>
               		<button type="button" class="btn btn-outline-info stats-terms2 st-tr4" id="termsBtn4" >부서명</button>
               
               		<div class="stats-check stats-check1 st-ch1" id="checkDiv1" >
	               		<input type="checkbox" class="check-box1 st-ch1" ><span class="check-span1 st-ch1">부서원</span><br>
	               		<input type="checkbox" class="check-box2 st-ch1" ><span class="check-span2 st-ch1">날짜</span><br>
	               		<input type="checkbox" class="check-box3 st-ch1" ><span class="check-span3 st-ch1">부서명</span><br>
               		</div>
               		
               		<div class="stats-check stats-check2 st-ch2" id="checkDiv2">
	               		<input type="text" class="check-text st-ch2" ><br>
	               		<button class="btn-info box-ok">확인</button>
	               		<button type="button" class="btn btn-light box-cancle">취소</button>
               		</div>
               		
               		<div class="stats-check stats-check3 st-ch3" id="checkDiv3" >
	               		<input type="text" class="check-text st-ch3" ><br>
	               		<button class="btn-info box-ok">확인</button>
	               		<button type="button" class="btn btn-light box-cancle">취소</button>
               		</div>
               		
               		<div class="stats-check stats-check4 st-ch4" id="checkDiv4">
	               		<input type="text" class="check-text2 st-ch4" ><span class="st-ch4">~</span><input type="text" class="check-text2 st-ch4" >
	               		<br>
	               		<button class="btn-info box-ok">확인</button>
	               		<button type="button" class="btn btn-light box-cancle">취소</button>
               		</div>
               
               		<P>데이터 있습니다</P>
               		
               		
               
               </div>
               
               
               
               <br>
               <br>
               
               <div class="ann-div">
               <table class="ann-table">
               <tr>
               		<th class="ann-th">이름</th>
               		<th class="ann-th">부서명</th>
               		<th class="ann-th">날짜</th>
               		<th class="ann-th">출근</th>
               		<th class="ann-th">퇴근</th>
               		<th class="ann-th">결근</th>
               		<th class="ann-th">휴가</th>
               </tr>
               <tr>
               		<td class="ann-td">1</td>
               		<td class="ann-td">2</td>
               		<td class="ann-td">3</td>
               		<td class="ann-td">4</td>
               		<td class="ann-td">5</td>
               		<td class="ann-td">6</td>
               		<td class="ann-td">7</td>
               </tr>
               </table>
				</div>
				

            </article>
        </div>
            <%@ include file="bottom.jsp"%>