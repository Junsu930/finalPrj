/*
let ws;
// 채팅방 번호를 저장
let chatRoomNo;
*/

/*
document.getElementById("chatting-img").addEventListener("click", function(){
	
	let messageWindow = document.getElementById("chatBody");
	
	if(messageWindow.style.display =='none' || messageWindow.style.display == 0 ){
		messageWindow.style.display = 'flex';
		
		// 소켓이 닫혀있으면 연다
		if(ws == null){
			wsOpen();
		}
		if(document.getElementById("faqBox").style.width != '0px' || document.getElementById("faqBox").style.width != 0){
			document.getElementById("faqBox").classList.remove('appear');
			document.getElementById("faqBox").classList.add('disappear');
		}
		
		
		
	}else{
		messageWindow.style.display = 'none';
	}
});
*/
/*
document.getElementById("chatting-img").addEventListener("click", function(){

	let chatRoomList = document.getElementById("roomList");
	let chatBody = document.getElementById("chatBody");
	
	if(chatRoomList.style.display == 'none' || chatRoomList.style.display == 0 ){
		chatRoomList.style.display = 'flex';
		
		if(document.getElementById("faqBox").style.width != '0px' || document.getElementById("faqBox").style.width != 0){
			document.getElementById("faqBox").classList.remove('appear');
			document.getElementById("faqBox").classList.add('disappear');
		}
	}else{
		chatRoomList.style.display = 'none';
	}

	if(chatBody.style.display != 'none' && chatRoomList.style.display !='none'){
		chatBody.style.display = 'none';
		chatRoomList.style.display = 'none';
	}

});

let eachRoomList = document.getElementsByClassName("eachRoomList");
*/
// 열려 있는 채팅방을 눌렀을 때, 채팅방 주소 규칙(/fin/chatting/호스트유저넘_게스트유저넘)
/*
for(let eachRoom of eachRoomList){
	eachRoom.addEventListener("click", e=>{

		// 다음 요소인 input에 담아둔 hidden 요소 
		chatRoomNo =  $(e.target).next().val();

		console.log("채팅방 넘버 : " + chatRoomNo);

		// 열려진 채팅방 넘버 클래스
		let chatRooms = document.getElementsByClassName("chatRooms");
		
		let chatArr = new Array;
	
		if(chatArr.indexOf(chatRoomNo) < 0){
			// 소켓 안 열려 있으면
			wsOpen(chatRoomNo); //소켓 열고 arr에 넣는다
			chatArr.push(chatRoomNo);
		}

		

		$("#roomList").css("display", "none");
		$("#chatBody").css("display", "flex");
	});

}

*/
/*

let sockArr = new Array;

if($("#roomNumber").val() != null && $("#roomNumber").val() != ""){
	if(!sockArr.includes($("#roomNumber").val())){
		wsOpen($("#roomNumber").val());
		sockArr.push($("#roomNumber").val());
	}else{
		// 만약 열려있으면
		location.href="/fin/moveChatting?"+"roomNumber="+$("#roomNumber").val();
	}
	
}

function wsOpen(chatRoomNo){

	let ipAddr = document.getElementById("ipAddr").value;
	ws = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + chatRoomNo);
	wsEvt();

}

function wsEvt(){
	ws.onopen = function(data){
		// 소켓이 열리면 초기화 세팅하기
		

	}

	ws.onmessage = function(data){
		let msg = data.data;

		console.log(data);
		
		if(msg != null && msg.trim() !=""){
			// 메시지가 있다면
			let chatMessage = JSON.parse(msg);

			if(chatMessage.type == 'getId'){
				let si = chatMessage.sessionId != null? chatMessage.sessionId : "";
				if(si != ""){
					$('#sessionId').val(si);
				}
			}else if(chatMessage.type == 'message'){
				if(chatMessage.sessionId == $('#sessionId').val()){
					let tokBox = document.createElement("div");
					tokBox.className = 'me-tok';
					//let nameBox = document.createElement("div");
					//nameBox.innerHTML = chatMessage.userName;
					let tokMessageBox = document.createElement("div");
					tokMessageBox.className = 'tokMessage';
					tokMessageBox.innerHTML = chatMessage.msg;
					//tokBox.append(nameBox);
					tokBox.append(tokMessageBox);
					
					$('#messageBox').append(tokBox);
					
					$("#messageBox").append("<div class='me-tok'>나 :" + chatMessage.msg + "</div>");	

					
					$("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);
				}else{
					
					let tokBox = document.createElement("div");
					tokBox.className = 'other-tok';
					let nameBox = document.createElement("div");
					nameBox.innerHTML = chatMessage.userName;
					let tokMessageBox = document.createElement("div");
					tokMessageBox.className = 'tokMessage';
					tokMessageBox.innerHTML = chatMessage.msg;
					tokBox.append(nameBox);
					tokBox.append(tokMessageBox);
					$('#messageBox').append(tokBox);
					
					$("#messageBox").append("<div class='other-tok'>상대 :" + chatMessage.msg + "</div>");
		
					$("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);

				}
			}


		}
	}



	document.addEventListener("keypress", function(e){
		let key = e.key || e.keyCode;
		if(e.key === 'Enter' || key === 13){
			send();
		}
	})

}

function send(){
	let option={
		type : "message",
		sessionId : $("#sessionId").val(),
		userName : $("#sessionUserName").val(),
		msg : $('#messageText').val(),
		chatRoomNo : $("#roomNumber").val()
	}

	if(option.msg != null && option.msg != ""){
		ws.send(JSON.stringify(option));
		$('#messageText').val("");
	}
}

*/



