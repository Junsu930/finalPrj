<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.InetAddress"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
<input type="hidden" id="sessionUserName" value="${tempUser.userName }">
<input type="hidden" id="roomNumber" value="${param.roomNumber}">

<div class="chatBody" id="chatBody" style="display:flex;">
	<div class="messageBox" id="messageBox">
		<div class="tapDiv">
			<div class="chatTap" id="chatTap">
				<i class="fa-solid fa-comments"></i>
			</div>
			<div class="x-tap" id="x-tap"> 
				<i class="fa-solid fa-xmark"></i>
			</div>
		</div>
	</div>

	<input type="text" id="messageText">
	<button type="button" onclick="send()" id="sendBtn">전송</button>
</div>

<!--  
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<div id="chatting-img">
	<img src="${contextPath}/resources/images/guitarduck.png">
</div>
-->
<script type="text/javascript" src="${contextPath}/resources/js/chatting.js"></script>
</body>
</html>