<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>

<!-- 달력 -->
<link href='<c:url value="/resources/css/main.css"/>' rel="stylesheet" />
<script src='<c:url value="/resources/js/main.js"/>'></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- scheduleMain -->
<script src='<c:url value="/resources/js/schedule/schedule.js"/>'></script>
<link
	href="<c:url value="/resources/css/schedule/scheduleMain.css"/>"
	rel="stylesheet" type="text/css">




<article>

	<div id='calendar' style="position: relative;">

		<div></div>
	</div>
	

		<!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Open modal
</button>

<!-- The Modal -->
<div class="modal" id="myModal" data-backdrop="static">
  <div class="modal-dialog ">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="addform">
        	<label class="labelTime labelTime2">일정명</label><input type="text" id="addtitle"><br>
        	<label	class="labelTime">일시</label>
        	<input type="text" class="scheduleDate" name="startDate" id="startDate">
        	<select class="selectTime" id="startTime">
        		<c:forEach var="i" begin="0" end="47">
        			<c:set var="hour" value="${i/2 - i/2%1}"/>
        			<c:set var ="sec" value="00"/>
        			<c:if test="${i%2 eq 1 }">
        				<c:set var ="sec" value="30"/>
        			</c:if>
        			<option class="optionTime" value="${i }"><fmt:formatNumber value="${hour }" pattern="00"  />:${sec }</option>
        		</c:forEach>
        	</select>
        	
        	<input type="text" class="scheduleDate" name="endDate" id="endDate">
        	<select class="selectTime" id="endTime">
        		<c:forEach var="i" begin="0" end="47">
        			<c:set var="hour" value="${i/2 - i/2%1}"/>
        			<c:set var ="sec" value="00"/>
        			<c:if test="${i%2 eq 1 }">
        				<c:set var ="sec" value="30"/>
        			</c:if>
        			<option class="optionTime" value="${i }"> <fmt:formatNumber value="${hour }" pattern="00"  />:${sec }</option>
        		</c:forEach>
        	</select>
        	<br>
        	
        	<label class="labelTime">내 캘린더</label>
        	<select>
        		<option>(기본)내 일정</option>
        		<option>zzz</option>
        		<option>zzz</option>
        	</select>
        	<br>
        	
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</article>


<%@ include file="../inc/bottom.jsp"%>
