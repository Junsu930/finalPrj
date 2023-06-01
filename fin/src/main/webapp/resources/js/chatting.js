document.getElementById("chatting-img").addEventListener("click", function(){
	
	let messageWindow = document.getElementById("chatBody");
	let messageStyle = messageWindow.style.display;
	
	console.log(messageStyle);
	if(messageStyle =='none' || messageStyle == "" ){
		messageWindow.style.display = 'flex';
		wsOpen();
	}else{
		messageWindow.style.display = 'none';
	}

});

let ws;


function wsOpen(){
	ws = new WebSocket("ws://" + location.host + "/fin/chatting");
	console.log("소켓 주소 : " + "ws://" + location.host + "/fin/chatting");
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
			let chatMessage = msg.split(",,");
			let tokBox = document.createElement("div");
			tokBox.className = 'tok';
			let nameBox = document.createElement("div");
			nameBox.innerHTML = chatMessage[0];
			let tokMessageBox = document.createElement("div");
			tokMessageBox.className = 'tokMessage';
			tokMessageBox.innerHTML = chatMessage[1];
			tokBox.append(nameBox);
			tokBox.append(tokMessageBox);
			$('#messageBox').append(tokBox);

			$("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);
		}
	}



	document.addEventListener("keyup", function(e){
		let key = e.key || e.keyCode;
		if(e.key === 'Enter' || key === 13){
			send(e);
		}
	})

}

function send(){
	let uN = "강강이";
	console.log("메세지 보내버렷");
	let msg = $("#messageText").val();
	if(msg != null && msg != ""){
		ws.send(uN + ",," + msg);
		$('#messageText').val("");
	}
}


