<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<style>

.roomBox::-webkit-scrollbar {
    width: 4px;  /* 스크롤바의 너비 */
}

.roomBox::-webkit-scrollbar-thumb {
    height: 15%; /* 스크롤바의 길이 */
    background: var(--grey-color); /* 스크롤바의 색상 */
    border-radius: 10px;
}

.roomBox::-webkit-scrollbar-track {
    background: var(--scroll-background-color);  /*스크롤바 뒷 배경 색상*/
}

.darkmode .roomBox::-webkit-scrollbar-track {
    background: transparent;  /*스크롤바 뒷 배경 색상*/
}

.darkmode .roomBox::-webkit-scrollbar-thumb {
    background: var(--scroll-dark-color); /* 다크모드 스크롤바 연한 핑크 */
}

.roomList{
	width:300px;
	height: 500px;
	position: fixed;
	right: 100px;
	bottom: 150px;
	background-color: var(--grr-color);
	border-radius: 10px;
	display: flex;
	justify-content: center;
	z-index: 100;
	transition-duration : 1s;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
	justify-content: center;
	align-items: center;
}

.roomBox{
	width: 90%;
	height: 90%;
	overflow: auto;
}

.eachRoomList{
	height: 10%;
	background-color: var(--chat-color);
	margin: 10px;
	border-radius: 10px;
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
}

.noRoom{
	height: 10%;
	background-color: var(--chat-color);
	margin: 10px;
	border-radius: 10px;
	padding: 10px;
	display: flex;
	font-size :1em;
	justify-content: center;
	align-items: center;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
}
#chatting-img{
	width: 70px;
	height:70px;
	position: fixed;
	right: 100px;
	bottom: 50px;
	z-index: 10;
}

#chatting-img > img{
	width: 100%;
	cursor: pointer;

}

/* 톡 탭 */
.tapDiv{
	display: flex;
	justify-content: flex-end;
	height: 10%;
	
}

.tapDiv > div:first-child{
	flex-basis: 80%;
	display:flex;
	justify-content:center;
	align-items: center; 
	border-radius: 10px;
    background-color: var(--background-color);
    font-size: 0.8em;
    width: 80%;
    margin-right: 10px;
}

#chatTap{
	display: flex;
	justify-content: center;
    align-items: center;
    flex-basis: 10%;
    margin-right: 20px;
}

#chatTap > i{
	width: 100%;
}
	
#x-tap{
	width: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
    flex-basis: 10%;
    cursor: pointer;
	
}

#x-tap > i {
	width: 100%;
}

.chatBody{
	width:300px;
	height: 500px;
	position: fixed;
	right: 100px;
	bottom: 150px;
	background-color: var(--grr-color);
	border-radius: 10px;
	display: flex;
	justify-content: center;
	z-index: 100;
	transition-duration : 1s;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
}

#messageText{
	position: absolute;
	bottom: 10px;
	width : 0;
	height : 0;
	width: 80%;
	height: 3em;
	border: none;
	border-radius: 10px;
	padding-left: 10px;
	padding-right: 70px;
	transition-duration : 1s;
}

#sendBtn{
	width:4em;	
	height: 2.5em;
	position: absolute;
	bottom: 13px;
	right: 40px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	transition-duration : 1s;
}
.me-tok-p{
	display: flex;
	justify-content: flex-end;
}

.me-tok{
	display: flex;
	flex-direction: column;
	justify-content : center;
	align-items: center;
	margin-right: 10px;
	margin-top: 10px;
	padding: 8px;
	border-radius: 10px;
	background-color: var(--chat-color);
	
}

.other-tok{
	display: flex;
	flex-direction: column;
	justify-content : center;
	align-items: center;
	margin-right: 10px;
	margin-top: 10px;
	padding: 8px;
	border-radius: 10px;
	background-color: var(--chat-color);
}

.other-tok-p{
	display: flex;
	justify-content: flex-start;
}

.other-tok > div{
	color: black;
}

.messageBox{
	width: 90%;
	height: 80%;
	margin-top: 10px;
	overflow: auto;
	
}

.tokMessage{
	padding : 5px;
	background-color: white;
	border-radius: 14px;
	margin-top: 4px;
	color: black;
}

#chatTap{
	cursor: pointer;
}

.messageBox::-webkit-scrollbar {
    width: 4px;  /* 스크롤바의 너비 */
}

.messageBox::-webkit-scrollbar-thumb {
    height: 15%; /* 스크롤바의 길이 */
    background: var(--grey-color); /* 스크롤바의 색상 */
    border-radius: 10px;
}

.messageBox::-webkit-scrollbar-track {
    background: var(--scroll-background-color);  /*스크롤바 뒷 배경 색상*/
}

.darkmode .messageBox::-webkit-scrollbar-track {
    background: transparent;  /*스크롤바 뒷 배경 색상*/
}

body.darkmode .messageBox::-webkit-scrollbar-thumb {
    background: var(--scroll-dark-color); /* 다크모드 스크롤바 연한 핑크 */
}

/* 폰 */
@media (max-width: 420px) {
  .chatBody{
  	width: 260px;
  }
}

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>채팅방 리스트</title>

</head>
<body>
	<div class="roomList" id="roomList" style="display: none;">
		<div class="roomBox" id="roomBox">
		<!-- 
			<div class="eachRoomList" style="cursor: pointer;">
				
			</div>
		 -->	
		</div>
		<input type="hidden" id="hiddenUserNo" value="${sessionScope.tempUser.userNo}">
		<input type="hidden" id="hiddenUserName" value="${sessionScope.tempUser.userName}">
		<input type="hidden" id="hiddenGuestNo" value="">
	</div>
	<div id="chatting-img">
		<img src="${contextPath}/resources/images/guitarduck.png">
	</div>
<script src="${contextPath}/resources/js/chatRoomList.js"></script>
</body>
</html>