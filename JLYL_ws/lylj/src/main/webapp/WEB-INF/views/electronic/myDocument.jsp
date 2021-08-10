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
		
		$('#insertStamp').click(function(){
			open('<c:url value="/electronic/insertStamp"/>',
					'documentSelect', 'width=800,height=500');
		});
	});
</script>
<style type="text/css">
.list_title {
	color: #999999;
	text-decoration: none;
}
</style>

<div class="limiter">

	<div class="container-table100">
		<h2>최근에 사용한 문서 양식</h2>
		<div class="wrap-table100">
			<div class="table100 ver1 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">양식 번호</th>
								<th class="cell100 column3">사용된 문서 이름</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table100-body">
					<table>
						<tbody>
							<c:if test="${empty list }">
								<tr class="row100 body">
									<td colspan="2" class="cell100 column1">최근에 사용한 문서 스타일이
										없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list }">
								<c:forEach var="eleSty" items="${list }">
									<tr class="row100 body">
										<td class="cell100 column2">${eleSty.STYLE_NO }</td>
										<td class="cell100 column3"><a class="list_title" href="<c:url value = '/electronic/documentDetail?styleNo=${eleSty.STYLE_NO }'/>" 
										onclick="window.open(this.href, '_blank', 'top=40, left=40, width=1000, height=1000, status=no, menubar=no, toolbar=no, resizable=no, directories=no, location=no, resizable=no'); return false;"
										>${eleSty.ELECTRONIC_TITLE }</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="../inc/bottom.jsp"%>
