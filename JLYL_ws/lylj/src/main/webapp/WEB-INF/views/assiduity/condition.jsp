<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%@ include file="../inc/top.jsp"%>
<!-- 달력 -->
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="<c:url value="/resources/css/assiduity/condition.css"/>" rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/assiduity/top.js"/>'></script>
<script src='<c:url value="/resources/js/assiduity/condition.js"/>'></script>

<title>assiduitygMain</title>
<div class="container-fluid ">
    <h3 class="h3 mb-4 text-gray-800">근태현황</h3>
    <input type="hidden" class="empNo" id="empNoHidden" value="${empNo}"/>
    <article class="consDiv shadow">
        <br/>
        <input type="hidden" id="departmentNoHidden" value="${departmentNo }"/>
        <div class="now-div text-center">
            <span class="now-span" id="nowLeft1">
                <i class="fas fa-chevron-left"></i>
            </span>
            <span class="now-span" id="nowYearMonth1"></span>
            <span class="now-span">~</span>
            <span class="now-span" id="nowYearMonth2"></span>
            <span class="now-span" id="nowRight1">
                <i class="fas fa-chevron-right"></i>
            </span>
            <span class="now-span" id="todayYearMonth1">오늘</span>
        </div>
        <div id="cons-div">
            <div>
                <ul id="ulCol">
                    <li id="liCol2">지각</li>
                    <li id="liCol1">정상</li>
                </ul>
            </div>
            <div>
                <select class="condition-select">
                    <option value="0">검색조건 선택</option>
                    <option value="1">누적근무시간</option>
                    <option value="2">부서원</option>
                </select>
                <form class="select-form select-name" hidden="hidden">
                    <input type="text" id="txName"/>
                    <button type="button" class="search-bt">검색</button>
                </form>
                <form class="select-form select-time" hidden="hidden">
                    <input type="text" class="time-text" id="txTime" oninput="this.value = this.value.replace(/[^0-9]/g, '');"/><span>시간</span>
                    <select id="timeNum">
                        <option value="1">초과</option>
                        <option value="2">미만</option>
                    </select>
                    <button type="button" class="search-bt">검색</button>
                </form>
            </div>
            <div class="condition-div">
                <table class="condition-table">
                    <colgroup>
                        <col style="width: 6%;"/>
                        <col style="width: 10%;"/>
                        <col style="width: 12%;"/>
                        <col style="width: 12%;"/>
                        <col style="width: 12%;"/>
                        <col style="width: 12%;"/>
                        <col style="width: 12%;"/>
                        <col style="width: 12%;"/>
                        <col style="width: 12%;"/>
                    </colgroup>
                    <tr id="tableTr1"></tr>
                    <tbody id="conTBody">
                        <c:if test="${!empty conditionSumList}">
                            <c:forEach var="i" items="${conditionSumList}">
                                <tr>
                                    <td class="condition-td" scope="col">
                                        <p class="td-p">${i.EMP_NAME}</p>
                                        <ul>
                                            <li>${i.POSITION_NAME}</li>
                                            <li>${i.DEPARTMENT_NAME}</li>
                                        </ul>
                                    </td>
                                    <td class="condition-td" scope="col"><c:set var="shour" value="${Math.floor(i.SUM_TIME/3600) }"/>
                                        <c:set var="smin" value="${Math.floor(i.SUM_TIME%3600/60) }"/>
                                        <c:set var="ssec" value="${i.SUM_TIME%3600%60 }"/>
                                        <p class="td-p">
                                            <fmt:formatNumber value='${shour}' pattern='##'/>
                                            h
                                            <fmt:formatNumber value='${smin}' pattern='##'/>
                                            m
                                            <fmt:formatNumber value='${ssec}' pattern='##'/>
                                            s
                                        </p>
                                        <ul>
                                            <c:set var="shour" value="${Math.floor(i.NORMAL_TIME/3600) }"/>
                                            <c:set var="smin" value="${Math.floor(i.NORMAL_TIME%3600/60) }"/>
                                            <c:set var="ssec" value="${i.NORMAL_TIME%3600%60 }"/>
                                            <li>기본:<fmt:formatNumber value='${shour}' pattern='##'/>h
                                                <fmt:formatNumber value='${smin}' pattern='##'/>m
                                                <fmt:formatNumber value='${ssec}' pattern='##'/>s
                                            </li>
                                            <c:set var="shour" value="${Math.floor(i.EXCESS_TIME/3600) }"/>
                                            <c:set var="smin" value="${Math.floor(i.EXCESS_TIME%3600/60) }"/>
                                            <c:set var="ssec" value="${i.EXCESS_TIME%3600%60 }"/>
                                            <li>초과:<fmt:formatNumber value='${shour}' pattern='##'/>h
                                                <fmt:formatNumber value='${smin}' pattern='##'/>m
                                                <fmt:formatNumber value='${ssec}' pattern='##'/>s
                                            </li>
                                        </ul>
                                    </td>
                                    <c:forEach var="addDate" begin="0" end="6">
                                        <c:set var="dateCheck" value="0"/>
                                        <c:forEach var="j" items="${conditionList}">
                                            <c:if test="${nowMili+(24*60*60*addDate) == j.attendanceDayRegdate.getTime()/1000 && j.empNo==i.EMP_NO}">
                                                <td class="condition-td" scope="col">
                                                    <c:choose>
                                                        <c:when test="${nowMili+(24*60*60*addDate)+10*60*60 < j.attendanceDayOnHour.getTime()/1000}">
                                                            <p class="td-p" style="color:#f14f4f">
                                                                <fmt:formatDate value="${j.attendanceDayOnHour}" pattern="HH:mm:dd"/>
                                                                -
                                                                <fmt:formatDate value="${j.attendanceDayOffHour}" pattern="HH:mm:dd"/>
                                                            </p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p class="td-p">
                                                                <fmt:formatDate value="${j.attendanceDayOnHour}" pattern="HH:mm:dd"/>
                                                                -
                                                                <fmt:formatDate value="${j.attendanceDayOffHour}" pattern="HH:mm:dd"/>
                                                            </p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <ul>
                                                        <c:set var="shour" value="${Math.floor(j.normalTimeDay/3600) }"/>
                                                        <c:set var="smin" value="${Math.floor(j.normalTimeDay%3600/60) }"/>
                                                        <c:set var="ssec" value="${j.normalTimeDay%3600%60 }"/>
                                                        <li>기본:<fmt:formatNumber value='${shour}' pattern='##'/>h
                                                            <fmt:formatNumber value='${smin}' pattern='##'/>m
                                                            <fmt:formatNumber value='${ssec}' pattern='##'/>s</li>
                                                        <c:set var="shour" value="${Math.floor(j.excessTimeDay/3600) }"/>
                                                        <c:set var="smin" value="${Math.floor(j.excessTimeDay%3600/60) }"/>
                                                        <c:set var="ssec" value="${j.excessTimeDay%3600%60 }"/>
                                                        <li>초과:<fmt:formatNumber value='${shour}' pattern='##'/>h
                                                            <fmt:formatNumber value='${smin}' pattern='##'/>m
                                                            <fmt:formatNumber value='${ssec}' pattern='##'/>s</li>
                                                    </ul>
                                                </td>
                                                <c:set var="dateCheck" value="${dateCheck+1}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${dateCheck==0 }">
                                            <td class="condition-td" scope="col">
                                                <p class="td-p">-</p>
                                                <ul>
                                                    <li>-</li>
                                                    <li>-</li>
                                                </ul>
                                            </td>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty conditionSumList}">
                            <tr>
                                <td colspan="9" align="center">정보 없음</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <br/>
    </article>
</div>
<%@ include file="../inc/bottom.jsp"%>