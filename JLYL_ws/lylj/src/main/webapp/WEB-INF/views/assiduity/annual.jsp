<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link
	href="<c:url value="/resources/css/assiduity/top.css"/>"
	rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/top.js"/>'></script>

<style>
.ann-div{
}
.ann-table{
	width: 100%;
	border: 1px solid;
}	
.ann-th{
	border-bottom: 1px solid;
	text-align: center;
}
.ann-td{
	border-bottom: 1px solid;
	text-align: center;
}
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

</style>

<script type="text/javascript">
$(function(){
	$(document).on('click','.px-1',function(){
		var empNo = ${empNo};
		var currentPage = $(this).text();
		var btCheck =0;
		
		pagingAjax(empNo, currentPage, btCheck);
	});
	
	$(document).on('click','.ar-forward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var empNo = ${empNo};
		var btCheck=1;
		
		pagingAjax(empNo, currentPage, btCheck);
	});
	
	$(document).on('click','.ar-backward',function(){
		var currentPage = $('.px-1').eq(0).text();
		var empNo = ${empNo};
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
        		str+="${empVo.departmentName}";
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
        	<!-- 이전 블럭 -->
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
</script>
        <title>assiduitygMain</title>
        <div>
            <article>
               <h3>내 연차 내역</h3>
               <div class="now-div text-center">
               		<span class="now-span" id="nowYearMonth"></span>
               </div>
               <div class="m-d">
               <div class="main-week-div">
               		<div class="week-div">
               			<p class="week-p1">총 연차</p>
               			<p class="week-p2" >${attendVo.attendanceAnnualCount }</p>
               		</div>
               		<span class="divide-bar"></span>
               		<div class="week-div">
               			<p class="week-p1">사용 연차</p>
               			<p class="week-p2" >${attendVo.attendanceAnnualUse }</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1">잔여 연차</p>
               			<p class="week-p2" >${attendVo.attendanceAnnualCount- attendVo.attendanceAnnualUse}</p>
               		</div>
               		<span class="divide-bar"></span>
               		<div class="week-div">
               			<p class="week-p1 week-pp">총 보상 휴가</p>
               			<p class="week-p2 week-pp" >${attendVo.attendanceRewardCount }</p>
               		</div>
               		<div class="week-div">
               			<p class="week-p1 week-pp">사용 보상 휴가</p>
               			<p class="week-p2 week-pp" >${attendVo.attendanceRewardUse }</p>
               		</div>
               </div>
               </div>
               <div class="ann-div">
               <table class="ann-table">
               <thead>
               <tr>
               		<th class="ann-th">이름</th>
               		<th class="ann-th">부서명</th>
               		<th class="ann-th">휴가종류</th>
               		<th class="ann-th">연차 사용기간</th>
               		<th class="ann-th">사용휴가일</th>
               </tr>
               </thead>
               <tbody class="table-tbody">
               <c:if test="${!empty breakDayList }">
               <c:forEach var="i" items="${breakDayList }">
               		<tr>
	               		<td class="ann-td">${i.empName}</td>
	               		<td class="ann-td">${empVo.departmentName}</td>
	               		<td class="ann-td">${i.breakthemeName }</td>
	               		<td class="ann-td"><fmt:formatDate value="${i.breakdayStart}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${i.breakdayEnd}" pattern="yyyy-MM-dd"/></td>
	               		<td class="ann-td">${i.breakdayUse }</td>
               		</tr>
               </c:forEach>
               </c:if>
               <c:if test="${empty breakDayList }">
               		<tr>
               			<td class="ann-td" colspan="5">사용 내역 없음</td>
               		</tr>
               </c:if>
               </tbody>
               </table>
				</div>
				
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
				
				
            </article>
        </div>
            <%@ include file="bottom.jsp"%>