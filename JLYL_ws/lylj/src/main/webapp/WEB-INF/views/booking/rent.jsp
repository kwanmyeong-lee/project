<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>


<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">

<style>
.page_wrap {
	text-align: center;
	font-size: 20px;
}

.page_nation {
	display: inline-block;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
th{
padding-left:30px; 
}
td{
	border-top: 1px solid gray;
}
.ths{
	text-align: center;
}
.btt{
margin: 5px;
}
#allDiv{
margin-left: 40px;
}
h3{
	margin-top: 40px;
	color : #3a3a3a;
}
</style>
<script>
$(function(){
	$(document).on("click",'#success',function(){ 
		var attendanceDayNo = $(this).prev().val();
		$.ajax({
			type:"get",
			url:"updateExcess",
			data:{
				attendanceDayNo : attendanceDayNo,
				flag : 2
			},
			dataType:"json",
			success: function(data){
				$('#success').prop("disabled",true);
				$('#cancle').prop("disabled",true);
					
				
			}
		});
		
	});
	$(document).on("click",'#successAll',function(){ 
		$('.check').each(function(){
			
			if($(this).prop("checked")){
				var attendanceDayNo=$(this).prev().val();
				$.ajax({
					type:"get",
					url:"updateExcess",
					data:{
						attendanceDayNo : attendanceDayNo,
						flag : 2
					},
					dataType:"json",
					success: function(data){
						$('#success').prop("disabled",true);
						$('#cancle').prop("disabled",true);
					}
				});
			}
		});
	});
	$(document).on("click",'#cancle',function(){ 
		$('.check').each(function(){
			
			if($(this).prop("checked")){
				var attendanceDayNo=$(this).prev().val();
				$.ajax({
					type:"get",
					url:"updateExcess",
					data:{
						attendanceDayNo : attendanceDayNo,
						flag : 1
					},
					dataType:"json",
					success: function(data){
						$('#success').prop("disabled",true);
						$('#cancle').prop("disabled",true);
					}
				});
			}
		});
	});
	
	$(document).on('click','.px-1',function(){
		var currentPage = $(this).text();
		var btCheck =0;
		
	});
	
	$(document).on('click','.ar-forward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var btCheck=1;
		
	});
	
	$(document).on('click','.ar-backward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var btCheck=2;
		
	});
	
	$(document).on('change','#checkAll',function(){
			$('.check').prop("checked",this.checked);
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
					str+='<td class="ths"><input type="hidden" value="'+data.conditionList[i].attendanceDayNo+'"><button type="button" class="btn btn-outline-success btt" id="success">승인</button>';
					str+='<button type="button" class="btn btn-outline-danger btt" id="cancle">거절</button></td>';
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
}

</script>


<div id="bookMainDiv">
<div id="allDiv">
<h3>예약승인</h3>
<button type="button" class="btn btn-outline-success btt" id="successAll">(선택)승인</button>
<button type="button" class="btn btn-outline-danger btt" id="cancleAll">(선택)거절</button>
</div>
<table>
	<colgroup>
	   <col style="width: 5%;"/>
	   <col style="width: 20%;"/>
	   <col style="width: 10%;"/>
	   <col style="width: 45%;"/>
	   <col style="width: 20%;"/>
    </colgroup>
	<tr>
		<th><input type="checkbox" id="checkAll"></th>
		<th>자산명</th>
		<th>예약자</th>
		<th>예약시간</th>
		<th>승인/반려</th>
	</tr>
	<tbody id="excessTBody">
		
	
	</tbody>
</table>

<div class="col-md-16 row justify-content-center py-4 page_wrap">
		<div class="col-sm-2 mr-0 page_nation" style="text-decoration: none;">
			<!-- 이전 블럭 -->
			<c:if test="${pagingInfo.firstPage>1 }">
				<a class="arrow ar-backward" href="#"> 
				<i class="fas fa-backward"></i>
				</a>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i==pagingInfo.currentPage }">
					<a class="px-1 active" href="#">${i }</a>
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a class="px-1" href="#" >${i }</a>
				</c:if>
			</c:forEach>

			<!-- 다음 블럭 -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<a class="arrow ar-forward" href="#"> 
				<i class="fas fa-forward"></i>
				</a>
			</c:if>
		</div>
	</div>

</div>




<%@ include file="../inc/bottom.jsp"%>
