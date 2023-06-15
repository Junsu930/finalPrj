<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
<link rel="stylesheet" href="${contextPath}/resources/css/dist/newChatRoom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="chatContainer">
	  <div class="chatbox">
	    <div class="top-bar">
	      <div class="avatar"><p>p</p></div>
	      <div class="name">Voldemort</div>

	    </div>
	    <div class="middle">
	      <div class="voldemort">
	        <div class="incoming">
	          <div class="bubble">Hey, Father's Day is coming up..</div>
	          <div class="bubble">What are you getting.. Oh, oops sorry dude.</div>
	        </div>
	        <div class="outgoing">
	          <div class="bubble lower">Nah, it's cool.</div>
	          <div class="bubble">Well you should get your Dad a cologne. Here smell it. Oh wait! ...</div>
	        </div>
	      </div>
	    </div>
	    <div class="bottom-bar">
	      <div class="chat">
	        <input type="text" placeholder="Type a message..." />
	        <button type="submit"><i class="fas fa-paper-plane"></i></button>
	      </div>
	    </div>
	  </div>
	  <div class="messages"></div>
	  <div class="profile">
	    <div class="avatar"><p>p</p></div>
	  </div>
	  <ul class="people">
	  <!-- 각각의 채팅방 -->
	    <li class="person focus">
	      <span class="title">Voldemort </span>
	    </li>
	  </ul>
	</div>
  <script src="${contextPath}/resources/js/newChatRoom.js"></script>"
</body>
</html>