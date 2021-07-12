<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style type="text/css">
.divRight {
	text-align: right;
}
</style>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-5 text-center mb-5">
			<h2 class="heading-section">결재 대기</h2>
		</div>
	</div>
	<div class="row">
		<form action="">
			<div class="col-md-12">
				<div class="table-wrap">
					<table class="table table-responsive-xl">
						<thead>
							<tr>
								<th><label class="checkbox-wrap checkbox-primary">
										<input class="align-middle" type="checkbox">
								</label></th>
								<th>Email</th>
								<th>Username</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr class="alert align-middle">
								<td><label class="checkbox-wrap checkbox-primary">
										<input class="align-middle" type="checkbox">
								</label></td>
								<td class="d-flex align-items-center">
									<div class="pl-3 email">
										<span>markotto@email.com</span> <span>Added: 01/03/2020</span>
									</div>
								</td>
								<td>Markotto89</td>
								<td class=""><span class="">결재 대기</span></td>
							</tr>
							<tr class="alert">
								<td><label class="checkbox-wrap checkbox-primary">
										<input class="align-middle" type="checkbox">
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
				</div>
				<div class="input-group mb-3" >
					<label class="input-group-text" for="inputGroupSelect01">Options</label>
					<select class="form-select" id="inputGroupSelect01" style="width: 100px;">
						<option selected>Choose...</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>


				<div class="divRight">

					<br> <br> <input type="text"></input> <input
						type="button" class="btn btn-secondary" id="btMultiAdd" value="찾기">
				</div>

			</div>
		</form>
	</div>
</div>


<%@ include file="../inc/bottom.jsp"%>