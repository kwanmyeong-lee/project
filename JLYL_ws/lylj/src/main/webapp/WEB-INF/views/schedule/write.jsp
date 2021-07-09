<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="top.jsp"%>

<!-- 달력 -->
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- write -->
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>
<link
	href="<c:url value="/resources/css/schedule/scheduleMain.css"/>"
	rel="stylesheet" type="text/css">



<div >
<article>

<div>
	<h1>일정등록</h1>
	<hr>
</div>

<div>
        <form name="addform">
        	<div class="afdiv">
        	<label class="labelTime labelTime2">일정명</label>
        	<input type="text" class="addTitle">
        	</div>
        	<br>
        	
        	<div class="afdiv">
        	<label class="labelTime txLabel" >내용</label>
        	<textarea class="txSch" rows="5" style="resize: none;"></textarea>
        	</div>
        	<br>
        	
        	<div class="afdiv">
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
        	</div>
        	<br>
        	
        	<div class="afdiv">
        	<label class="labelTime">내 캘린더</label>
        	<select class="schFol">
        		<option>(기본)내 일정</option>
        		<option>zzzadsfasdfasdfas</option>
        		<option>zzz</option>
        	</select>
        	</div>
        	<br>
        	
        	<div class="afdiv">
        	<label class="labelTime">색상</label>
        	<input type='color' id='myBestColor' value='#0000ff'>
        	</div>
        	<br>
        	
        	<div class="afdiv afbtdiv" >
        	<button type="button" class="btn btn-info">확인</button>
        	<button type="button" class="btn btn-secondary">취소</button>
        	</div>
        </form>
      </div>
</article>
</div>

<%@ include file="bottom.jsp"%>
