const msgInput = document.getElementById('msgInput');
const receiverNickName = document.getElementById('receiverNickName');


function sendMsg(){
    $.ajax({
        url:"sendMsg",
        data:{"msgInput": msgInput.value, "receiverNickName" : receiverNickName.value},
        type:"POST",
        dataType:"JSON",
        success: function(result){
            alert(result);
            msgInput.value = "";
            receiverNickName.value = "";
        },
        error: function(request, status, error){
            console.log("AJAX 에러 발생");
            onsole.log("상태코드 : " + request.status); // 404, 500
        }
    });
}
    