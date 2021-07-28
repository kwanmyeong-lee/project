<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value="/resources/css/email/email.css"/>">

<style>
.containerDiv{
	width: 100%;
	height: 100%;
	margin: 30px;
}
.panelDiv{
	width: 2000px;
	background: white;
}
.container *{
	font-size: 20px;
	
}
.title{
	font-size: 20px;
	font-weight: bold;
	padding: 10px;	
}
.search{
	font-size: 9px;
}
.searchfrm{
	margin-left: 350px;
	width: 450px;
	float: right;
}
.email{
	min-height: 1000px;
	width : 100%;
	margin-top: 10px;
	background: white;
	padding: 30px;
}
.emailBody{
	width: 95%;
}
#searchBox{
	width: 220px;
}
#btn_search{
	clear:both;
	float: right;
}
.dropdown-menu li a{
	text-decoration: none;
	color: #858796;
}
thead tr th{
	text-align: center;
	font-size: 1.2em;
}
.typeCheck,.typeRead,.typeInportant,.typeFile,.typeName,.typeTime{
	text-align: center;
	font-size: 1.1em;
}
.typeName a,.typeSubject a{
	text-decoration: none;
	font-size: 1.1em;
	color: #858796;
}
</style>

<script type="text/javascript">
	
	$(function(){
		$('#AllCheckbox').change(function(){
			$('.mailItem').prop("checked", this.checked );
		});
		
		$('#multiDelete').click(function(){
			if($('.mailItem').is(':checked')==false){ // check 없을 시
				alert("삭제하실 메일을 선택해주세요");
				return false;
			}else{
				$('form[name=mailFrm]').prop('action','<c:url value="/email/emailMultiDelete"/>');
				$('form[name=mailFrm]').submit();
			}
		});
		
		$('#multiCompleteDelete').click(function(){
			if($('.mailItem').is(':checked')==false){ // check 없을 시
				alert("삭제하실 메일을 선택해주세요");
				return false;
			}else{
				if($('.mailItem').is(':checked')==true){
					confirm("완전히 삭제됩니다. 삭제하시겠습니까?");
					$('form[name=mailFrm]').prop('action','<c:url value="/email/emailMultiCompleteDel"/>');
					$('form[name=mailFrm]').submit();
					
				}
			}
		});
	});

	function pagingProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}

