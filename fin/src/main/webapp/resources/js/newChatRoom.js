$(".person").on('click', function(){
    $(this).toggleClass('focus').siblings().removeClass('focus');
 });

let ws; // 웹 소켓
let roomList = new Array; // 현재 있는 방 정보를 담을 배열
let inChatRoomNo; // 들어온 채팅방
// 채팅방에 들어오면 자동으로 소켓 접속 


$(document).ready(()=>{
	

    if(ws == null){
        ws = new WebSocket("ws://" + location.hostname +':8080' + "/fin/chatting" );
        // 모든 방을 조회해서 넣는다.
        
        let userNo = document.getElementById("hiddenUserNo").value;
        if(userNo != null && userNo != ""){
            checkRoom(userNo);
        }
        wsOpen();
    }else{
        ws = new WebSocket("ws://" + location.hostname +':8080' + "/fin/chatting" );
        
        // 모든 방을 조회해서 넣는다.
        let userNo = document.getElementById("hiddenUserNo").value;
        if(userNo != null && userNo != ""){
            checkRoom(userNo);
        }
        wsOpen();
    }
    // 모든 인원을 소켓에 초대


    
    
}); 

// 채팅방 조회
function checkRoom(userNo){
    $.ajax({
        type: 'post',
        data : {"userNo" : userNo},
        url: "/fin/checkRoom",
        dataType: "json",
        success: function(data){  
            
            let checkArr = data;
            console.log(data);
            document.getElementById("chatPeople").innerHTML = "";

            let checkedNick = document.getElementById("hiddenUserName").value;
            $("#chatUserNickDiv").html(checkedNick);


            for(let eachD of checkArr){

                let list1 = document.createElement("li");
                list1.className = "person";
                list1.onclick = function(){enterRoom(eachD.chatOthersNick ,eachD.chatRoomNo, eachD.chatOthersImage);};
                let span1 = document.createElement("span");
                span1.className = "title";
                span1.innerHTML = eachD.chatOthersNick;
                
                list1.append(span1);
                
                document.getElementById("chatPeople").append(list1);
            }  
        }
    });
}

// 채팅방 클릭시 채팅방 이동 
function enterRoom(chatOthersNick ,chatRoomNo, chatOthersImage){
    inChatRoomNo = chatRoomNo;
    
    $("#withChatName").html(chatOthersNick);
    if(chatOthersImage != null && chatOthersImage !=""){
        document.getElementById("otherProfile").innerHTML = "<img id='otherProfile' src='"+ chatOthersImage + "'>"
    }else{
        document.getElementById("otherProfile").innerHTML = "";
    }
    $("#middleChatRoom").html("");

    loadMessage(chatRoomNo);

    
}

// 상대방의 닉네임 확인
function checkWithUser(chatRoomNo){
    $.ajax({
        type: 'post',
        data : {"chatRoomNo" : chatRoomNo},
        url: "/fin/withUserName",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function(data){
            console.log("결과값" + data);
            return data;
        }
    })
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
                    $("#middleChatRoom").append("<div class='outgoing'><div class='bubble'>" + eachMessage.message + "</div></div>");
                    $("#middleChatRoom").scrollTop($("#middleChatRoom")[0].scrollHeight);
                }else{
                    $("#middleChatRoom").append("<div class='incoming'><div class='bubble'>" + eachMessage.message + "</div></div>");
                    $("#middleChatRoom").scrollTop($("#middleChatRoom")[0].scrollHeight);
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
		msg : $('#messageTextInput').val(),
		chatRoomNo : chatRoomNo
	}

	if(option.msg != null && option.msg != ""){
		ws.send(JSON.stringify(option));
        console.log("전송");
		$('#messageTextInput').val("");
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
                $("#middleChatRoom").append("<div class='outgoing'><div class='bubble'>" + parsedData.msg + "</div></div>");
                $("#middleChatRoom").scrollTop($("#middleChatRoom")[0].scrollHeight);
            }else{
                $("#middleChatRoom").append("<div class='incoming'><div class='bubble'>" + parsedData.msg + "</div></div>");
                $("#middleChatRoom").scrollTop($("#middleChatRoom")[0].scrollHeight);
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


    let loginUserCheck = $("#hiddenUserNo").val();

    if(loginUserCheck != "" && loginUserCheck != null){

        let chatRoomList = document.getElementById("chatContainer");
        
        if(chatRoomList.style.display == 'none' || chatRoomList.style.display == 0 ){
            chatRoomList.style.display = 'block';
            
            if(document.getElementById("faqBox").style.width != '0px' || document.getElementById("faqBox").style.width != 0){
                document.getElementById("faqBox").classList.remove('appear');
                document.getElementById("faqBox").classList.add('disappear');
            }
        }else{
            chatRoomList.style.display = 'none';
        }
    }
});



/*
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
*/

$("#chatEnterBtn").click(()=>{
    if(inChatRoomNo != null){

        send(inChatRoomNo);
    }
})

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
                    $("#chatContainer").css("display", "flex");
                    Swal.fire("채팅방이 만들어졌습니다.");
                }
            }

        })
    }

}


// 이미지 확인 메서드
function withUserImg(withUserNo){
    
    $.ajax({
        url: "/fin/chattingCheckImg",
        data : {"userNo" : withUserNo},
        type : "post",
        success : function(data){
            return data;
        }

    });

}


