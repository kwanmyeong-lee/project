<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript">
	$(function() {
		var fileTarget = $('.filebox .upload-hidden'); 
		fileTarget.on('change', function(){ // 값이 변경되면 
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
	
		
		$('#excelView').click(function(){
			var formData = new FormData();
			formData.append("excelFile",$('#ex_filename')[0].files[0]);
			
			$.ajax({
				type:"post",
				url:"../upload/read",
				processData : false,
				contentType : false,
				data: formData,
				dataType:"json",
				success: function(data){
			    	var str="";
			    	for(var i=0;i<data.length;i++){
			    		var imgUrl = "../resources/img/"
			    		
			    		str+='<tr class="tdStyle">';
			    		str+='<td id="userNameTd" class="userNameClick">';
			    		
			    		if(data[i].H=="남자" || data[i].H=="남" || data[i].H=="1" || data[i].H=="M" || data[i].H=="m"){
			    			imgUrl += "profile_m.png";
				    		str+='<img alt="남자" src="'+imgUrl+'">';
			    		}else if(data[i].H=="여자" || data[i].H=="여" || data[i].H=="2" || data[i].H=="F" || data[i].H=="f"){
			    			imgUrl += "profile_f.png";
				    		str+='<img alt="여자" src="'+imgUrl+'">';
			    		}else{
			    			imgUrl += "profile_o.jpg";
				    		str+='<img alt="" src="'+imgUrl+'">';
			    		}
			    		str+=data[i].A+'</td>';
			    		str+='<td class="telTd">'+data[i].B+'</td>';
			    		str+='<td class="emailTd">'+data[i].C+'</td>';
			    		str+='<td class="positionTd">'+data[i].D+'</td>';
			    		str+='<td class="officeNameTd">'+data[i].E+'</td>';
			    		str+='<td class="officeTelTd">'+data[i].F+'</td>';
			    		str+='<td class="bookFolTd" >'+data[i].G+'</td>';
			    		str+='</tr>';
			    	}
			    		$('#excelBody').html(str);
			    	
			    
				}
			});
		});
		
		$('#excelDown').click(function(){
			location.href="../download/addressBookExcel";
		});
	}); 
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
	<h3>${folVo.addressFolderName}</h3>
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
	<div id="pagingDiv">
		<nav aria-label="Page navigation example" id="pagingNav">
		  <ul class="pagination">
		  	<!-- 이전 블럭 -->
		  	<c:if test="${pagingInfo.firstPage>1 }">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous" onclick="pageProc(${pagingInfo.firstPage-1})">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
		    </c:if>
		    
		    <!-- 페이지 번호 -->
		    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			    <c:if test="${i==pagingInfo.currentPage }">
			    	<li class="page-item active" aria-current="page">
			    	<a class="page-link" href="#" style="background-color: #30a8b9;border-color: #f8f9fc;">${i }</a></li>
			    </c:if>
			    <c:if test="${i!=pagingInfo.currentPage }">
			    	<li class="page-item">
			    	<a class="page-link" href="#" onclick="pageProc(${i})" style="color:#a2a2a2;">${i }</a></li>
			    </c:if>
		    </c:forEach>
		    
		    <!-- 다음 블럭 -->
		    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next" onclick="pageProc(${pagingInfo.lastPage+1})">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
		    </c:if>
		  </ul>
		</nav>	
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>