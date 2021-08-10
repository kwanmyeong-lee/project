<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>


<!-- include summernote css/js -->
<link rel="stylesheet" href="<c:url value='/resources/css/summerNote_css/summernote-lite.css'/>">
<script src="<c:url value='/resources/js/summernote-lite.js'/>"></script>
<script src="<c:url value='/resources/js/lang/summernote-ko-KR.js'/>"></script>
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
.fileBox{
	width: 90%;
	height: 150px;
	overflow: scroll;
}
#dropZone{
	width : 100%;
	height: 100%;
	text-align: center;
}
#dropZone>#fileDiv{
	text-align: left;
}
#resultEmp{
	margin-top: 1px;
	position: absolute;
	padding: 0 10px;
	background: white;
	border : 1px solid  #e7e7ea;
	z-index: 1;
}

.item {
	height: 1.8em;
	width: 220px;
	outline: none;
}
.item:hover {
	color: red;
}
.text {
	font-weight: bold;
}
.invisible {
	display: none;
}
.searchNo{
	font-weight: bold;
}

</style>

<script>

	    $(function(){
		    /* 메일보내기 */
	    	$('#bt_sendMail').click(function(){
	    		console.log("메일보내기")
	    		/* 유효성검사 */
	    		if($('#mailTake').val().length<1){
	    			alert("수신자를 입력하세요");
	    			$('#mailTake').focus();
	    			event.preventDefault();
	    			return false;
	    		}else if($('#mailTitle').val().length<1){
	    			alert("메일제목을 입력하세요");
	    			$('#mailTitle').focus();
	    			event.preventDefault();
	    			return false;
	    		}else if($('#summernote').val().length<1){
	    			alert("내용을 입력하세요");
	    			event.preventDefault();
	    			return false;
	    		}
	    		
	    		
	    		//예약시간 셋팅
	    		if($('#okBook').is(":checked")){
	    			var bTime = $('select[name=bookTime]').val();
	    			//${i/2 - i/2%1}
 	    			var hour = bTime/2 - bTime/2%1; 
	    			var min = (bTime/2%1)*60;
	    			if(hour<10){
	    				hour="0"+hour;
	    			}
	    			if(min==0){
	    				min="00";
	    			}
	    			
					var reserv = $('#startDate').val() + " "+hour+":"+min+":"+"00";
					console.log(reserv);
					
					$('input[name=mailReserve]').val(reserv);
					
	    		}else{
	    			$('input[name=mailReserve]').val("");	
	    		}
	    		
	    		var frm = document.emailDataFrm;
	    		frm.action = "<c:url value='/email/emailWrite'/>";
	    		frm.method = "post";
	    		frm.target = "";
	    		frm.submit();
	    	});
	    	
	    	/* 임시저장 */
	    	$('#bt_tempSave').click(function(){
	    		console.log("임시저장")
	    		/* 유효성검사 */
	    		if($('#mailTake').val().length<1){
	    			alert("수신자를 입력하세요");
	    			$('#mailTake').focus();
	    			event.preventDefault();
	    			return false;
	    		}else if($('#mailTitle').val().length<1){
	    			alert("메일제목을 입력하세요");
	    			$('#mailTitle').focus();
	    			event.preventDefault();
	    			return false;
	    		}
	    		
	    		$('input[name=mailTempsave]').val('T');
	    		
	    		temp = document.emailDataFrm;
	    		temp.action = "<c:url value='/email/emailWrite'/>";
				temp.target = "";
	    		temp.method = "post";
	    		temp.submit();
	    	});
	    	
	    });
	    
	    
	    
	    
	    /* 미리보기 */
	    $(function(){
	    	$('#bt_preview').click(function(){
				var newWin = window.open("","preview",'width=500, height=750, status=no, menubar=no, toolbar=no, resizable=no');
				preview = document.emailDataFrm;
				preview.action = "<c:url value='/email/emailPreview'/>";
				preview.target = "preview";
				preview.submit();
				return false;
	    	}); 
	    });
	    
	    
		/* 사원검색 검색 */
	    $(function(){
	   		$('#mailTake').keyup(function(){
	   			$('#resultEmp').show();
	   			var	searchNo = $('#mailTake').val();
	            $.ajax({
	                url: "../emp/searchEmp",
	                data: {searchNo:searchNo},
	                type:'POST',
	                dataType:'json',
	                success:function(result){
	                	var str = "";
	                	for(var i=0;i<result.length;i++){
	                		str+= '<div class="item">'+result[i].empNo+"@lylj.net("+result[i].empName+")"+'</div>'
	                		if(i==5) break;
	                	}
	                	$('#resultEmp').html(str);
	                }

	            });
	   		});
	   		
	   		$(document).on("click",".item",function(){
	    		var resultNo = $(this).text();
	    		$('#mailTake').val(resultNo);
	    		$(this).parent().hide();
	    	});
	   		
	    });
	$(function(){
		$('.btn_fileDel').click(function(){
		});
	});
</script>

