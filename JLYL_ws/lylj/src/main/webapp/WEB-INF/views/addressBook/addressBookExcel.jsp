<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript">
	$(function() {
		var fileTarget = $('.filebox .upload-hidden'); 
		
		/* 파일 업로드 */
		fileTarget.on('change', function(){ // 값이 변경되면 
			$('#fileChangHidden').val(0);
			if(!/\.(xls|xlsx)$/i.test($(this)[0].files[0].name)){
				$(this).val("");
				$(this).siblings('.upload-name').val("파일선택");
				return;
			}
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입 
			$(this).siblings('.upload-name').val(filename);
			
		});
	
		/* 엑셀 목록 보기*/
		$('#excelView').click(function(){
			excelViewAjax(1,0);
			$('#fileChangHidden').val(1);
		});
		
		/* 양식 다운로드 */
		$('#excelDown').click(function(){
			location.href="../download/addressBookExcel";
		});
		
		
		/* 페이징 처리 */
		$(document).on('click','.px-1',function(){
			var currentPage = $(this).text();
			var btCheck =0;
			excelViewAjax(currentPage,btCheck);
			
		});
		
		$(document).on('click','.ar-forward',function(){
			var currentPage = $('.px-1').eq(0).text();
			var btCheck=1;
			excelViewAjax(currentPage,btCheck);
		});
		
		$(document).on('click','.ar-backward',function(){
			var currentPage = $('.px-1').eq(0).text();
			var btCheck=2;
			excelViewAjax(currentPage,btCheck);
		});
		/* 페이징 처리 */
		
		/* 엑셀 정보 주소록에 insert*/
		$('#excelInsert').click(function(){
			if($('#ex_filename').val()==""){ // 파일 유효성 검사
				Swal.fire({
					  icon: 'error',
					  text: "파일을 업로드 하세요",
					})
				return;
			}
			
			var formData = new FormData();
			formData.append("excelFile",$('#ex_filename')[0].files[0]);
			formData.append("empNo",$('#empNoHidden').val());
			$.ajax({
				type:"post",
				url:"../upload/insert",
				processData : false,
				contentType : false,
				data: formData,
				dataType:"json",
				success: function(data){
					Swal.fire({
						  icon: 'success',
						  title: '등록 성공!',
						  showConfirmButton: false,
						  timer: 1500
						})
				}
			});
		});
		
		
	}); 

/* 페이징 처리 된 엑셀의 목록 가져오기 */
function excelViewAjax(currentPage, btCheck){
	if($('#ex_filename').val()==""){ // 파일 유효성 검사
		Swal.fire({
			  icon: 'error',
			  text: "파일을 업로드 하세요",
			})
		return;
	}
	
	var formData = new FormData();
	formData.append("excelFile",$('#ex_filename')[0].files[0]);
	formData.append("currentPage",currentPage);
	formData.append("btCheck",btCheck);
	$.ajax({
		type:"post",
		url:"../upload/read",
		processData : false,
		contentType : false,
		data: formData,
		dataType:"json",
		success: function(data){
			/* 엑셀 목록 view */
	    	var str="";
	    	for(var i=0;i<data.excelContent.length;i++){
	    		var imgUrl = "../resources/img/"
	    		
	    		str+='<tr class="tdStyle">';
	    		str+='<td id="userNameTd" class="userNameClick">';
	    		
	    		if(data.excelContent[i].H=="남자" || data.excelContent[i].H=="남" || data.excelContent[i].H=="1" || data.excelContent[i].H=="M" || data.excelContent[i].H=="m"){
	    			imgUrl += "profile_m.png";
		    		str+='<img alt="남자" src="'+imgUrl+'">';
	    		}else if(data.excelContent[i].H=="여자" || data.excelContent[i].H=="여" || data.excelContent[i].H=="2" || data.excelContent[i].H=="F" || data.excelContent[i].H=="f"){
	    			imgUrl += "profile_f.png";
		    		str+='<img alt="여자" src="'+imgUrl+'">';
	    		}else{
	    			imgUrl += "profile_o.jpg";
		    		str+='<img alt="" src="'+imgUrl+'">';
	    		}
	    		str+=data.excelContent[i].A+'</td>';
	    		str+='<td class="telTd">'+data.excelContent[i].B+'</td>';
	    		str+='<td class="emailTd">'+data.excelContent[i].C+'</td>';
	    		str+='<td class="positionTd">'+data.excelContent[i].D+'</td>';
	    		str+='<td class="officeNameTd">'+data.excelContent[i].E+'</td>';
	    		str+='<td class="officeTelTd">'+data.excelContent[i].F+'</td>';
	    		str+='<td class="bookFolTd" >'+data.excelContent[i].G+'</td>';
	    		str+='</tr>';
	    	}
	    	
	    	$('#excelBody').html(str);
	    	
	    	/* 페이징 */
	    	var pageStr="";
        	if(data.pagingInfo.firstPage>1){
        		pageStr+='<a class="arrow ar-backward" href="#"><i class="fas fa-backward"></i></a>'
        	}
			for(var i=data.pagingInfo.firstPage; i<=data.pagingInfo.lastPage; i++){
				if(i==data.pagingInfo.currentPage){
					pageStr+='<a class="px-1 active" href="#">';
					pageStr+=i;
					pageStr+='</a>';
				}else{
					pageStr+='<a class="px-1" href="#" >';
					pageStr+=i;
					pageStr+='</a>';
				}
			}
			if(data.pagingInfo.lastPage<data.pagingInfo.totalPage){
				pageStr+='<a class="arrow ar-forward" href="#"><i class="fas fa-forward"></i></a>'
			}
        	
        	$('.page_nation').html(pageStr);
	    		
	    
		}
	});
	
}	
</script>
<style>
.serviceDiv{
	width: 93%;
}
.filebox input[type="file"] { 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
} 

