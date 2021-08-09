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
<title>Room</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.container {
	width: 501px;
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

.roomContainer {
	background-color: #e5fffe;
	width: 497px;
	height: 500px;
	overflow: auto;
}

.roomList {
	border: none;
}

.roomList th {
	border: 1px solid #3e9dff;
	background-color: #fff;
	color: #3e9dff;
}

.roomList td {
	border: 1px solid #3e9dff;
	background-color: #fff;
	text-align: left;
	color: #3e9dff;
}

.roomList .num {
	width: 75px;
	text-align: center;
}

.roomList .room {
	width: 350px;
	text-align: center;
}

.roomList .go {
	width: 71px;
	text-align: center;
}

.inputTable th {
	padding: 3px;
}

.inputTable input {
	width: 350px;
	height: 25px;
}
</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function() {
		getRoom();
		createRoom();
	}

	function getRoom() {
		commonAjax("<c:url value = '/getRoom'/>", "", 'post', function(result) {
			createChatingRoom(result);
		});
	}

	function createRoom() {
		$("#createRoom").click(function() {
			var msg = {
				roomName : $('#roomName').val()
			};

			commonAjax('<c:url value = '/createRoom'/>', msg, 'post', function(result) {
				createChatingRoom(result);
			});

			$("#roomName").val("");
		});
	}

	function goRoom(number, name) {
		location.href = "<c:url value = "/moveChating?roomName="/>" + name + "&" + "roomNumber="
				+ number;
	}

	function createChatingRoom(res) {
		if (res != null) {
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			res
					.forEach(function(d, idx) {
						var rn = d.roomName.trim();
						var roomNumber = d.roomNumber;
						tag += "<tr>"
								+ "<td class='num'>"
								+ (idx + 1)
								+ "</td>"
								+ "<td class='room'>"
								+ rn
								+ "</td>"
								+ "<td class='go'><button type='button' class='btn btn-outline-primary btn-sm my-1' onclick='goRoom(\""
								+ roomNumber + "\", \"" + rn
								+ "\")'>참여</button></td>" + "</tr>";
					});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType) {
		$.ajax({
			url : url,
			data : parameter,
			type : type,
			contentType : contentType != null ? contentType
					: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(res) {
				calbak(res);
			},
			error : function(err) {
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
	<div class="container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable  my-3">
				<tr>
					<th>방 제목</th>
					<th><input type="text" class="form-control"  name="roomName" id="roomName"></th>
					<th><button class="btn btn-outline-primary btn-sm" id="createRoom">방 만들기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>