<div class="container emailContainer">
	<div class="panel emailPanel">
		<span class="title">메일보내기</span>
				<br>
				<hr>
			<div class="form-group">	
				<button type="button" class="btn btn-secondary" id="bt_sendMail">보내기</button>
				<button type="button" class="btn btn-secondary" id="bt_preview">미리보기</button>
				<button type="button" class="btn btn-secondary" id="bt_tempSave">임시저장</button>
			</div>
			<form class="form-horizontal writefrm" id="emailDataFrm" name="emailDataFrm" enctype="multipart/form-data">
				<input type="hidden" name = "mailSend" value="${sessionScope.empNo }">
				<input type="hidden" name = "mailEmpno" value="${sessionScope.empNo }">
				<input type="hidden" name = "mailTempsave">
				<div class="form-group firstFrm row">
			    	<label for="to" class="col-sm-1 control-label">받는사람:</label>
			    	<div class="col-sm-11">
				    	<c:if test="${!empty reEmailVo}">
	                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1" value="${reEmailVo.mailSend}@lylj.net"  readonly="readonly">
	                    </c:if>
	                    <c:if test="${!empty fwEmailVo}">
	                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1">
	                    </c:if>
	                    <c:if test="${!empty svEmailVo}">
	                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1" value="${svEmailVo.mailTake}@lylj.net">
	                    </c:if>
	                    <c:if test="${!empty empVo}">
	                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1" value="${empVo.empNo}@lylj.net(${empVo.empName})" readonly="readonly" >
	                    </c:if>
	                    <c:if test="${empty reEmailVo && empty fwEmailVo && empty empVo && empty svEmailVo}">
	                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1">
	                    </c:if>
							<div id="resultEmp" style="display: none;">
						</div>                        
			    	</div>
			  	</div>
				<div class="form-group row">
			    	<label for="bcc" class="col-sm-1 control-label">제목:</label>
			    	<div class="col-sm-11">
			    		<c:if test="${!empty reEmailVo}">
                         	<input type="text" class="form-control select2-offscreen textBox tx" id="mailTitle" name="mailTitle" tabindex="-1" value="re: ${reEmailVo.mailTitle}"  readonly="readonly">
			    		</c:if>
                         <c:if test="${!empty fwEmailVo}">
                         	<input type="text" class="form-control select2-offscreen textBox tx" id="mailTitle" name="mailTitle" tabindex="-1" value="fw: ${fwEmailVo.mailTitle}"  readonly="readonly">
			    		</c:if>
			    		<c:if test="${!empty svEmailVo}">
                         	<input type="text" class="form-control select2-offscreen textBox tx" id="mailTitle" name="mailTitle" tabindex="-1" value="${svEmailVo.mailTitle}">
			    		</c:if>
			    		<c:if test="${empty reEmailVo && empty fwEmailVo && empty svEmailVo}">
                         	<input type="text" class="form-control select2-offscreen textBox tx" id="mailTitle" name="mailTitle" tabindex="-1" >
			    		</c:if>
			    	</div>
			  	</div>
			  	<div class="form-group row">
				  	<c:if test="${empty svEmailVo }">
				    	<label for="bcc" class="col-sm-1 control-label">첨부파일:</label>
				  		<div class="col-sm-11">
				    		<input type="file" multiple="multiple" name="upfile" class="form-control select2-offscreen textBox tx" />
				    		<span style="margin-left: 95px; color: blue;">※&nbsp; 파일크기 제한 : 50MB</span><br>
				    		<c:if test="${!empty fwEmailVo}">
				    			<span style="margin-left: 95px; color: blue;">※&nbsp; 파일은 전달되지 않습니다.</span>
				    		</c:if>
				    	</div>
			    	</c:if>
			 	  	<c:if test="${!empty svEmailVo }">
				    	<label for="bcc" class="col-sm-1 control-label">첨부파일:</label>
				  		<div class="col-sm-11">
			    			<input type="file" multiple="multiple" name="upfile" class="form-control select2-offscreen textBox tx" />
			    			<span style="margin-left: 95px; color: blue;">※&nbsp; 파일크기 제한 : 50MB</span><br>
				    	</div>
			    	</c:if>
			   	</div>
	  			<div class="form-group">
					<textarea class="form-control message" id="summernote" name="mailContent">
						<c:if test="${!empty reEmailVo}">
							<br><br>
							---------------------------받은메일내용---------------------------<br>
							보낸사람 : ${reEmailVo.mailSend }<br>
							제목 : ${reEmailVo.mailTitle}<br>
							내용 :
							&nbsp;${reEmailVo.mailContent }<br>
							--------------------------------------------------------------------						
						</c:if>
						<c:if test="${!empty fwEmailVo}">
							<br><br>
							---------------------------받은메일내용---------------------------<br>
							보낸사람 : ${fwEmailVo.mailSend }<br>
							제목 : ${fwEmailVo.mailTitle}<br>
							내용 :
							&nbsp;${fwEmailVo.mailContent }<br>
							--------------------------------------------------------------------						
						</c:if>
						<c:if test="${!empty svEmailVo}">
							${svEmailVo.mailContent }						
						</c:if>
					</textarea>
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
				    <input type="hidden" id="mailReserve" name="mailReserve" value="">
			    	<div class="col-sm-11 row" id="setDate" >
				    	<span>날짜 :
				    	<input type="text" class="scheduleDate" name="startDate" id="startDate" readonly="readonly">
				    	시간 :
				    	<select class="selectTime" id="startTime" name="bookTime">
			        		<c:forEach var="i" begin="0" end="47">
			        			<c:set var="hour" value="${i/2 - i/2%1}"/>
			        			<c:set var ="min" value="00"/>
			        			<c:set var ="sec" value="00"/>
			        			<c:if test="${i%2 eq 1 }">
			        				<c:set var ="min" value="30"/>
			        			</c:if>
			        			<option class="optionTime" value="${i }"><fmt:formatNumber value="${hour }" pattern="00"  />:${min }:${sec }</option>
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
	        tabsize: 2,
	      	width: 1105,
	   		height: 500,
	   		toolbar: [
	   			['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['link','video']],
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
		
		$("#startDate").datepicker( "option", "minDate", 0 );
	});
	
</script>

<%@include file="../inc/bottom.jsp" %>