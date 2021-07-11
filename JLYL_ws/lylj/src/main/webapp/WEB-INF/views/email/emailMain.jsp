<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="emailAside.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/email/email.css"/>">

<style>
.container{
	width: 100%;
}
.container *{
	font-size: 15px;
	
}
.title{
	font-size: 20px;
	padding: 10px;	
}
.search{
	font-size: 9px;
}
.searchfrm{
	margin-left: 380px;
	width: 255px;
}
#searchBox{
	width: 200px;
}
#btn_search{
	float: right
}

</style>
<div class="container">	
	<div class="col-md-13">
		<div class="panel panel-default">
		<!-- BEGIN INBOX -->
			<div class="grid email">
				<div class="grid-body">
					<div class="row">
						<div class="col-md-12">
							<span class="grid-title title"><i class="fa fa-inbox"></i> 메일함</span>
							<div class="row">
								<div class="col-sm-5 buttonGroup">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<input type="checkbox" class="selectBox" name="mailCheck" id="mailCheck">
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">전체선택</a></li>
										<li><a href="#">읽은메일 선택</a></li>
										<li><a href="#">중요메일 선택</a></li>
										<li><a href="#">전체해제</a></li>
									</ul>
									
									<button type="button" class="btn btn-secondary">읽음</button>
									<button type="button" class="btn btn-secondary">삭제</button>
									<button type="button" class="btn btn-secondary">답장</button>
									<button type="button" class="btn btn-secondary">전달</button>
								</div>
	
									<!-- 검색  -->
									<form action="#" class="searchfrm" >
										<div class="input-group mb-3 inline">
										  <input type="text" class="form-control" placeholder="Search keyword" id="searchBox">
										  <button class="btn btn-secondary" type="button" id="btn_search"><i class="fa fa-search"></i></button>
										</div>
									</form>
							</div>
							<div class="table-responsive">
								<table class="table">
									<tbody><tr>
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star-o"></i></td>
										<td class="action"><i class="fa fa-bookmark-o"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr>
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star-o"></i></td>
										<td class="action"><i class="fa fa-bookmark"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
	
									<tr>
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star-o"></i></td>
										<td class="action"><i class="fa fa-bookmark-o"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr class="read">
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star-o"></i></td>
										<td class="action"><i class="fa fa-bookmark-o"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr class="read">
	                                    <td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star-o"></i></td>
										<td class="action"><i class="fa fa-bookmark"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr>
	                                    <td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star"></i></td>
										<td class="action"><i class="fa fa-bookmark-o"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr>
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star-o"></i></td>
										<td class="action"><i class="fa fa-bookmark-o"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr class="read">
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star"></i></td>
										<td class="action"><i class="fa fa-bookmark"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
									<tr>
										<td class="action"><input type="checkbox" /></td>
										<td class="action"><i class="fa fa-star"></i></td>
										<td class="action"><i class="fa fa-bookmark-o"></i></td>
										<td class="name"><a href="#">Larry Gardner</a></td>
										<td class="subject"><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed </a></td>
										<td class="time">08:30 PM</td>
									</tr>
								</tbody>
								</table>
							</div>
						<!-- 페이징 -->
							<ul class="pagination">
								<li class="disabled"><a href="#">«</a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">»</a></li>
							</ul>						
						</div>
						<!-- END INBOX CONTENT -->
						
					</div>
				</div>
			</div>
		</div>
		<!-- END INBOX -->
	</div>
</div>

<%@include file="../inc/bottom.jsp" %>