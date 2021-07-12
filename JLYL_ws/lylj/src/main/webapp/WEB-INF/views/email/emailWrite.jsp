<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="emailtop.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>

<style type="text/css">
.emailContainer{
	margin-left: 20px;
}
.emailPanel{
	padding: 40px;
	width: 1300px;
	background: white;
}
.textBox{
	width: 90%;
	float:left;
}
.title{
	float: left;
	font-weight: bold;
	padding: 5px;
}

.emailcc{
	width: 1100px;
}

.searchbox{
	float: right;
	width: 300px;
}
#startDate{
	width: 120px;

}
#startTime{
	width: 120px;
}

</style>

<div class="container emailContainer">
	<div class="panel emailPanel">
		<span class="title">메일보내기</span>
				<form action="#" class="text-right">
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
				<button type="submit" class="btn btn-secondary">보내기</button>
				<button type="submit" class="btn btn-secondary">미리보기</button>
				<button type="submit" class="btn btn-secondary">임시저장</button>
			</div>
			<form class="form-horizontal writefrm" role="form">
				<div class="form-group firstFrm row">
			    	<label for="to" class="col-sm-1 control-label">받는사람:</label>
			    	<div class="col-sm-11">
                        <input type="email" class="form-control select2-offscreen textBox" id="to" name="to" tabindex="-1">
                     	<input type="button" class="btn_ btn-primary btn-sm bt_address" value="주소록">
			    	</div>
			  	</div>
				<div class="form-group row">
			    	<label for="reference" class="col-sm-1 control-label emailcc">참조:</label>
			    	<div class="col-sm-11">
                    	<input type="email" class="form-control select2-offscreen textBox tx" id="reference" name="reference" tabindex="-1">
			    	</div>
			  	</div>
			  	
				<div class="form-group row">
			    	<label for="bcc" class="col-sm-1 control-label">제목:</label>
			    	<div class="col-sm-11">
                         <input type="email" class="form-control select2-offscreen textBox tx" id="title" name="title" tabindex="-1">
			    	</div>
			  	</div>
			  	<div class="form-group row">
			    	<label for="uploadFile" class="col-sm-1 control-label">파일첨부:</label>
			    	<div class="col-sm-11">
					  <input type="file" multiple="multiple" class="form-control select2-offscreen textBox tx" id="uploadFile">
					</div>
			  	</div>
				<div class="form-group">
					<textarea class="form-control message" id="summernote" ></textarea>
				</div>
				<div class="form-group row chkBook">
					<span>
				    	<label for="yesBook" class="col-sm-1 control-label">전송예약 : </label>
		    			<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="okBook" value="1">
						  <label class="form-check-label" for="okBook">예</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="notBook" value="2" checked="checked">
						  <label class="form-check-label" for="notBook">아니요</label>
						</div>
					</span>
			    </div>
			    <div class="form-group row">
			    	<div class="col-sm-11 row" id="setDate" >
				    	<span>날짜 :
				    	<input type="text" class="scheduleDate" name="startDate" id="startDate">
				    	시간 :
				    	<select class="selectTime" id="startTime" >
			        		<c:forEach var="i" begin="0" end="47">
			        			<c:set var="hour" value="${i/2 - i/2%1}"/>
			        			<c:set var ="sec" value="00"/>
			        			<c:if test="${i%2 eq 1 }">
			        				<c:set var ="sec" value="30"/>
			        			</c:if>
			        			<option class="optionTime" value="${i }"><fmt:formatNumber value="${hour }" pattern="00"  />:${sec }</option>
			        		</c:forEach>
	        			</select>
	        			</span> 
				   </div>
			  	</div>
			</form>
		</div>	
</div>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
	        placeholder: '내용을 입력하세요',
	      	width: 1120,
	   		height: 500,
	   		toolbar: [
	   			['fontname', ['fontname']],
	    		['fontsize', ['fontsize']],
	    		['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    		['color', ['forecolor','color']],
	    		['para', ['ul', 'ol', 'paragraph']],
			],
   			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		});
		
		$('#setDate').hide();
		
		$('input:radio[name=inlineRadioOptions]').click(function(){
			if($('#okBook').is(':checked')){
				$('#setDate').show();
			}else{
				$('#setDate').hide();
			}
		});
	});
	
</script>

<%@include file="emailbottom.jsp" %>