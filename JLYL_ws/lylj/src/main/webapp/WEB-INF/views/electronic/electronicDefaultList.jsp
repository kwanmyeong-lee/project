<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
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

<div class="shadow-sm p-3 mb-5 bg-body align-middle mx-5 rounded">
	<div class="row justify-content-center">
		<div class="col-md-2 text-center mb-5">
			<h2 class="heading-section bg-light text-dark">결재 대기</h2>
		</div>
	</div>
	<form action="" class="row gx-3 gy-2 ">
		<div class="col-md-12">
			<div class="table-wrap">
				<table class="table table-responsive-xl">
					<thead>
						<tr>
							<th><label class="checkbox-wrap checkbox-primary"> <input
									class="align-middle" type="checkbox">
							</label></th>
							<th>Email</th>
							<th>Username</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<tr class="alert align-middle">
							<td><label class="checkbox-wrap checkbox-primary"> <input
									class="align-middle" type="checkbox">
							</label></td>
							<td class="d-flex align-items-center">
								<div class="pl-3 email">
									<a href="<c:url value='/electronic/electronicDetail?ElectronicNo=7'/>"><span>markotto@email.com</span></a> <span>Added: 01/03/2020</span>
								</div>
							</td>
							<td>Markotto89</td>
							<td class=""><span class="">결재 대기</span></td>
						</tr>
						<tr class="alert">
							<td><label class="checkbox-wrap checkbox-primary"> <input
									class="align-middle" type="checkbox">
							</label></td>
							<td class="d-flex align-items-center">
								<div class="pl-3 email">
									<span>markotto@email.com</span> <span>Added: 01/03/2020</span>
								</div>
							</td>
							<td>Markotto89</td>
							<td class=""><span class="">결재 대기</span></td>
						</tr>

					</tbody>
				</table>
				<div class=" bg-light text-dark col-md-12 row justify-content-center my-5">
					페이징 처리 공간
				</div>
			</div>
		</div>
		<div class="col-md-12 row justify-content-center">
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeSelect">Preference</label>
				<select class="form-select" id="specificSizeSelect">
					<option selected>Choose...</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div>
			<div class="col-sm-2 mr-0">
				<label class="visually-hidden" for="specificSizeInputName">Name</label>
				<input type="text" class="form-control" id="specificSizeInputName"
					placeholder="Jane Doe">
			</div>
			<div class="col-sm-1">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>

</div>
<%@ include file="../inc/bottom.jsp"%>