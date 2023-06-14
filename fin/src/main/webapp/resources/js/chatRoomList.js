let ws; // 웹 소켓
let roomList = new Array; // 현재 있는 방 정보를 담을 배열
let inChatRoomNo; // 들어온 채팅방
// 채팅방에 들어오면 자동으로 소켓 접속 


$(document).ready(()=>{
	

    if(ws == null){
        ws = new WebSocket("ws://" + '192.168.140.235' +':8080' + "/fin/chatting" );
        // 모든 방을 조회해서 넣는다.
        
        let userNo = document.getElementById("hiddenUserNo").value;
        if(userNo != null && userNo != ""){
            checkRoom(userNo);
        }
        wsOpen();
    }else{
        ws = new WebSocket("ws://" + '192.168.140.235' +':8080' + "/fin/chatting" );
        
        // 모든 방을 조회해서 넣는다.
        let userNo = document.getElementById("hiddenUserNo").value;
        if(userNo != null && userNo != ""){
            checkRoom(userNo);
        }
        wsOpen();
    }
    // 모든 인원을 소켓에 초대


    
    
}); 


function checkRoom(userNo){
    $.ajax({
        type: 'post',
        data : {"userNo" : userNo},
        url: "/fin/checkRoom",
        dataType: "json",
        success: function(data){  
            
            let checkArr = data;


            document.getElementById("roomBox").innerHTML = "";

            for(let eachD of checkArr){
                let div1 = document.createElement("div");
                div1.className = "eachRoomList";
                div1.style.cursor = "pointer";
                div1.innerHTML = eachD.chatTitle;
                div1.value = "eachD.chatRoomNo";
                div1.onclick = function(){enterRoom(eachD.chatRoomNo, eachD.chatTitle);};


                document.getElementById("roomBox").append(div1);
            }  
        }
    });

}

// 채팅방 클릭시 채팅방 이동 
function enterRoom(chatRoomNo, chatRoomTitle){
    
    if(document.getElementById("chatBody") != null){
        $("div").remove("#chatBody");
    }

    console.log("클릭됨");
    let chatBody = document.createElement("div");
    let tapDiv = document.createElement("div");
    let messageBox = document.createElement("div");
    let messageText = document.createElement("input");
    let sendBtn = document.createElement("button");
    let chatTap = document.createElement("div");
    let xTap = document.createElement("div");
    let chatTitle = document.createElement("div");

    chatBody.id="chatBody";
    chatBody.style.display = "flex";
    chatBody.classList.add("chatBody");
    chatTitle.innerHTML = chatRoomTitle;
    inChatRoomNo = chatRoomNo;
    tapDiv.classList.add("tapDiv")
    messageBox.id="messageBox";
    messageBox.classList.add("messageBox");
    messageText.id="messageText";
    chatTap.classList.add("chatTap");
    chatTap.id="chatTap";
    chatTap.innerHTML = '<i class="fa-solid fa-comments"></i>';
    xTap.classList.add("x-tap");
    xTap.id="x-tap";
    xTap.onclick=function(){delecteChatRoom(chatRoomNo);};
    xTap.innerHTML= '<i class="fa-solid fa-xmark"></i>';

    

    sendBtn.id="sendBtn";
    sendBtn.type="button";
    sendBtn.innerText="전송";
    sendBtn.onclick=function(){send(chatRoomNo);};

    tapDiv.append(chatTitle);
    tapDiv.append(chatTap);
    tapDiv.append(xTap);
    messageBox.append(tapDiv);
    chatBody.append(messageBox);
    chatBody.append(messageText);
    chatBody.append(sendBtn);

    document.getElementById("roomList").style.display = 'none';
    document.body.append(chatBody);

    loadMessage(chatRoomNo);

    
    


}


