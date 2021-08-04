<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<%@ include file="../inc/top.jsp"%>
<!-- 달력 -->
<link href='http://fullcalendar.io/js/fullcalendar-2.5.0/fullcalendar.css' rel='stylesheet'/>
<link href='http://fullcalendar.io/js/fullcalendar-scheduler-1.1.0/scheduler.min.css' rel='stylesheet'/>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-2.5.0/fullcalendar.js'></script>
<script src='http://fullcalendar.io/js/fullcalendar-scheduler-1.1.0/scheduler.js'></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
    rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Main -->
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>
<script src='<c:url value="/resources/js/booking/ko.js"/>'></script>
<script src='<c:url value="/resources/js/booking/schedule.js"/>'></script>
<link href="<c:url value="/resources/css/booking/main.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/booking/assetInfo.css"/>" rel="stylesheet" type="text/css">

<title>bookingMain</title>
<div class="container-fluid ">
    <h3 class="h3 mb-4 text-gray-800">자산 예약 현황</h3>
    <article class="consDiv shadow">
        <br/>
        <div class="main-div">
            <br/>
            <br/>
            <div id='calendar'></div>
        </div>
        <div class="main-div2">
            <h3 class="main-h1">내 예약/대여 현황</h3>
            <table class="table table-hover main-table">
                <colgroup>
                    <col style="width: 15%;"/>
                    <col style="width: 15%;"/>
                    <col style="width: 40%;"/>
                    <col style="width: 20%;"/>
                    <col style="width: 10%;"/>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">자산</th>
                        <th scope="col">이름</th>
                        <th scope="col">예약 기간</th>
                        <th scope="col">신청 날짜</th>
                        <th scope="col">승인여부</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${fn:length(bookingList) <1 }">
                        <tr>
                            <td align="center" colspan="5">예약/대여 중인 항목이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${fn:length(bookingList) >0 }">
                        <c:forEach var="i" items="${bookingList }">
                            <tr>
                                <td>${boTargetList[i.bookingTargetNo-1].bookingTargetName}</td>
                                <td>${empName}</td>
                                <td>${i.bookingStart} ~ ${i.bookingEnd}</td>
                                <td><fmt:formatDate value="${i.bookingCurrent}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <c:choose>
                                    <c:when test="${i.bookingAppFlag==2}">
                                        <td>승인</td>
                                    </c:when>
                                    <c:when test="${i.bookingAppFlag==1}">
                                        <td>반려</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>대기</td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
        <br/>
    </article>
</div>
<%@ include file="../inc/bottom.jsp"%>