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
<div class="chatBody" id="chatBody" style="display: none;">
	<div class="messageBox" id="messageBox">
		<div class="tapDiv">
			<div class="chatTap">
				<i class="fa-solid fa-comments"></i>
			</div>
			<div class="x-tap"> 
				<i class="fa-solid fa-xmark"></i>
			</div>
		</div>
	</div>
	<input type="text" id="messageText">
	<button type="button" onclick="send()" id="sendBtn">전송</button>
</div>
<div class="roomList" id="roomList">
	<div class="roomBox">
		<c:if test="${empty sessionScope.chatRoomList}">
			<div class="noRoom">
				채팅방이 없습니다!!
			</div>
		</c:if>
		<c:if test="${!empty sessionScope.chatRoomList}">			
			<c:forEach var="chatList" items="${sessionScope.chatRoomList}">
				<div class="eachRoomList">
					${chatList.chatTitle }
				</div>
			</c:forEach>	
		</c:if>
	</div>
</div>
<div id="chatting-img">
	<img src="${contextPath}/resources/images/guitarduck.png">
</div>
<script type="text/javascript" src="${contextPath}/resources/js/chatting.js"></script>
</body>
</html>