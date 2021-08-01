<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<style>
.svg-wrapper {
  height: 50px;
	margin: 0 auto;
  position: relative;
  transform: translateY(-50%);
  width: 200px;
}

.shape {
  fill: transparent;
  stroke-dasharray: 140 540;
  stroke-dashoffset: -474;
  stroke-width: 8px;
  stroke: #19f6e8;
}

.findPwd {
  text-align: center;
  font-family: 'Roboto Condensed';
  font-size: 22px;
  letter-spacing: 8px;
  line-height: 32px;
  position: relative;
  top: -54px;
}

@keyframes draw {
  0% {
    stroke-dasharray: 140 540;
    stroke-dashoffset: -474;
    stroke-width: 8px;
  }
  100% {
    stroke-dasharray: 760;
    stroke-dashoffset: 0;
    stroke-width: 2px;
  }
}

.svg-wrapper:hover .shape {
  -webkit-animation: 0.5s draw linear forwards;
  animation: 0.5s draw linear forwards;
} 
</style>
<script>
</script>
</head>
<body>
<div class="svg-wrapper">
  <svg height="60" width="200" xmlns="http://www.w3.org/2000/svg">
    <rect class="shape" height="50" width="200" />
  </svg>
   <div class="findPwd">찾기</div>
</div>
<div class="svg-wrapper">
  <svg height="60" width="200" xmlns="http://www.w3.org/2000/svg">
    <rect class="shape" height="50" width="200" />
  </svg>
   <div class="findPwd">변경</div>
</div>
</body>
</html>