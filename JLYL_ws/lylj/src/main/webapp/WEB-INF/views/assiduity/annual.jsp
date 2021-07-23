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
}
.ann-td{
	border-bottom: 1px solid;
}
</style>

<script type="text/javascript">


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
               <tr>
               		<th class="ann-th">이름</th>
               		<th class="ann-th">부서명</th>
               		<th class="ann-th">휴가종류</th>
               		<th class="ann-th">연차 사용기간</th>
               		<th class="ann-th">사용휴가일</th>
               </tr>
               <c:forEach var="i" items="${breakDayList }">
               		<tr>
	               		<td class="ann-td">${empName}</td>
	               		<td class="ann-td">${empVo.departmentName}</td>
	               		<td class="ann-td">${i.BREAKTHEME_NAME }</td>
	               		<td class="ann-td"><fmt:formatDate value="${i.BREAKDAY_START}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${i.BREAKDAY_END}" pattern="yyyy-MM-dd"/></td>
	               		<td class="ann-td">${i.beakdayEnd-i.beakdayStart}</td>
               		</tr>
               </c:forEach>
               </table>
				</div>

            </article>
        </div>
            <%@ include file="bottom.jsp"%>