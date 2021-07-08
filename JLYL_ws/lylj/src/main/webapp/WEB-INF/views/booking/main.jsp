<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<!-- 달력 -->
<link href='http://fullcalendar.io/js/fullcalendar-2.5.0/fullcalendar.css' rel='stylesheet' />
<link href='http://fullcalendar.io/js/fullcalendar-scheduler-1.1.0/scheduler.min.css' rel='stylesheet' />
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.5.0/fullcalendar.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-scheduler-1.1.0/scheduler.js'></script>


<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- scheduleMain -->
<script src='<c:url value="/resources/js/schedule/main.js"/>'></script>
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>
<script src='<c:url value="/resources/js/booking/ko.js"/>'></script>
<script src='<c:url value="/resources/js/booking/schedule.js"/>'></script>

<title>Insert title here</title>
<style type="text/css">
body {
#calendar {
  max-width: 900px;
  height : auto;
  margin: 0 auto;
}
</style>


<div >
<article>
<div>
	<h1>자산 예약 현황</h1>
	<hr>
	
	<div id='calendar'></div>
</div>

	

</article>
</div>

<%@ include file="bottom.jsp"%>
