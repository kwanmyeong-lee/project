<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<style>
	.mainContainer{
		width: 100%;
		background: white;
		padding: 20px;
	}
	.infoTable tr{
		padding: 10px;
	}
	td:nth-child(1){
		font-weight: bold;
	}
	td:nth-child(4){
		font-weight: bold;
	}
	.divHeader{
		font-weight: bold;
		font-size: 1.1em;
	}
	.sub1{
	font-size: 1.1em;
	font-weight: 300;
	}
	.bg-gradient-info {
	  background-color: #0b1819;
	  background-image: linear-gradient(180deg, #642ec5, 50%, #161b1c 100%);
	  background-size: cover;
	}

</style>
	<div class="panel mainPanel">
		<div class="card-header py-3">
			<h5 class="m-0 font-weight-bold">관리자 메인페이지</h5>
		</div>
		<div class="mainContainer">
			<p class="divHeader">기본정보</p>
			<hr>
			<table class="infoTable">
				<colgroup>
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 25%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 25%" />
				</colgroup>
				<tr>
					<td scope="col">사이트명</td>
					<td scope="col">IU그룹웨어</td>
					<td scope="col"></td>
					<td scope="col">담당자</td>
					<td scope="col">사이트관리자</td>
					<td scope="col"></td>
				</tr>
				<tr>
					<td >사이트URL</td>
					<td >http://localhost:9091/lylj</td>
					<td ></td>
					<td >도입날짜</td>
					<td >2021-07-20</td>
					<td ></td>
				</tr>
				<tr>
					<td >사용가능인원</td>
					<td >100명</td>
					<td ></td>
					<td >관리자가능인원</td>
					<td >20명</td>
					<td ></td>
				</tr>
				<tr>
					<td >현재사용인원</td>
					<td >67명</td>
					<td ></td>
					<td >현재관리자인원</td>
					<td >8명</td>
					<td ></td>
				</tr>
				<tr>
					<td >사용기간</td>
					<td >무제한</td>
					<td ></td>
					<td ></td>
					<td ></td>
					<td ></td>
				</tr>
			</table>
		</div>
	</div>

<%@ include file="inc/bottom.jsp"%>