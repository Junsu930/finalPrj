<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.InetAddress"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/chatting.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>채팅</title>
</head>
<body>
<%
	String strIpAddress = "";

	try {
		InetAddress inetAddress = InetAddress.getLocalHost();
		strIpAddress = inetAddress.getHostAddress();
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<input type="hidden" id="ipAddr" value="<%=strIpAddress%>">
<input type="hidden" id="sessionId" value="">
<div class="chatBody" id="chatBody">
	<div class="messageBox" id="messageBox">

	</div>
	<input type="text" id="messageText">
	<button type="button" onclick="send()" id="sendBtn">전송</button>
</div>
<div id="chatting-img">
	<img src="${contextPath}/resources/images/guitarduck.png">
</div>
<script type="text/javascript" src="${contextPath}/resources/js/chatting.js"></script>
</body>
</html>