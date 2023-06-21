<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/dist/newChatRoom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>채팅방 리스트</title>

</head>
<body>
	<!--
	<div class="roomList" id="roomList" style="display: none;">
		<div class="roomBox" id="roomBox">

			<div class="eachRoomList" style="cursor: pointer;">
				
			</div>

		 	<div class="noRoom">
		 		채팅방이 없습니다.
		 	</div>	
		</div>
		<input type="hidden" id="hiddenUserNo" value="${sessionScope.tempUser.userNo}">
		<input type="hidden" id="hiddenUserName" value="${sessionScope.tempUser.userName}">
		<input type="hidden" id="hiddenGuestNo" value="">
	</div>
-->

	<div class="chatContainer" id="chatContainer">
		<input type="hidden" id="hiddenUserNo" value="${sessionScope.loginUser.userNo}">
		<input type="hidden" id="hiddenUserName" value="${sessionScope.loginUser.userNick}">
		<input type="hidden" id="hiddenGuestNo" value="">
		<input type="hidden" id="hiddenimage" value="${sessionScope.loginUser.profileImg}">
		<!-- 채팅창 -->
		<div class="chatbox">
		<!-- 채팅창 탑 메뉴 -->
		<div class="top-bar">
			<div class="avatar" id="otherProfile"></div>
			<div class="name" id="withChatName"></div>
		</div>
		<!-- 채팅상황 -->
		<div class="middle" id="middleChatRoom">
		<!-- 
			<div class="incoming">
				<div class="bubble">상대메세지</div>
			</div>
			<div class="outgoing">
				<div class="bubble">내 메세지</div>
			</div>
		-->
		</div>
		<div class="bottom-bar">
			<div class="chat">
				<input type="text" placeholder="Type a message..." id="messageTextInput"/>
				<button type="button" id="chatEnterBtn"><i class="fas fa-paper-plane"></i></button>
			</div>
		</div>
		</div>
		<div class="messages"></div>
		<div class="profile">
			<c:if test="${!empty sessionScope.loginUser.profileImg}">
				<div class="avatar"><img src="${sessionScope.loginUser.profileImg}" id="avatarImg"></div>
			</c:if>
			<c:if test="${empty sessionScope.loginUser.profileImg}">
				<div class="avatar"></div>
			</c:if>
			<div class="chatUserNickDiv" id="chatUserNickDiv"></div>
		</div>
		<ul class="people" id="chatPeople">
			<!-- 각각의 채팅방 -->
			<!-- 
			<li class="person focus">
				<span class="title">채팅방1</span>
			</li>
			<li class="person">
				<span class="title">채팅방2</span>
			</li>
			 -->
		</ul>
  	</div>
	<div id="chatting-img">
		<img src="${contextPath}/resources/images/guitarduck.png">
	</div>
<script src="${contextPath}/resources/js/newChatRoom.js"></script>
</body>
</html>