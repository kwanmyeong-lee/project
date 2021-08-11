<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="../inc/top.jsp"%>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<!-- 팝업 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="<c:url value="/resources/css/assiduity/top.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/assiduity/stats.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/ajax/loading.css"/>" rel="stylesheet" type="text/css">

<script src='<c:url value="/resources/js/assiduity/stats.js"/>'></script>
<script src='<c:url value="/resources/js/assiduity/top.js"/>'></script>

<title>assiduitygMain</title>

<div class="container-fluid">
    <h3 class="h3 mb-4 text-gray-800">부서 근태통계</h3>
    <article class="consDiv shadow">
        <br/>
        <input type="hidden" class="empNo" id="empNoHidden" value="${empNo }"/>
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
                    <p class="week-p1 week-pp">늦은출근</p>
                    <p class="week-p2 week-pp" id="comeNum">-</p>
                </div>
                <div class="week-div">
                    <p class="week-p1 week-pp">이른퇴근</p>
                    <p class="week-p2 week-pp" id="leaveNum">-</p>
                </div>
                <div class="week-div">
                    <p class="week-p1 week-pp">결근</p>
                    <p class="week-p2 week-pp" id="absenceNum">-</p>
                </div>
                <div class="week-div">
                    <p class="week-p1 week-pp">휴가</p>
                    <p class="week-p2 week-pp" id="breakNum">-</p>
                </div>
                <div class="week-div">
                    <p class="week-p1 week-pp">초과근무</p>
                    <p class="week-p2 week-pp" id="excessNum">-</p>
                </div>
            </div>
        </div>
        <input type="hidden" id="sDate" value=""/>
        <input type="hidden" id="eDate" value=""/>
        <input type="hidden" id="sEmp" value=""/>
        <input type="hidden" id="sDepart" value=""/>
        <div class="contentDivs">
            <div class="stats-terms">
                <button type="button" class="btn btn-outline-info stats-terms" id="termsBtn1">+조건 추가</button>
                <button type="button" class="btn btn-outline-info stats-terms2 st-tr2" id="termsBtn2">부서원:</button>
                <button type="button" class="btn btn-outline-info stats-terms2 st-tr3" id="termsBtn3">부서명:</button>
                <button type="button" class="btn btn-outline-info stats-terms2 st-tr4" id="termsBtn4">날짜:</button>
                <div class="stats-check stats-check1 st-ch1" id="checkDiv1">
                    <input type="checkbox" class="check-box1 st-ch1"/><span class="check-span1 st-ch1">부서원</span><br/>
                    <input type="checkbox" class="check-box2 st-ch1"/><span class="check-span2 st-ch1">부서명</span><br/>
                    <input type="checkbox" class="check-box3 st-ch1"/><span class="check-span3 st-ch1">날짜</span><br/>
                </div>
                <div class="stats-check stats-check2 st-ch2" id="checkDiv2">
                    <input type="text" class="check-text st-ch2" id="searchEmp"/><br/>
                    <button type="button" class="btn-info box-ok" id="btName">확인</button>
                    <button type="button" class="btn btn-light box-cancle">취소</button>
                </div>
                <div class="stats-check stats-check3 st-ch3" id="checkDiv3">
                    <input type="text" class="check-text st-ch3" id="searchDepart"/><br/>
                    <button type="button" class="btn-info box-ok" id="btDepart">확인</button>
                    <button type="button" class="btn btn-light box-cancle">취소</button>
                </div>
                <div class="stats-check stats-check4 st-ch4" id="checkDiv4">
                    <input type="text" class="check-text2 st-ch4" id="startDate" readonly="readonly"/><span class="st-ch4">~</span><input type="text" class="check-text2 st-ch4" id="endDate" readonly="readonly"/>
                    <br/>
                    <button type="button" class="btn-info box-ok" id="btDate">확인</button>
                    <button type="button" class="btn btn-light box-cancle">취소</button>
                </div>
                <button class="btn btn-outline-success" type="button" id="xlsDown">엑셀 다운</button>
                <P id="pDataCheck">데이터 있습니다</P>
            </div>
            <br/>
            <br/>
            <div class="loading"></div>
            <div class="ann-div">
                <table class="ann-table">
                    <tr>
                        <th class="ann-th">이름</th>
                        <th class="ann-th">부서명</th>
                        <th class="ann-th">날짜</th>
                        <th class="ann-th">출근</th>
                        <th class="ann-th">퇴근</th>
                    </tr>
                    <tbody id="viewTBody">
                        <tr></tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-16 row justify-content-center py-4 page_wrap">
                <div
                    class="col-sm-2 mr-0 page_nation" style="text-decoration: none;">
                    <!-- 이전 블럭 -->
                    <c:if test="${pagingInfo.firstPage>1 }">
                        <a class="arrow ar-backward" href="#">
                            <i class="fas fa-backward"></i>
                        </a>
                    </c:if>
                    <!-- 페이지 번호 -->
                    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
                        <c:if test="${i==pagingInfo.currentPage }">
                            <a class="px-1 active" href="#">${i }</a>
                        </c:if>
                        <c:if test="${i!=pagingInfo.currentPage }">
                            <a class="px-1" href="#">${i }</a>
                        </c:if>
                    </c:forEach>
                    <!-- 다음 블럭 -->
                    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                        <a class="arrow ar-forward" href="#">
                            <i class="fas fa-forward"></i>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
        <br/>
    </article>
</div>
<%@ include file="../inc/bottom.jsp"%>