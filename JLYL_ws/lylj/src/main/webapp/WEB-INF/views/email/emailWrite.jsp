<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	color: #9baec8;
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
	var fileIndex=0;
	var totalFileSize =0;
	var fileList = new Array();
	var fileSizeList = new Array();
	var uploadSize = 50; //50메가바이트
	var maxUploadSize = 100; // 최대 100메가
	
	 $(function (){
	        // 파일 드롭 다운
	        fileDropDown();
	    });
	 
	    // 파일 드롭 다운
	    function fileDropDown(){
	        var dropZone = $("#dropZone");
	        //Drag기능 
	        dropZone.on('dragenter',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone.css('background-color','#E3F2FC');
	        });
	        dropZone.on('dragleave',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone.css('background-color','#FFFFFF');
	        });
	        dropZone.on('dragover',function(e){
	            e.stopPropagation();
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone.css('background-color','#E3F2FC');
	        });
	        dropZone.on('drop',function(e){
	            e.preventDefault();
	            // 드롭다운 영역 css
	            dropZone.css('background-color','#FFFFFF');
	            
	            var files = e.originalEvent.dataTransfer.files;
	            if(files != null){
	                if(files.length < 1){
	                    alert("폴더 업로드 불가");
	                    return;
	                }
	                selectFile(files)
	            }else{
	                alert("ERROR");
	            }
	        });
	    }
	 	// 파일 선택시
	    function selectFile(files){
	        // 다중파일 등록
	        if(files != null){
	            for(var i = 0; i < files.length; i++){
	                // 파일 이름
	                var fileName = files[i].name;
	                var fileNameArr = fileName.split("\.");
	                // 확장자
	                var ext = fileNameArr[fileNameArr.length - 1];
	                // 파일 사이즈(단위 :MB)
	                var fileSize = files[i].size / 1024 / 1024;
	                
	                if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
	                    // 확장자 체크
	                    alert("등록 불가 확장자");
	                    break;
	                }else if(fileSize > uploadSize){
	                    // 파일 사이즈 체크
	                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
	                    break;
	                }else{
	                    // 전체 파일 사이즈
	                    totalFileSize += fileSize;
	                    
	                    // 파일 배열에 넣기
	                    fileList[fileIndex] = files[i];
	                    
	                    // 파일 사이즈 배열에 넣기
	                    fileSizeList[fileIndex] = fileSize;
	 
	                    // 업로드 파일 목록 생성
	                    addFileList(fileIndex, fileName, fileSize);
	 
	                    // 파일 번호 증가
	                    fileIndex++;
	                }
	            }
	        }else{
	            alert("ERROR");
	        }
	    }
	 
	    // 업로드 파일 목록 생성
	    function addFileList(fIndex, fileName, fileSize){
	        var html = "";
	        html += "<p id='fileTr_" + fIndex + "'>";
	        html += "    <span class='left' >";
	        html +=          fileName + " / " + fileSize + "(MB)"  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn'><i class='fas fa-minus-circle'></i></a>"
	        html += "    </span>"
	        html += "</p>"
	 		
	        $('#fileDiv').append("");
	        $('#fileDiv').append(html);
	    }
	 
	    // 업로드 파일 삭제
	    function deleteFile(fIndex){
	        // 전체 파일 사이즈 수정
	        totalFileSize -= fileSizeList[fIndex];
	        
	        // 파일 배열에서 삭제
	        delete fileList[fIndex];
	        
	        // 파일 사이즈 배열 삭제
	        delete fileSizeList[fIndex];
	        
	        // 업로드 파일 테이블 목록에서 삭제
	        $("#fileTr_" + fIndex).remove();
	    }
	 
	    // 파일 등록
	    function uploadFile(){
	        // 등록할 파일 리스트
	        var uploadFileList = Object.keys(fileList);
	 
	        // 파일이 있는지 체크
	        if(uploadFileList.length == 0){
	            // 파일등록 경고창
	            alert("파일이 없습니다.");
	            return;
	        }
	        
	        // 용량을 500MB를 넘을 경우 업로드 불가
	        if(totalFileSize > maxUploadSize){
	            // 파일 사이즈 초과 경고창
	            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
	            return;
	        }
	            
	        if(confirm("등록 하시겠습니까?")){
	            // 등록할 파일 리스트를 formData로 데이터 입력
	            var form = $('#uploadForm');
	            var formData = new FormData(form);
	            for(var i = 0; i < uploadFileList.length; i++){
	                formData.append('files', fileList[uploadFileList[i]]);
	            }
	            
	            $.ajax({
	                url:"<c:url value='/email/emailWrite'/>",
	                data:formData,
	                type:'POST',
	                enctype:'multipart/form-data',
	                processData:false,
	                contentType:false,
	                dataType:'json',
	                cache:false,
	                success:function(result){
	                    if(result.data.length > 0){
	                        alert("발송되었습니다");
	                        location.reload();
	                    }else{
	                        alert("전송실패");
	                        location.reload();
	                    }
	                }
	            });
	        }
	    }
	    

	    function searchEmpNo(target){
	    	var empNo = target.value;
	    	console.log(empNo);
	    	if(empNo.length>0){
	    		$('#resultEmp').show();		
	    	}
	    }
	    
</script>

<div class="container emailContainer">
	<div class="panel emailPanel">
		<span class="title">메일보내기</span>
				<br>
				<hr>
			<div class="form-group">	
				<button type="button" class="btn btn-secondary">보내기</button>
				<button type="button" class="btn btn-secondary">미리보기</button>
				<button type="button" class="btn btn-secondary">임시저장</button>
			</div>
			<form class="form-horizontal writefrm" role="form" method="post" enctype="multipart/form-data">
				<input type="hidden" name = "mailSend" value="${sessionScope.empNo }">
				<div class="form-group firstFrm row">
			    	<label for="to" class="col-sm-1 control-label">받는사람:</label>
			    	<div class="col-sm-11">
                        <input type="text" class="form-control select2-offscreen textBox" id="mailTake" name="mailTake" tabindex="-1" onkeyup="searchEmpNo(this)">
                     	<input type="button" class="btn_ btn-primary btn-sm bt_address" value="주소록">
						<div id="resultEmp">
							<div class="item"><span class="searchNo"></span></div>
							<div class="item">abd<span class="searchNo">re</span></div>
							<div class="item">ddddd<span class="searchNo">re</span> sd</div>
						</div>                        
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
						<button class="btn btn-primary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						   <i class="far fa-file"></i>
						</button>
					</div><br><br>
						<div class="collapse form-control select2-offscreen fileBox" id="collapseExample">
		                      <div id="dropZone" class="dropZoneDiv"><span style="color: blue;">파일을 드래그 하세요.</span>
						      	<p id="fileDiv"></p>
		                      </div>
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
	});
	
</script>

<%@include file="../inc/bottom.jsp" %>