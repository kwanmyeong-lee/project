<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>

<!-- write -->
<script src='<c:url value="/resources/js/schedule/write.js"/>'></script>
<link href="<c:url value="/resources/css/schedule/write.css"/>" rel="stylesheet" type="text/css">

<!-- alert창 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="container-fluid">
    <h1 id="hWrite" class="h3 mb-4 text-gray-800">일정등록</h1>
    <article class="container-fluid consDiv shadow">
        <br/>
        <div>
            <input type="hidden" id="empNo" value="${sessionScope.empNo }"/>
        </div>
        <div>
            <form name="addform">
                <div class="afdiv">
                    <label class="labelTime labelTime2">일정명</label>
                    <input type="text" class="addTitle" name="scheduleTitle" id="addtitle"/>
                </div>
                <br/>
                <div class="afdiv">
                    <label class="labelTime txLabel">내용</label>
                    <textarea class="txSch" name="scheduleContent" id="scheduleContent" rows="5" style="resize: none;"></textarea>
                </div>
                <br/>
                <div class="afdiv">
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
                    <input type="checkbox" class="chk-day"/><span class="chk-span">종일</span>
                </div>
                <br/>
                <div class="afdiv">
                    <label class="labelTime">내 캘린더</label>
                    <select class="schFol" name="scheduleFolderNo" id="selectMycal">
                        <c:forEach var="i" items="${sfList }">
                            <option value="${i.scheduleFolderNo}">${i.scheduleFolderName}</option>
                        </c:forEach>
                    </select>
                </div>
                <br/>
                <div class="afdiv">
                    <label class="labelTime">색상</label>
                    <input type='color' name="scheduleColor" id='myBestColor' value='#4ea0ec'/>
                </div>
                <br/>
                <div class="afdiv afbtdiv">
                    <button type="button" class="btn btn-info" id="btWrite">확인</button>
                    <button type="button" class="btn btn-secondary" id="cancle">취소</button>
                </div>
                <br/>
            </form>
        </div>
    </article>
</div>
<%@ include file="../inc/bottom.jsp"%>