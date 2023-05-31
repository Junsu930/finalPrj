document.getElementById("chatting-img").addEventListener("click", function(){
	
	let messageWindow = document.getElementById("chatBody");
	
	if(messageWindow.style.display=='none'){
		messageWindow.style.display = 'flex';
	}else{
		messageWindow.style.display = 'none';
	}


});