.filebox {
	margin-left: 40px;
	margin-bottom: 10px;
}

.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: #1cc88a; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #ffffff; 
	cursor: pointer; 
	border: 1px solid #1cc88a; 
	border-radius: .25em; 
	margin: 0;
} 
.filebox label:hover{
	color: #ffffff;
	background-color: #1cc88a;
}

/* named upload */ 
.filebox .upload-name { 
	display: inline-block; 
	padding: .5em .75em; /* label의 패딩값과 일치 */ 
	font-size: inherit; 
	font-family: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #f5f5f5; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}

.excel-btn {
	height: 40px;
}

</style>
<div id="bookMainDiv">
	<h3>주소록 등록(엑셀)</h3>
	<input type="hidden" id="empNoHidden" value="${empNo}">
	<input type="hidden" id="fileChangHidden" value="0">
	<br>
	<div id="serviceDiv">
		<form class="excel-form" id="excelFrm" name="emailDataFrm" enctype="multipart/form-data" >
			<div class="filebox"> 
				<input class="upload-name" value="파일선택" disabled="disabled"> 
				<label for="ex_filename">업로드</label> 
				<input type="file" id="ex_filename" name="excelFile" class="upload-hidden" accept=".xls, .xlsx"> 
				<button type="button" class="excel-btn btn btn-outline-secondary" id="excelDown">양식받기</button>
				<button type="button" class="excel-btn btn btn-outline-secondary" id="excelView">보기</button>
				<button type="button" class="excel-btn btn btn-outline-secondary" id="excelInsert">등록</button>
			</div>
		</form>
		
	</div>
	<!-- 페이징 처리를 위한 form -->
	<form action="<c:url value='/addressBook/list?addressFolderNo=${param.addressFolderNo}'/>" 
	   name="frmPage" method="post" id="frmPage" hidden="hidden">
	   <input type="hidden" name="addressFolderNo" value="${param.addressFolderNo }"><br>
	   <input type="hidden" name="currentPage" value=${pagingInfo.currentPage }><br>
    </form>
	<table>
	    <colgroup>
	       <col style="width:12.5%;" />
	       <col style="width:15%;" />
	       <col style="width:20%;" />
	       <col style="width:10%;" />
	       <col style="width:12.5%;" />
	       <col style="width:15%;" />      
	       <col style="width:18%;" />      
	    </colgroup>
       <thead>
	    <tr id="thStyle">
            <th><span style="padding-left: 15px;">이름</span></th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>직위</th>
            <th>회사</th>
            <th>회사번호</th>
            <th>카테고리</th>
	    </tr>
       </thead>
       <tbody id="excelBody">
        
       </tbody>
	</table>
	
	<!-- 페이징 -->
	<div class="col-md-16 row justify-content-center py-4 page_wrap">
        <div
            class="col-sm-2 mr-0 page_nation" style="text-decoration: none;">
        </div>
    </div>
</div>
<%@ include file="../inc/bottom.jsp"%>