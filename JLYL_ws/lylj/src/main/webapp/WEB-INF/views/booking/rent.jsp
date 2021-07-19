<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="top.jsp"%>



<!-- rent -->
<script src='<c:url value="/resources/js/booking/top.js"/>'></script>
<link
	href="<c:url value="/resources/css/booking/assetInfo.css"/>"
	rel="stylesheet" type="text/css">
	
<div >
<article>

<div>
	<h1>예약관리</h1>
</div>

<div class="main-div2">
                        <table class="table table-hover main-table">
                            <colgroup>
                                <col style="width: 20%;"/>
                                <col style="width: 20%;"/>
                                <col style="width: 50%;"/>
                                <col style="width: 10%;"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">자산</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">예약 시간</th>
                                    <th scope="col">승인/취소</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td align="center" colspan="4">예약/대여 신청 항목이 없습니다.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
</article>
</div>

<%@ include file="../inc/bottom.jsp"%>
