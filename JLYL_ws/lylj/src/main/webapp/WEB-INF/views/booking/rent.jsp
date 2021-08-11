<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<link href="<c:url value="/resources/css/booking/rent.css"/>" rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/booking/rent.js"/>'></script>
<div id="bookMainDiv">
    <div id="allDiv">
        <h3 id="h33">예약승인</h3>
        <button type="button" class="btn btn-outline-success btt" id="successAll">(선택)승인</button>
        <button type="button" class="btn btn-outline-danger btt" id="cancleAll">(선택)반려</button>
    </div>
    <table>
        <colgroup>
            <col style="width: 5%;"/>
            <col style="width: 20%;"/>
            <col style="width: 10%;"/>
            <col style="width: 30%;"/>
            <col style="width: 15%;"/>
            <col style="width: 20%;"/>
        </colgroup>
        <tr>
            <th>
                <input type="checkbox" id="checkAll"/></th>
            <th>자산명</th>
            <th>예약자</th>
            <th>예약기간</th>
            <th>신청시간</th>
            <th class="ths">승인/반려</th>
        </tr>
        <tbody id="excessTBody"></tbody>
    </table>
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
            <c:if test="${pagingInfo.firstPage != 0 }">
	            <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
	                <c:if test="${i==pagingInfo.currentPage }">
	                    <a class="px-1 active" href="#">${i }</a>
	                </c:if>
	                <c:if test="${i!=pagingInfo.currentPage }">
	                    <a class="px-1" href="#">${i }</a>
	                </c:if>
	            </c:forEach>
            </c:if>
            <!-- 다음 블럭 -->
            <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                <a class="arrow ar-forward" href="#">
                    <i class="fas fa-forward"></i>
                </a>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="../inc/bottom.jsp"%>