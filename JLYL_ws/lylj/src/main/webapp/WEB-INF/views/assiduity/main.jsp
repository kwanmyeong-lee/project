<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="../inc/top.jsp"%>
<!-- 달력 -->
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="<c:url value="/resources/css/assiduity/main.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/ajax/loading.css"/>" rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/main.js"/>'></script>
<title>assiduitygMain</title>
<div class="loading"></div>
<div class="container-fluid">
    <h3 class="h3 mb-4 text-gray-800">근태현황</h3>
    <div class="container-fluid consDiv shadow">
        <br/>
        <article>
            <input type="hidden" class="empNo" value="${empNo }"/>
            <input type="hidden" class="empName" value="${empName }"/>
            <div class="now-div text-center">
                <span class="now-span" id="nowLeft">
                    <i class="fas fa-chevron-left"></i>
                </span>
                <span class="now-span" id="nowYearMonth"></span>
                <span class="now-span" id="nowRight">
                    <i class="fas fa-chevron-right"></i>
                </span>
                <span class="now-span" id="todayYearMonth">이번 달</span>
            </div>
            <div class="m-d">
                <div class="main-week-div">
                    <div class="week-div">
                        <c:set var="shour" value="${Math.floor(selectSumWeekWork/3600) }"/>
                        <c:set var="smin" value="${Math.floor(selectSumWeekWork%3600/60) }"/>
                        <c:set var="ssec" value="${selectSumWeekWork%3600%60 }"/>
                        <p class="week-p1">이번주 누적</p>
                        <p class="week-p2"><fmt:formatNumber value='${shour}' pattern='00'/>h
                            <fmt:formatNumber value='${smin}' pattern='00'/>m
                            <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
                    </div>
                    <span class="divide-bar"></span>
                    <div class="week-div">
                        <c:set var="shour" value="${Math.floor(selectSumWeekWorkEx/3600) }"/>
                        <c:set var="smin" value="${Math.floor(selectSumWeekWorkEx%3600/60) }"/>
                        <c:set var="ssec" value="${selectSumWeekWorkEx%3600%60 }"/>
                        <p class="week-p1">이번주 초과</p>
                        <p class="week-p2"><fmt:formatNumber value='${shour}' pattern='00'/>h
                            <fmt:formatNumber value='${smin}' pattern='00'/>m
                            <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
                    </div>
                    <div class="week-div">
                        <c:set var="shour" value="${Math.floor(selectLeftTimeWeek/3600) }"/>
                        <c:set var="smin" value="${Math.floor(selectLeftTimeWeek%3600/60) }"/>
                        <c:set var="ssec" value="${selectLeftTimeWeek%3600%60 }"/>
                        <p class="week-p1">이번주 잔여</p>
                        <p class="week-p2"><fmt:formatNumber value='${shour}' pattern='00'/>h
                            <fmt:formatNumber value='${smin}' pattern='00'/>m
                            <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
                    </div>
                    <span class="divide-bar"></span>
                    <div class="week-div">
                        <c:set var="shour" value="${Math.floor(selectSumMonthWork/3600) }"/>
                        <c:set var="smin" value="${Math.floor(selectSumMonthWork%3600/60) }"/>
                        <c:set var="ssec" value="${selectSumMonthWork%3600%60 }"/>
                        <p class="week-p1 week-pp">선택한 달 누적</p>
                        <p class="week-p2 week-pp" id="sumMonth"><fmt:formatNumber value='${shour}' pattern='00'/>h
                            <fmt:formatNumber value='${smin}' pattern='00'/>m
                            <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
                    </div>
                    <div class="week-div">
                        <c:set var="shour" value="${Math.floor(selectSumMonthWorkEx/3600) }"/>
                        <c:set var="smin" value="${Math.floor(selectSumMonthWorkEx%3600/60) }"/>
                        <c:set var="ssec" value="${selectSumMonthWorkEx%3600%60 }"/>
                        <p class="week-p1 week-pp">선택한 달 초과</p>
                        <p class="week-p2 week-pp" id="exMonth"><fmt:formatNumber value='${shour}' pattern='00'/>h
                            <fmt:formatNumber value='${smin}' pattern='00'/>m
                            <fmt:formatNumber value='${ssec}' pattern='00'/>s</p>
                    </div>
                </div>
            </div>
            <div>
                <ul id="ulCol">
                    <li id="liCol2">지각</li>
                    <li id="liCol1">정상</li>
                </ul>
            </div>
            <c:set var="dayNum" value="0"/>
            <div class="accordion" id="accordionExample">
                <c:forEach var="weekNo" begin="1" end="6">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne${weekNo }">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne${weekNo }" aria-bs-expanded="false" aria-bs-controls="collapseOne${weekNo }">
                                ${weekNo }주차
                                <c:choose>
                                    <c:when test="${weekTimelist.size()>=weekNo }">
                                        <c:set var="sumhour" value="${Math.floor(weekTimelist.get(weekNo-1)/3600) }"/>
                                        <c:set var="summin" value="${Math.floor(weekTimelist.get(weekNo-1)%3600/60) }"/>
                                        <c:set var="sumsec" value="${weekTimelist.get(weekNo-1)%3600%60 }"/>
                                        <span class="bt-sp" id="weekbtspan${weekNo }"><fmt:formatNumber value='${sumhour}' pattern='00'/>h
                                            <fmt:formatNumber value='${summin}' pattern='00'/>m
                                            <fmt:formatNumber value='${sumsec}' pattern='00'/>s</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="bt-sp" id="weekbtspan${weekNo }"></span>
                                    </c:otherwise>
                                </c:choose>
                                <span class="bt-sp" id="weekNum${weekNo }">누적근무시간</span>
                            </button>
                        </h2>
                        <div id="collapseOne${weekNo }" class="accordion-collapse collapse" aria-labelledby="headingOne${weekNo }" data-bs-parent="#accordionExample">
                            <div class="accordion-body abody abody${weekNo }">
                                <div class="week-header">
                                    <div class="w-h header-date">일자</div>
                                    <div class="w-h header-start">업무시작</div>
                                    <div class="w-h header-end">업무종료</div>
                                    <div class="w-h header-all">총 근무시간</div>
                                    <div class="w-h header-detail">근무시간 상세</div>
                                    <div class="w-h header-approval">승인여부</div>
                                </div>
                                <c:forEach var="weekDay" begin="0" end="6">
                                    <div class="content-link collapsed" data-bs-toggle="collapse" data-bs-target="#content${weekNo }Div${weekDay }" aria-bs-expanded="true" aria-bs-controls="#content${weekNo }Div${weekDay }">
                                        <div class="w-c content-date content-date${weekDay }">
                                            <span>일자</span>
                                            <input type="hidden"/>
                                            <input type="hidden"/>
                                            <input type="hidden"/>
                                        </div>
                                        <c:choose>
                                            <c:when test="${attendMonthList.size()-1 ge dayNum}">
                                                <div class="w-c content-start content-start${weekDay }" id="dayNum${dayNum }">
                                                    <c:if test="${!empty attendMonthList.get(dayNum).attendanceDayOnHour}">
                                                        <c:set var="lateCheck" value="${attendMonthList.get(dayNum).attendanceDayRegdate }"></c:set>
                                                        <c:set var="lateCheck" value="${lateCheck.getTime()+(10*60*60*1000)}"></c:set>
                                                        <c:if test="${lateCheck< attendMonthList.get(dayNum).attendanceDayOnHour.getTime() }">
                                                            <span style="color:#f14f4f;"><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayOnHour}" pattern="HH:mm:ss"/></span>
                                                        </c:if>
                                                        <c:if test="${lateCheck>=attendMonthList.get(dayNum).attendanceDayOnHour.getTime() }">
                                                            <span><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayOnHour}" pattern="HH:mm:ss"/></span>
                                                        </c:if>
                                                        <input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayRegdate.getTime()}"/>
                                                        <input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayOnHour.getTime()}"/>
                                                    </c:if>
                                                    <c:if test="${empty attendMonthList.get(dayNum).attendanceDayOnHour}">
                                                        <span>--:--:--</span>
                                                    </c:if>
                                                </div>
                                                <div class="w-c content-end content-end${weekDay }">
                                                    <c:if test="${!empty attendMonthList.get(dayNum).attendanceDayOffHour}">
                                                        <span><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayOffHour}" pattern="HH:mm:ss"/></span>
                                                        <input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayOffHour.getTime()}"/>
                                                    </c:if>
                                                    <c:if test="${empty attendMonthList.get(dayNum).attendanceDayOffHour.getTime()}">
                                                        <span>--:--:--</span>
                                                    </c:if>
                                                </div>
                                                <div class="w-c content-all content-all${weekDay }">
                                                    <c:if test="${!empty attendMonthList.get(dayNum).attendanceDayWorkHour}">
                                                        <span><fmt:formatDate value="${attendMonthList.get(dayNum).attendanceDayWorkHour}" pattern="HH:mm:ss"/></span>
                                                        <input type="hidden" value="${attendMonthList.get(dayNum).attendanceDayWorkHour.getTime()}"/>
                                                    </c:if>
                                                    <c:if test="${empty attendMonthList.get(dayNum).attendanceDayWorkHour.getTime()}">
                                                        <span>--:--:--</span>
                                                        <input type="hidden" value="0"/>
                                                    </c:if>
                                                </div>
                                                <div class="w-c content-detail content-detail${weekDay }">
                                                    <span>--:--:--</span>
                                                </div>
                                                <div class="w-c content-approval content-approval${weekDay }">
                                                    <c:if test="${!empty attendMonthList.get(dayNum).attendanceDayHolidayFlag}">
                                                        <c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='0'}">
                                                            <span></span>
                                                        </c:if>
                                                        <c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='1'}">
                                                            <span>대기</span>
                                                        </c:if>
                                                        <c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='2'}">
                                                            <span>승인</span>
                                                        </c:if>
                                                        <c:if test="${attendMonthList.get(dayNum).attendanceDayHolidayFlag=='3'}">
                                                            <span>취소</span>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${empty attendMonthList.get(dayNum).attendanceDayHolidayFlag}">
                                                        <span></span>
                                                    </c:if>
                                                </div>
                                                <c:set var="dayNum" value="${dayNum+1 }"/>
                                            </c:when>
                                            <c:when test="${attendMonthList.size()-1 lt dayNum && dayNum<42}">
                                                <div class="w-c content-start content-start${weekDay }" id="dayNum${dayNum }">
                                                    <span>--:--:--</span>
                                                </div>
                                                <div class="w-c content-end content-end${weekDay }">
                                                    <span>--:--:--</span>
                                                </div>
                                                <div class="w-c content-all content-all${weekDay }">
                                                    <span>--:--:--</span>
                                                </div>
                                                <div class="w-c content-detail content-detail${weekDay }">
                                                    <span>--:--:--</span>
                                                </div>
                                                <div class="w-c content-approval content-approval${weekDay }">
                                                    <span></span>
                                                </div>
                                                <c:set var="dayNum" value="${dayNum+1 }"/>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <div id="content${weekNo }Div${weekDay }" class="content-collapse collapse" aria-labelledby="headingOne${weekNo }" data-bs-parent=".abody${weekNo }">
                                        <div class="content-content">
                                            <table class="content-table">
                                                <tr>
                                                    <c:forEach var="i" begin="0" end="23">
                                                        <th colspan="2"><fmt:formatNumber value="${i }" pattern="00"/>:00</th>
                                                    </c:forEach>
                                                </tr>
                                                <tr>
                                                    <c:forEach var="i" begin="0" end="47">
                                                        <td id="content-td${i }"></td>
                                                    </c:forEach>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <input type="hidden" id="exNum" value="${attendMonthList.size()}"/>
            <br/>
        </article>
    </div>
</div>
<%@ include file="../inc/bottom.jsp"%>