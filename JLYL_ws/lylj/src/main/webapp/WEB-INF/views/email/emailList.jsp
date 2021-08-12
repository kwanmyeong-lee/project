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
		
		$('#multiRead').click(function(){
			if($('.mailItem').is(':checked')==false){ // check 없을 시
				alert("삭제하실 메일을 선택해주세요");
				return false;
			}else{
				if($('.mailItem').is(':checked')==true){
					$('form[name=mailFrm]').prop('action','<c:url value="/email/emailMultiRead"/>');
					$('form[name=mailFrm]').submit();				
				}
			}
		});
		/* 리스트에서 답장 */
		$('#reply').click(function(){
			console.log("답장");
			var len = $('input[type=checkbox]:checked').length;
			console.log(len);
			
			if($('.mailItem').is(':checked')==false){ // check 없을 시
				alert("메일을 선택해주세요");
				return false;
			}else if(len>=2){
				alert("한개만 선택해주세요");
				return false;
			}
			var mailNo = $('input[type=checkbox]:checked').val();
			console.log(mailNo);
			location.href="<c:url value='/email/emailWrite?mailNo="+mailNo+"&type=re'/>"
		});
		
		/* 리스트에서 전달 */
		$('#forward').click(function(){
			console.log("전달");
			var len = $('input[type=checkbox]:checked').length;
			console.log(len);
			
			if($('.mailItem').is(':checked')==false){ // check 없을 시
				alert("메일을 선택해주세요");
				return false;
			}else if(len>=2){
				alert("한개만 선택해주세요");
				return false;
			}
			var mailNo = $('input[type=checkbox]:checked').val();
			console.log(mailNo);
			location.href="<c:url value='/email/emailWrite?mailNo="+mailNo+"&type=fw'/>"
		});
		
		/* 임시저장메일 보내기 */
		$('#sendSaveMail').click(function(){
			console.log("임시저장메일 보내기");
			var len = $('input[type=checkbox]:checked').length;
			console.log(len);
			
			if($('.mailItem').is(':checked')==false){ // check 없을 시
				alert("메일을 선택해주세요");
				return false;
			}else if(len>=2){
				alert("한개만 선택해주세요");
				return false;
			}
			
			var mailNo = $('input[type=checkbox]:checked').val();
			console.log(mailNo);
			location.href="<c:url value='/email/emailWrite?mailNo="+mailNo+"&type=sv'/>"
		});
		
		/* 검색조건 선택 없을 시 안내 */
		$('#btn_search').click(function(){
			console.log('검색');
			if($('select[name=searchCondition]').val()=='' || $('select[name=searchCondition]').val()==null){
				alert('검색조건을 선택하세요');
				event.preventDefault();
				return false;
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
									<c:if test="${param.type eq '1' || param.type eq '6' || param.type eq '7'}">
										<button type="button" class="btn btn-secondary" id="multiRead">읽음</button>
									</c:if>
									<c:if test="${param.type eq '3' }">
										<button type="button" class="btn btn-secondary" id="sendSaveMail">보내기</button>
									</c:if>
									<c:if test="${param.type ne '5'}">
										<button type="button" class="btn btn-secondary" id="multiDelete">삭제</button>
									</c:if>
									<c:if test="${param.type eq '5'}">
										<button type="button" class="btn btn-secondary" id="multiCompleteDelete">완전삭제</button>
									</c:if>
									<c:if test="${param.type eq '1'}">
										<button type="button" class="btn btn-secondary" id="reply">답장</button>
									</c:if>
									<c:if test="${param.type ne '5'}">
										<button type="button" class="btn btn-secondary" id="forward">전달</button>
									</c:if>
								</div>
							</div>
							<div></div>
							<form name="mailFrm" method="post">
							<input type="hidden" name="type" value="${param.type }">
							<div class="table-responsive">
								<table class="table">
									<colgroup>
								       <col style="width:6%;" />
								       <c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' && param.type ne '5'}">
								       		<col style="width:6%;" />
								    		<col style="width:6%;" />
								       </c:if>
								       <col style="width:6%;" />
								       <c:if test="${param.type eq '5' }"> 
								      	 	<col style="width:8%;" />
								       </c:if>
								       <col style="width:20%;" />
								       <col style="width:35%;" />
								       <col style="width:*;" />      
									</colgroup>
									<thead>
									    <tr>
								            <th><input type="checkbox" id="AllCheckbox"></th>
								            <c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' && param.type ne '5'}">
								            	<th>읽음</th>
								            	<th>중요</th>
								            </c:if>
								            <th>첨부</th>
								            <th>
								            	<c:if test="${param.type eq '2' || param.type eq '3' || param.type eq '4' }">받는사람</c:if>
								            	<c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' }">보낸사람</c:if>
								            </th>
								            <c:if test="${param.type eq '5'}">
								            	<th>받는사람</th>
								            </c:if>
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
											<tr>
												<td class="typeCheck"><input type="checkbox" name="selectedEmail[${idx}].mailNo" id="getMailNo" value="${map['MAIL_NO']}" class="mailItem" /></td>
												<c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' && param.type ne '5'}">
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
												 </c:if>
												<td class="typeFile">
													<c:if test="${!empty map['FILE_CHECK_NO'] }">
														<i class="far fa-file btn"></i>
													</c:if>
												</td>
												<td class="typeName"> 
													<c:if test="${param.type eq '2' || param.type eq '3' || param.type eq '4' }">${map['MAIL_TAKE']}@lylj.net</c:if>
													<c:if test="${param.type ne '2' && param.type ne '3' && param.type ne '4' }">${map['MAIL_SEND']}@lylj.net</c:if>
												</td>
												<c:if test="${param.type eq '5'}">
													<td style="text-align: center;">${map['MAIL_TAKE']}@lylj.net</td>
												</c:if>
												<c:if test="${param.type eq '3'}">
													<td class="typeSubject">
														<c:set var="titleLen" value="${map['MAIL_TITLE']}"/>
														<a href="<c:url value="/email/emailWrite?mailNo=${map['MAIL_NO']}&type=sv"/>" id="readMail">
															<c:if test="${fn:length(titleLen)>20 }">
																${fn:substring(titleLen,0,20)}...
															</c:if>
															<c:if test="${fn:length(titleLen)<21 }">
																${titleLen}
															</c:if>
														</a>
													</td>
												</c:if>
												<c:if test="${param.type ne '3'}">
													<td class="typeSubject">
														<c:set var="titleLen" value="${map['MAIL_TITLE']}"/>
														<a href="<c:url value="/email/emailRead?mailNo=${map['MAIL_NO']}"/>" id="readMail">
															<c:if test="${fn:length(titleLen)>20 }">
																${fn:substring(titleLen,0,20)}...
															</c:if>
															<c:if test="${fn:length(titleLen)<21 }">
																${titleLen}
															</c:if>
														</a>
													</td>
												</c:if>
												<td class="typeTime">
												    <c:if test="${param.type eq '4'}"><fmt:formatDate value="${map['MAIL_RESERVE'] }" pattern="yyyy-MM-dd HH:mm"/></c:if>
												    <c:if test="${param.type ne '4'}"><fmt:formatDate value="${map['MAIL_SENDDATE'] }" pattern="yyyy-MM-dd HH:mm"/></c:if>
												</td>
											</tr>
											<c:set var="idx" value="${idx+1}"/>
										</c:forEach>
									</c:if>
									<!-- 반복끝 -->
								</tbody>
								</table>
							</div>
						</form>
						<!-- 페이징 form  -->
						<form action="<c:url value='/email/emailList?empNo=${sessionScope.empNo }&type=${param.type}'/>" 
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