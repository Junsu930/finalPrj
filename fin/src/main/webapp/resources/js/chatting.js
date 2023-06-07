let ws;

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






function wsOpen(){

    
	ws = new WebSocket("ws://" + '192.168.140.235:8080' + "/fin/chatting");
	console.log("소켓 주소 : " + "ws://" + '192.168.140.235:8080' + "/fin/chatting");
	
	console.log(ws);
	wsEvt();
}

function wsEvt(){
	ws.onopen = function(data){
		// 소켓이 열리면 초기화 세팅하기
	}

	ws.onmessage = function(data){
		let msg = data.data;
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
		userName : '깅깅이',
		msg : $('#messageText').val()
	}

	let uN = "강강이";
	console.log("메세지 보내버렷");
	if(option.msg != null && option.msg != ""){
		ws.send(JSON.stringify(option));
		$('#messageText').val("");
	}
}


