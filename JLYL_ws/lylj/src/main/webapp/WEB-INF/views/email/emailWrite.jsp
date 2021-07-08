<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://select2.github.io/dist/css/select2.min.css" rel="stylesheet">
<script src="https://select2.github.io/dist/js/select2.full.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style type="text/css">
.textBox{
	width: 90%;
	float:left;
}
.textBox.tx{
	width: 100%;
}
.title{
	float: left;
	font-weight: bold;
	padding: 5px;
}
.searchbox{
	float: right;
	width: 200px
}

</style>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-body message">
		<span class="title">메일쓰기</span>
		
				<form action="#" class="text-right ">
					<div class="input-group searchbox">
						<input type="text" class="form-control input-sm"  placeholder="Search" >
						<span class="input-group-btn">
                         	<button type="submit" name="search" class="btn_ btn-primary btn-sm search"><i class="fa fa-search"></i></button>
                         </span>
					</div>			 
				</form>
				<br>
				<hr>
			<div class="form-group">	
				<button type="submit" class="btn btn-default">보내기</button>
				<button type="submit" class="btn btn-default">미리보기</button>
				<button type="submit" class="btn btn-default">임시저장</button>
			</div>
			<form class="form-horizontal" role="form">
				<div class="form-group">
			    	<label for="to" class="col-sm-1 control-label">받는사람:</label>
			    	<div class="col-sm-11">
                        <input type="email" class="form-control select2-offscreen textBox" id="to" name="to" tabindex="-1">
                     	<input type="button" class="btn_ btn-primary btn-sm bt_address" value="주소록">
			    	</div>
			  	</div>
			  	
				<div class="form-group">
			    	<label for="cc" class="col-sm-1 control-label">참조:</label>
			    	<div class="col-sm-11">
                    	<input type="email" class="form-control select2-offscreen textBox tx" id="reference" name="reference" tabindex="-1">
			    	</div>
			  	</div>
			  	
				<div class="form-group">
			    	<label for="bcc" class="col-sm-1 control-label">제목:</label>
			    	<div class="col-sm-11">
                         <input type="email" class="form-control select2-offscreen textBox tx" id="title" name="title" tabindex="-1">
			    	</div>
			  	</div>
			  	<div class="form-group">
			    	<label for="bcc" class="col-sm-1 control-label">파일첨부:</label>
			    	<div class="col-sm-11">
                         <input type="file" class="textBox tx" id="uploadFile">
			    	</div>
			  	</div>
			</form>
				<div class="form-group">
					<textarea class="form-control" id="summernote" name="body" rows="12" placeholder="Click here to reply"></textarea>
				</div>
			
		</div>	
	</div>	
</div>
<script type="text/javascript">
$('#summernote').summernote({
    tabsize: 2,
    height: 600
   
  });
</script>

<%@include file="../inc/bottom.jsp" %>