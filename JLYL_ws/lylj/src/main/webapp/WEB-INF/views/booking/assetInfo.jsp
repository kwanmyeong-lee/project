<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>
<!-- 달력 -->
<link href='<c:url value="/resources/css/main.css"/>' rel="stylesheet"/>
<script src='<c:url value="/resources/js/main.js"/>'></script>

<!-- 달력 날짜 변환 -->
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>

<!-- alert창 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
    rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
<!-- scheduleMain -->
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>
<script src='<c:url value="/resources/js/booking/assetInfo.js"/>'></script>
<link href="<c:url value="/resources/css/booking/assetInfo.css"/>" rel="stylesheet" type="text/css">

<div class="container-fluid ">
    <c:forEach var="i" items="${boTargetList}">
        <c:if test="${i.bookingTargetNo==bTNo}">
            <h1 class="h3 mb-4 text-gray-800">${i.bookingTargetName}</h1>
        </c:if>
    </c:forEach>
    <article class="consDiv shadow">
        <div>
            <input type="hidden" class="bTNo" value="${bTNo }"/>
            <input type="hidden" class="bFNo" value="${bFNo }"/>
            <input type="hidden" class="empNo" value="${empNo }"/>
            <input type="hidden" class="empName" value="${empName }"/>
        </div>
        <br/>
        <div id='calendar' style="position: relative;"></div>
        <!-- 달력 Modal -->
        <div class="modal" id="myModal" data-bs-backdrop="static">
            <div class="modal-dialog ">
                <div
                    class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">예약</h4>
                        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form name="addform">
                            <label class="labelTime">예약일</label>
                            <input type="text" class="scheduleDate" name="startDate" id="startDate"/>
                            <select class="selectTime" id="startTime">
                                <c:forEach var="i" begin="${selectEndTime }" end="47">
                                    <c:set var="hour" value="${i/2 - i/2%1}"/>
                                    <c:set var="sec" value="00"/>
                                    <c:if test="${i%2 eq 1 }">
                                        <c:set var="sec" value="30"/>
                                    </c:if>
                                    <option class="optionTime" id="option-startTime${i}" value="${i }"><fmt:formatNumber value="${hour }" pattern="00"/>:${sec }</option>
                                </c:forEach>
                            </select>
                            <input type="text" class="scheduleDate" name="endDate" id="endDate"/>
                            <select class="selectTime" id="endTime">
                                <c:forEach var="i" begin="0" end="47">
                                    <c:set var="hour" value="${i/2 - i/2%1}"/>
                                    <c:set var="sec" value="00"/>
                                    <c:if test="${i%2 eq 1 }">
                                        <c:set var="sec" value="30"/>
                                    </c:if>
                                    <option class="optionTime" id="option-endTime${i}" value="${i }"><fmt:formatNumber value="${hour }" pattern="00"/>:${sec }</option>
                                </c:forEach>
                            </select>
                            <input type="checkbox" class="chk-day"/><span class="chk-span">종일</span>
                            <br/>
                            <label class="labelTime">예약자</label>
                            <span>${empName}</span><br/>
                            <label class="labelTime labelTime2">예약목적</label><input type="text" id="scheduleContent"/><br/>
                            <br/>
                        </form>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" id="btn-write">일정 상세 입력</button>
                        <button type="button" class="btn btn-info" id="btdd">등록</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <br/>
    </article>
</div>
<%@ include file="../inc/bottom.jsp"%>