function loadMessage(chatRoomNo){
    
    $.ajax({
        type: 'post',
        data : {"chatRoomNo" : chatRoomNo},
        url: "/fin/loadMessage",
        dataType: "json",
        success: function(data){
            console.log("받아진 채팅리스트");
            console.log(data);

            let chatMessageArr = data;
            let loginUser = $("#hiddenUserNo").val()
            for(let eachMessage of chatMessageArr){

                if(eachMessage.userNo == loginUser){
                    $("#messageBox").append("<div class='me-tok-p'><div class='me-tok'>" + eachMessage.message + "</div></div>");
                    $("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);
                }else{
                    $("#messageBox").append("<div class='other-tok-p'><div class='other-tok'>" + eachMessage.message + "</div></div>");
                    $("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);
                }
            }   
        }
        
    })

}




function createRoom(roomNo, hostNo, guestNo, roomTitle){
 
}


function send(chatRoomNo){

	let option={
		type : "message",
		sessionUserNo : $("#hiddenUserNo").val(),
		userName : $("#hiddenUserName").val(),
		msg : $('#messageText').val(),
		chatRoomNo : chatRoomNo
	}

	if(option.msg != null && option.msg != ""){
		ws.send(JSON.stringify(option));
        console.log("전송");
		$('#messageText').val("");
	}

    
}

function wsOpen(){
    ws.onopen = function(){
        
    }

    ws.onmessage = function(data){
        
        let chatUser = document.getElementById("hiddenUserNo").value;

        let parsedData = JSON.parse(data.data);
        let serverChatRoomNo = parsedData.chatRoomNo;

        if(serverChatRoomNo == inChatRoomNo){
            if(parsedData.sessionUserNo == chatUser){
                $("#messageBox").append("<div class='me-tok-p'><div class='me-tok'>" + parsedData.msg + "</div></div>");
                $("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);
            }else{
                $("#messageBox").append("<div class='other-tok-p'><div class='other-tok'>" + parsedData.msg + "</div></div>");
                $("#messageBox").scrollTop($("#messageBox")[0].scrollHeight);
            }
        }
        
    }

}



document.addEventListener("keypress", function(e){
    let key = e.key || e.keyCode;
    if(e.key === 'Enter' || key === 13){
        send(inChatRoomNo);
    }
}); 


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

    if(chatBody != null){

        if(chatBody.style.display != 'none' && chatRoomList.style.display !='none'){
            chatBody.style.display = 'none';
            chatRoomList.style.display = 'none';
        }
    }

});



$(document).on('click', '#chatTap', function() {
    $("#chatBody").css("display", "none");
    $("#roomList").css("display", "flex");

});

 function delecteChatRoom(chatRoomNo){

    let chatUser = document.getElementById("hiddenUserNo").value;

    Swal.fire({
        title: '채팅방을 나가시겠습니까??',
        text: "채팅 내역은 되돌릴 수 없습니다. 신중하세요.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: '나가기',
        cancelButtonText: '남아있기',
        reverseButtons: false, // 버튼 순서 거꾸로
        
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url : "/fin/deleteChatRoom",
                data : {"chatRoomNo" : chatRoomNo},
                type : "post",
                success : function(data){
                    if(data == 1){
                        Swal.fire(
                            '채팅방이 삭제되었습니다.'
                        );
                        checkRoom(chatUser);

                        $("#chatBody").css("display", "none");
                        $("#roomList").css("display", "flex");

                    }
                }
            });
        }
    })
};

function chatStart(withUserNo){
    
    let chatUserNo = document.getElementById("hiddenUserNo").value;
    let chatUserName = document.getElementById("hiddenUserName").value;
    if(withUserNo == chatUserNo){
        Swal.fire("자기 자신과는 채팅할 수 없습니다.");
    }else{

        $.ajax({
            url : "/fin/chatStart",
            data : {"withUser" : withUserNo ,
                    "userNo" : chatUserNo,
                    "userName" : chatUserName              
                    },
            type : "post",
            success : function(data){
                
                if(data == 0){
                    Swal.fire("이미 채팅 중인 상대입니다.");
                }else if(data == -1){
                    Swal.fire("알 수 없는 오류입니다.");
                }else{
                    checkRoom(chatUserNo);
                    $("#chatBody").css("display", "none");
                    $("#roomList").css("display", "flex");
                    Swal.fire("채팅방이 만들어졌습니다.");
                }
            }

        })
    }

}
