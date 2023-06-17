



// 쪽지 삭제
const msgNo = document.getElementById('msgNo');

function delteMsg(){
    console.log("click");
    if(confirm("쪽지를 삭제하시겠습니까?")){
        $.ajax({
            url:"deleteMsg",
            data: {"msgNo" : msgNo.value},
            type: "POST",
            dataType: "JSON",
            success : function(result){
                alert(result);
                location.reload();
            },
            error: function(request, status, error){
                console.log("AJAX 에러 발생");
                console.log("상태코드 : " + request.status); // 404, 500
            }
        });
    }else{
        console.log("삭제 취소");
        alert("취소!")
    }

}


// 쪽지 답장

const replyMsgText = document.getElementById('replyMsgText');
const receiverUserNo = document.getElementById('receiverUserNo'); // 받는 사람 즉, 답장 시에는 보냈던 사람의 userNo

function replyMsg(){
    if(replyMsgText.value == ""){
        alert("쪽지 내용을 작성해주세요!");
    }else{
        $.ajax({
            url:"replyMsg",
            data: {"replyMsgText" : replyMsgText.value , "receiverUserNo": receiverUserNo.value },
            type : "POST",
            dataType: "JSON",  // dataType : 응답데이터 형식을 지정
            // -> "JSON"으로 지정 시 자동으로 JS 객체로 변환
            success : function(result){ 
                alert(result);
                replyMsgText.value = "";
                location.reload();
            },
            error : function(request, status, error){
              console.log("AJAX 에러 발생");
              console.log("상태코드 : " + request.status); // 404, 500
            }
        });
    }
}



// 왜 같은 클래스로 다 안 열리지...


document.querySelector('.js-static-modal-toggleSendMsg1').addEventListener('click', function() {
    console.log("click!!");
    new Modal({el: document.getElementById('static-modalBlock')}).show();
});

document.querySelector('.js-static-modal-toggleSendMsg2').addEventListener('click', function() {
    console.log("click!!");
    new Modal({el: document.getElementById('static-modalBlock')}).show();
});

document.querySelector('.js-static-modal-toggleSendMsg3').addEventListener('click', function() {
    console.log("click!!");
    new Modal({el: document.getElementById('static-modalBlock')}).show();
});

document.querySelector('.js-static-modal-toggleSendMsg4').addEventListener('click', function() {
    console.log("click!!");
    new Modal({el: document.getElementById('static-modalBlock')}).show();
});

    

    