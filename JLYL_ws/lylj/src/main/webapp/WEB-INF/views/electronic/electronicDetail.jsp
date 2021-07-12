<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
	rel="stylesheet">

<script
	src="<c:url value = "/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<style type="text/css">
#select-td {
	padding-left: 100px;
	padding-bottom: 15px;
	padding-top: 15px;
}

#select-line {
	width: 79px;
	vertical-align: top;
	display: table;
	table-layout: fixed;
	float: left;
	margin-right: 4px;
}

#select-position {
	display: table-cell;
	text-align: center;
	width: 79px;
	float: left;
	border: 1px solid black;
}

#select-name {
	display: table-cell;
	text-align: center;
	width: 79px;
	float: left;
	height: 100px;
	border: 1px solid black;
}

.selectLine {
	padding: 10px;
	margin: 3px;
}

.selectDiv {
	padding: 10px;
	margin: 0 10px 0 10px;
}

.doc-table {
	border-collapse: collapse;
	border: 1px solid black;
	width: 644px;
	text-align: center;
}

.doc-td {
	background: #D9E2F3;
	padding: 10px;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}

.doc-td2 {
	border-right: 1px solid black;
	border-bottom: 1px solid black;
	padding-left: 10px;
}
</style>


	<div class="container" style="max-width: 1000px;">
		<h1>기안서</h1>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary text-end">결재자
				선택</button>
		</div>
		<div
			class="row align-items-start selectLine border border-5 border-secondary">
			결 <br>재 <br>라 <br> 인
			<div class="col selectDiv ">
				<span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 <img style="width: 40px;"
						alt="아이유" src="<c:url value="/resources/img/아이유1.jpg"/>">
				</span>
				</span> <span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span> <span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span> <span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span>
			</div>

			수 <br>신 <br>라 <br> 인
			<div class="col selectDiv ">
				<span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span> <span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span> <span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span> <span id="select-line"> <span id="select-position">
						대표이사 </span> <span id="select-name"> 이관명 </span>
				</span>
			</div>
		</div>


		<form action="/" method="post" enctype="multipart/form-data"
			id="frm-form"
			style="margin-bottom: 100px; text-align: -webkit-center;">

			<!-- 문서 양식 -->

			<br>
			<h2>휴가신청서</h2>

			<table class="doc-table">
				<tr>
					<td class="doc-td" colspan="3">문서번호</td>
					<td class="doc-td2"><input type="text"></input></td>
					<td class="doc-td">작성일자</td>
					<td class="doc-td2"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td" colspan="3">이 름</td>
					<td class="doc-td2"><input type="text"></input></td>
					<td class="doc-td">직 책</td>
					<td class="doc-td2"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td" colspan="3">소속</td>
					<td class="doc-td2"><input type="text"></input></td>
					<td class="doc-td">부서</td>
					<td class="doc-td2"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td" rowspan="6">신청 내용</td>
					<td class="doc-td" rowspan="4">휴가신청서</td>
					<td class="doc-td">종류</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td">일정</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td">주요행선지</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td">대체근무자</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td" colspan="2">신청사유<br> (자세히)
					</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td" colspan="2">긴급연락처</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>
				<tr>
					<td class="doc-td" colspan="3">참고사항</td>
					<td class="doc-td2" colspan="3"><input type="text"></input></td>
				</tr>

			</table>
			<br>
			<!-- 문서 양식끝 -->
			<br>
			<div >
				<div class="form-group">
					<input type="submit" name="submit" class="btn btn-primary">
					<button type="button" class="btn btn-primary">임시 저장</button>
					<button type="button" class="btn btn-primary">취소</button>
				</div>
			</div>
		</form>
	</div>

<%@ include file="../inc/bottom.jsp"%>