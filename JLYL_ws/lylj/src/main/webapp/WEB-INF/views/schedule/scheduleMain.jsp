<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>

<!-- 달력 -->
<link href='<c:url value="/resources/css/main.css"/>' rel="stylesheet" />
<script src='<c:url value="/resources/js/main.js"/>'></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	
<!-- 달력 날짜 변환 -->
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>	

<!-- alert창 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- scheduleMain -->
<script src='<c:url value="/resources/js/schedule/main.js"/>'></script>
<script src='<c:url value="/resources/js/schedule/schedule.js"/>'></script>
<script src='<c:url value="/resources/js/schedule/datepicker.js"/>'></script>
<link
	href="<c:url value="/resources/css/schedule/scheduleMain.css"/>"
	rel="stylesheet" type="text/css">



<div >
<article>
<div>
	<h1>일정목록</h1>
	<hr>
</div>

	<div id='calendar' style="position: relative;"></div>


	
<!-- 달력 Modal -->
<div class="modal" id="myModal" data-backdrop="static">
  <div class="modal-dialog ">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="addform">
        	<label class="labelTime labelTime2">일정명</label><input type="text" id="addtitle"><br>
        	<label	class="labelTime">일시</label>
        	<input type="text" class="scheduleDate" name="startDate" id="startDate">
        	<select class="selectTime" id="startTime">
        		<c:forEach var="i" begin="${selectEndTime }" end="47">
        			<c:set var="hour" value="${i/2 - i/2%1}"/>
        			<c:set var ="sec" value="00"/>
        			<c:if test="${i%2 eq 1 }">
        				<c:set var ="sec" value="30"/>
        			</c:if>
        			<option class="optionTime" value="${i }"><fmt:formatNumber value="${hour }" pattern="00"  />:${sec }</option>
        		</c:forEach>
        	</select>
        	
        	<input type="text" class="scheduleDate" name="endDate" id="endDate">
        	<select class="selectTime" id="endTime">
        		<c:forEach var="i" begin="0" end="47">
        			<c:set var="hour" value="${i/2 - i/2%1}"/>
        			<c:set var ="sec" value="00"/>
        			<c:if test="${i%2 eq 1 }">
        				<c:set var ="sec" value="30"/>
        			</c:if>
        			<option class="optionTime" id="option-endTime${i}" value="${i }"> <fmt:formatNumber value="${hour }" pattern="00"  />:${sec }</option>
        		</c:forEach>
        	</select>
        	<input type="checkbox" class="chk-day"><span class="chk-span">종일</span>
        	<br>
        	
        	<label class="labelTime">내 캘린더</label>
        	<select>
        		<option>(기본)내 일정</option>
        		<option>zzz</option>
        		<option>zzz</option>
        	</select>
        	<br>
        	
        </form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="btn-write">일정 상세 입력</button>
        <button type="button" class="btn btn-info" id="btn-add">등록</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>

<!-- 일정 목록 추가 Modal -->
<div class="modal modal2" id="myModaladd" data-backdrop="static">
  <div class="modal-dialog modal-dialog2">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 목록 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="list-add-form">
        	<label class="labelTime labelTime2">일정목록명</label><input type="text" id="addTitle">
        	<br>
      	</form>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="btnAdd">추가</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>


<!-- 일정 목록 수정 Modal -->
<div class="modal modal2" id="myModaledit" data-backdrop="static">
  <div class="modal-dialog modal-dialog2">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 목록 수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="list-edit-form">
        
        	<label class="labelTime">일정 목록</label>
        	<select>
        		<option>(기본)내 일정</option>
        		<option>zzz</option>
        		<option>zzz</option>
        	</select>
        	<br>
        	        	
        	<label class="labelTime labelTime2">일정명</label><input type="text" id="editTitle">
			<br>
        </form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="btnEdit">수정</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>

<!-- 일정 목록 삭제 Modal -->
<div class="modal modal2" id="myModaldelete" data-backdrop="static">
  <div class="modal-dialog modal-dialog2 ">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 목록 삭제</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="list-del-form">
        
        	<label class="labelTime">일정 목록</label>
        	<select>
        		<option>(기본)내 일정</option>
        		<option>zzz</option>
        		<option>zzz</option>
        	</select>
        	<br>        	        	
        </form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="btnDelete">삭제</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
</article>
</div>

<%@ include file="../inc/bottom.jsp"%>