</script>
	<div class="panel-default">
		<!-- BEGIN INBOX -->
			<div class="grid email">
				<div class="grid-body emailBody">
					<div class="row">
						<div class="col-md-12">
							<span class="grid-title title"><i class="fa fa-inbox"></i> 
							<c:if test="${param.type eq 1 }">
								받은메일함
							</c:if>
							<c:if test="${param.type eq '2' }">
								보낸메일함
							</c:if>
							<c:if test="${param.type eq '3' }">
								임시보관함
							</c:if>
							<c:if test="${param.type eq '4' }">
								예약메일함
							</c:if>
							<c:if test="${param.type eq '5' }">
								휴지통
							</c:if>
							<c:if test="${param.type eq '6' }">
								안읽은 메일
							</c:if>
							<c:if test="${param.type eq '7' }">
								중요 메일
							</c:if>
							</span>
							<hr>
							<form action="#" class="searchfrm" method="post" action="<c:url value='/email/emailList'/>">
								<div class="input-group mb-4">
									<select class="form-control" name="searchCondition" style="width: 120px;">
										<option value="">-선택-</option>
										<option value="mail_send">받은/보낸사람</option>
										<option value="mail_title">제목</option>
									</select>
									<input type="text" class="form-control select2-offscreen textBox" placeholder="Search keyword" name="searchKeyword" id="searchBox">
								  	<button class="btn_ btn-primary btn-sm" type="submit" id="btn_search"><i class="fa fa-search"></i></button>
								</div>
							</form>
							<div class="row">
								<div class="col-sm-10 buttonGroup">
									<button type="button" class="btn btn-secondary">읽음</button>
									<c:if test="${param.type ne '3' && param.type ne '4' && param.type ne '5'}">
										<button type="button" class="btn btn-secondary" id="multiDelete">삭제</button>
									</c:if>
									<c:if test="${param.type eq '3' || param.type eq '4' || param.type eq '5'}">
										<button type="button" class="btn btn-secondary" id="multiCompleteDelete">완전삭제</button>
									</c:if>
									<button type="button" class="btn btn-secondary">답장</button>
									<button type="button" class="btn btn-secondary">전달</button>
								</div>
							</div>
							<div></div>
							<form name="mailFrm" method="post">
							<div class="table-responsive">
								<table class="table">
									<colgroup>
								       <col style="width:6%;" />
								       <col style="width:6%;" />
								       <col style="width:6%;" />
								       <col style="width:6%;" />
								       <col style="width:20%;" />
								       <col style="width:35%;" />
								       <col style="width:*;" />      
									</colgroup>
									<thead>
									    <tr id="thStyle">
								            <th><input type="checkbox" id="AllCheckbox"></th>
								            <th>읽음</th>
								            <th>중요</th>
								            <th>첨부</th>
								            <th>
								            	<c:if test="${param.type eq '2' || param.type eq '3' || param.type eq '4' }">받는사람</c:if>
								            	<c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' }">보낸사람</c:if>
								            </th>
								            <th>제목</th>
								            <th>
								            	<c:if test="${param.type eq '4'}">예약전송시간</c:if>
								            	<c:if test="${param.type ne '4'}">보낸시간</c:if>
								            </th>
									    </tr>
							        </thead>
									<tbody>
									<!-- 반복 -->
									<c:if test="${empty list }">
										<tr>
											<td colspan="7" style="text-align: center;">메일함이 비어있습니다.</td>
										</tr>
									</c:if>
									
									<c:if test="${!empty list }">
										<c:set var="idx" value="0"/>
										<c:forEach var="map" items="${list }">
											<input type="hidden" name="selectedEmail[${idx}].mailNo" value="${map['MAIL_NO'] }">
											
											<tr>
												<td class="typeCheck"><input type="checkbox" class="mailItem"/></td>
												<td class="typeRead">
													<c:if test="${empty map['MAIL_READDATE'] }">
														<a class="btn" href="<c:url value='/email/readMail?mailNo=${map["MAIL_NO"] }&type=${param.type }'/>"><i class="far fa-envelope"></i></a>
													</c:if>
													<c:if test="${!empty map['MAIL_READDATE']}">
														<a class="btn" href="<c:url value='/email/notReadMail?mailNo=${map["MAIL_NO"] }&type=${param.type }'/>"><i class="far fa-envelope-open"></i></a>
													</c:if>
												</td>
												<td class="typeInportant">
													<c:if test="${map['MAIL_IMPORTANT']=='I'}">
														<a class="btn bt_important1" href="<c:url value='/email/notImportantEmail?mailNo=${map["MAIL_NO"] }&type=${param.type }'/>"><i class="fas fa-star"></i></a>
													</c:if>
													<c:if test="${map['MAIL_IMPORTANT']=='0'}">
														<a class="btn bt_important2" href="<c:url value='/email/importantEmail?mailNo=${map["MAIL_NO"] }&type=${param.type }'/>"><i class="far fa-star"></i></a>
													</c:if>
												</td>
												<td class="typeFile"><i class="far fa-file btn"></i></td>
												<td class="typeName"> 
													<c:if test="${param.type eq '2' || param.type eq '3' || param.type eq '4' }">${map['MAIL_TAKE']}@lylj.net</c:if>
													<c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' }">${map['MAIL_SEND']}@lylj.net</c:if>
												</td>
												<td class="typeSubject"><a href="<c:url value="/email/emailRead?mailNo=${map['MAIL_NO']}"/>" id="readMail">${map['MAIL_TITLE']} </a></td>
												<td class="typeTime">
												    <c:if test="${param.type eq '4'}"><fmt:formatDate value="${map['MAIL_RESERVE'] }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
												    <c:if test="${param.type ne '4'}"><fmt:formatDate value="${map['MAIL_SENDDATE'] }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<!-- 반복끝 -->
								</tbody>
								</table>
							</div>
						</form>
						<!-- 페이징 form  -->
						<form action="<c:url value='/email/emailList?empNo=${sessionScope.empNo }'/>" 
							name="frmPage" method="post">
							<span><input type="hidden" name="currentPage">
							<input type="hidden" name="searchCondition" value="${param.searchCondition}">
							<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
							</span>	
						</form>
						<!-- 페이징 -->
						<div id="pagingDiv">
							  <ul class="pagination">
								  <c:if test="${pagingInfo.firstPage>1 }">
									    <li class="page-item">
									      <a class="page-link" href="#" onclick="pagingProc(${pagingInfo.firstPage-1})">이전</a>
									    </li>
								  </c:if>
								  
								  <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
								  	 <c:if test="${i==pagingInfo.currentPage }">
									    <li class="page-item"><a class="page-link" href="#" onclick="pagingProc(${i})" style="color: blue;">${i }</a></li>
									 </c:if>
									 <c:if test="${i!=pagingInfo.currentPage }">
									 	<li class="page-item"><a class="page-link" href="#" onclick="pagingProc(${i})">${i }</a></li>
									 </c:if>				 
								  </c:forEach>
								  
								  <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
									    <li class="page-item">
									      <a class="page-link" href="#" onclick="pageProc(${pagingInfo.lastPage+1})">다음</a>
									    </li>
								  </c:if>
							  </ul>
						</div>				
						<!-- END INBOX CONTENT -->
						
					</div>
				</div>
			</div>
		<!-- END INBOX -->
</div>

<%@ include file="../inc/bottom.jsp" %>