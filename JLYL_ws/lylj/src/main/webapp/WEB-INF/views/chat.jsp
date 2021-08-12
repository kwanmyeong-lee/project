<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link href="<c:url value="/resources/css/boot_css/bootstrap.min.css"/>"
rel="stylesheet">
<meta charset="UTF-8">
<title>Chating</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.container {
	width: 500px;
	margin: 0 auto;
	padding: 10px 0px 0px 0px;
}

.container h1 {
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #3e9dff;
	border-left: 3px solid #3e9dff;
	margin-bottom: 20px;
}

.chating {
	background-color: #e5fffe;
	width: 500px;
	height: 500px;
	overflow: auto;
}

.chating .me {
	color: #1c3148;
	text-align: right;
	font-size: 25px;
	font-weight: bold;
}

.chating .others {
	color: #1c3148;
	text-align: left;
	font-size: 25px;
	font-weight: bold;
}


#yourMsg {
	display: none;
}

#userName  {
	width: 347px;
	height: 25px;
}

#chatting {
	width: 384px;
	height: 25px;
}
</style>
</head>

<script type="text/javascript">
	var ws;
	var contPath = getContextPath();

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	}

	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + contPath + "/chating/"
				+ $("#roomNumber").val());
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 동작
		}

		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if (msg != null && msg.trim() != '') {
				var d = JSON.parse(msg);
				if (d.type == "getId") {
					var si = d.sessionId != null ? d.sessionId : "";
					if (si != '') {
						$("#sessionId").val(si);
					}
				} else if (d.type == "message") {
					
					if (d.sessionId == $("#sessionId").val()) {
						$("#chating").append(
								"<p class='me'>" + d.msg + "</p>");
					} else {
						
						/* alert("메시지 받음"); */
						
						$("#chating").append(
								"<p class='others'>" + d.userName + " :"
										+ d.msg + "</p>");
					}

				} else {
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}

	function chatName() {
		var userName = $("#userName").val();
		if (userName == null || userName.trim() == "") {
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		} else {
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option = {
			type : "message",
			roomNumber : $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h1>${roomName}의채팅방</h1>
		<input type="hidden" id="sessionId" value=""> <input
			type="hidden" id="roomNumber" value="${roomNumber}">

		<div id="chating" class="chating my-3"></div>

		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" class="form-control mx-1" name="userName" id="userName"></th>
					<th><button class="btn btn-outline-primary btn-sm" onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input type="text" id="chatting" class="form-control mx-1" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button class="btn btn-outline-primary btn-sm" onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>