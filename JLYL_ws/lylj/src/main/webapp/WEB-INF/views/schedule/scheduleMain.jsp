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
<script src='<c:url value="/resources/js/schedule/main.js"/>'></script>
<script src='<c:url value="/resources/js/schedule/schedule.js"/>'></script>
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>
<link href="<c:url value="/resources/css/schedule/scheduleMain.css"/>" rel="stylesheet" type="text/css">
<div class="container-fluid ">
    <h3 class="h3 mb-4 text-gray-800">일정목록</h3>
    <article class="consDiv shadow">
        <div class="head-div">
            <input type="hidden" id="empNo" value="${sessionScope.empNo }"/></div>
        <br/>
        <div id='calendar' style="position: relative;"></div>
        <br/>
        <!-- 달력 Modal -->
        <div class="modal fade" id="myModal" data-bs-backdrop="static">
            <div class="modal-dialog ">
                <div
                    class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">일정 추가</h4>
                        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form name="addform">
                            <label class="labelTime">일정명</label>
                            <input type="text" id="addtitle"/><br/>
                            <label class="labelTime">일시</label>
                            <input type="text" class="scheduleDate" name="startDate" id="startDate" readonly="readonly"/>
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
                            <input type="text" class="scheduleDate" name="endDate" id="endDate" readonly="readonly"/>
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
                            <input type="checkbox" class="chk-day"/>
                            <span class="chk-span">종일</span><br/>
                            <label class="labelTime">내 캘린더</label>
                            <select class="cal-select" id="selectMycal">
                                <c:forEach var="i" items="${sfList }">
                                    <option value="${i.scheduleFolderNo}">${i.scheduleFolderName}</option>
                                </c:forEach>
                            </select>
                            <div id="selectFolcol">
                                <c:forEach var="i" items="${sfList }">
                                    <input type="hidden" id="hiddenMycal${i.scheduleFolderNo}" value="${i.scheduleFolderColor}"/>
                                </c:forEach>
                            </div><br/>
                        </form>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" id="btn-write">일정 상세 입력</button>
                        <button type="button" class="btn btn-info" id="btn-add">등록</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 상세 Modal -->
        <div class="modal fade" id="myDetailModal" data-bs-backdrop="static">
            <div class="modal-dialog ">
                <div
                    class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">상세 일정</h4>
                        <input type="hidden" id="detailScheduleNo"/>
                        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form name="addform">
                            <label class="labelTime2">일정명</label>
                            <span id="detailTitle"></span><br/>
                            <label class="labelTime2">일시</label>
                            <span id="detailStart"></span><span id="detailEnd"></span><span id="detailAllday"></span><br/>
                            <label class="labelTime2">내 캘린더</label>
                            <span id="detailFolder"></span><br/>
                            <label class="labelTime2">색상</label>
                            <input type="color" id="detailColor" disabled="disabled"/><br/>
                            <label class="labelTime2 labelTime4">상세 내용</label>
                            <div class="contentDiv">
                                <span id="detailContent"></span>
                            </div>
                            <br/>
                        </form>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" id="btn-delete">삭제</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </article>
</div>
<%@ include file="../inc/bottom.jsp"%>