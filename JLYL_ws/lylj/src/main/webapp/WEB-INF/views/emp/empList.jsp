<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<script type="text/javascript">
	$(function() {
		$("#newAddressBook").click(function() {
			$(".addressBookModal").fadeIn();
		});
		$("#bookWritwCancleBtn").click(function() {
			$(".addressBookModal").hide();
		});
	});
</script>
	<div id="bookMainDiv">
		<h3>주소록</h3>
		<br>
		<div id="searchDiv">
			<select>
				<option></option>
				<option>이름</option>
				<option>전화번호</option>
				<option>이메일</option>
				<option>부서</option>
				<option>직급</option>
			</select>
			<input type="text" id="searchTextBox">
			<input type="submit" value="검색">
		</div>
		<div id="serviceDiv">
		</div>
		<table>
		    <colgroup>
		       <col style="width:5%;" />
		       <col style="width:18%;" />
		       <col style="width:18%;" />
		       <col style="width:18%;" />
		       <col style="width:20%;" />      
		       <col style="width:10%;" />      
		       <col style="width:11%;" />      
		    </colgroup>
	        <thead>
			    <tr id="thStyle">
		            <th><input type="checkbox" name="chkAllMain"></th>
		            <th>이름</th>
		            <th>전화번호</th>
		            <th>이메일</th>
		            <th>부서</th>
		            <th>직급</th>
		            <th>수정/삭제</th>
			    </tr>
	        </thead>
	        <tbody>
		        <c:forEach var="i" begin="1" end="20">
				    <tr id="tdStyle">
			            <td><input type="checkbox"> </td>
			            <td id="userNameTd"><img src="<c:url value='/resources/img/undraw_profile.svg'/>"> <span id="userNameSpan">테스트</span></td>
			           	<td id="telTd" >010-3333-8888</td>
			            <td id="emailTd" >yooh0201@gmail.com</td>
			            <td id="" >웹 백엔드</td>
			            <td id="" >사원</td>
			            <td id="" >
			            		<a href="<c:url value="/emp/empEdit"/>"><button type="button" class="btn btn-success" value="수정"><i class="fas fa-user-edit"></i></button></a>
			            		<a href="<c:url value="/emp/empDelete"/>"><button type="button" class="btn btn-danger" value="삭제"><i class="fas fa-user-minus"></i></button>
			            </td>
				    </tr>
			    </c:forEach>
	        </tbody>
		</table>
		
		<div id="pagingDiv">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
	</div>

<%@ include file="../inc/bottom.jsp" %>