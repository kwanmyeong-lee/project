<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/top.jsp"%>

<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
<link
    rel="stylesheet" href="<c:url value='/resources/css/addressBook/style.css'/>">
<!-- alert창 디자인 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="<c:url value="/resources/css/booking/property.css"/>" rel="stylesheet" type="text/css">
<script src='<c:url value="/resources/js/booking/property.js"/>'></script>

<div id="bookMainDiv">
    <div class="container">
        <h3 id="h33">자산관리</h3>
        <br/>
        <br/>
        <i class="far fa-edit btns-1 btns fa-5x"></i>
        <div class="tt">
            <input type="hidden" value="#addSel"/>
            <input type="radio" value="0" name="radio-add" id="check1" checked="checked" value="0"/><label class="rent-label" for="check1">목록</label>
            <input type="radio" value="1" name="radio-add" id="check2" class="selFol" value="1"/><label class="rent-label" for="check2">자산</label>
            <input type="text" placeholder="목록명" id="addText1" style="display: inline;"/>
            <select id="addSel" style="display: none;">
                <option value="0">-목록명-</option>
            </select>
            <input type="text" placeholder="자산명" id="addText2" style="display: none;"/>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <i class="fas fa-wrench btns-2 btns fa-5x"></i>
        <div class="tt">
            <input type="hidden" value="#editSel"/>
            <input type="radio" name="radio-edit" id="edit-check1" class="selFol" value="0"/><label class="rent-label" for="edit-check1">목록</label>
            <input type="radio" name="radio-edit" id="edit-check2" class="selTar" value="1"/><label class="rent-label" for="edit-check2">자산</label>
            <select id="editSel">
                <option value="0">-목록명-</option>
            </select>
            <input type="text" id="editText" placeholder="수정명"/>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <i class="fas fa-trash-alt btns-3 btns fa-5x"></i>
        <div class="tt">
            <input type="hidden" value="#delSel"/>
            <input type="radio" name="radio-del" id="del-check1" class="selFol" value="0"/><label class="rent-label" for="del-check1">목록</label>
            <input type="radio" name="radio-del" id="del-check2" class="selTar" value="1"/><label class="rent-label" for="del-check2">자산</label>
            <select id="delSel">
                <option value="0">-목록명-</option>
            </select>
        </div>
        <br/>
        <br/>
    </div>
</div>
<%@ include file="../inc/bottom.jsp"%>