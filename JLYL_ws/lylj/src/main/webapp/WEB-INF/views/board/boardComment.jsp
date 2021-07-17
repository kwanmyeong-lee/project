<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="commentBodyDiv">
    <h4>댓글</h4>
    <hr>
    <div id="commentDiv">
        <span id="userNameComm">작성자</span>
        <button id="detialMenu2" type="button" data-bs-toggle="dropdown" >
            <img src="<c:url value='/resources/img/icons8_menu.png'/>" id="menuImg" alt="메뉴"/>
        </button>
        <ul class="dropdown-menu dropdown-menu-lg-end" aria-labelledby="dropdownMenuLink">
            <li class="dropdown-item">답변</li>
            <li><a class="dropdown-item" href="#">삭제</a></li>
        </ul><br><br>
       
        <span id="contentComm">냉요내용내안녕하세요 으아아아아아ㅏ 아ㅏ...안돼,.!</span><br><br>
        <span id="regdateComm">2021-07-05 23:38:55</span>
        <hr>
    </div>
    <textarea name="commentTa" id="commentTa" cols="140" rows="3"></textarea>
    <button type="button" class="btn btn-primary" id="commentUp">등록</button>
</div>