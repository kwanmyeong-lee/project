<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link href="<c:url value="/resources/css/ele_document/myDocument.css"/>"
	rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$('#newDocument').click(
				function() {
					open('<c:url value="/electronic/documentSelect"/>',
							'documentSelect', 'width=800,height=500');
				});
	});
</script>
<style type="text/css">
</style>
<h2>자주쓰는 양식</h2>

<div class="limiter">
	<div class="container-table100">
		<div class="wrap-table100">
			<div class="table100 ver1 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1"><label
									class="checkbox-wrap checkbox-primary"> <input
										type="checkbox">
								</label></th>
								<th class="cell100 column2">양식 번호</th>
								<th class="cell100 column3">양식 이름</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table100-body">
					<table>
						<tbody>
							<tr class="row100 body">
								<td class="cell100 column1"><label
									class="checkbox-wrap checkbox-primary"> <input
										class="align-middle" type="checkbox">
								</label></td>
								<td class="cell100 column2">Aaron Chapman</td>
								<td class="cell100 column3">Aaron Chapman</td>
							</tr>

							<tr class="row100 body">
								<td class="cell100 column1"><label
									class="checkbox-wrap checkbox-primary"> <input
										class="align-middle" type="checkbox">
								</label></td>
								<td class="cell100 column2">Mind & Body</td>
								<td class="cell100 column3">Adam Stewart</td>
							</tr>

							<tr class="row100 body">
								<td class="cell100 column1"><label
									class="checkbox-wrap checkbox-primary"> <input
										class="align-middle" type="checkbox">
								</label></td>
								<td class="cell100 column2">Crit Cardio</td>
								<td class="cell100 column3">Aaron Chapman</td>
							</tr>

							<tr class="row100 body">
								<td class="cell100 column1"><label
									class="checkbox-wrap checkbox-primary"> <input
										class="align-middle" type="checkbox">
								</label></td>
								<td class="cell100 column2">Wheel Pose Full Posture</td>
								<td class="cell100 column3">Donna Wilson</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row gx-3 gy-2 text-center">
				<span>1234</span>
			</div>

		</div>
		<div class="col-md-4">
			<label class="visually-hidden" for="specificSizeSelect">Preference</label>
			<select class="form-select" id="specificSizeSelect">
				<option selected>선택</option>
				<option value="1">One</option>
				<option value="2">Two</option>
				<option value="3">Three</option>
			</select>
		</div>
		<div class="col-sm-2">
			<label class="visually-hidden" for="specificSizeInputName">Name</label>
			<input type="text" class="form-control" id="specificSizeInputName"
				placeholder="검색어 입력">
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary">검색</button>
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary">양식 추가</button>
		</div>
	</div>
</div>



<%@ include file="../inc/bottom.jsp"%>
