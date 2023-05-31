<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/chatting.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>채팅</title>
</head>
<body>
<div class="chatBody" id="chatBody">
<input type="text" id="messageText">
</div>
<div id="chatting-img">
	<img src="${contextPath}/resources/images/guitarduck.png">
</div>
<script type="text/javascript" src="${contextPath}/resources/js/chatting.js"></script>
</body>
</html>