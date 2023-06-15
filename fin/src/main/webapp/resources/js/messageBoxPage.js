const msgInput = document.getElementById('msgInput');



function sendMsg(){
    $.ajax({
        url:"sendMsg",
        data:{"msgInput": msgInput.value},
        type:"POST",
        dataType:"JSON",
        success: function(result){
            alert(result);
        },
        error: function(request, status, error){
            console.log("AJAX 에러 발생");
            onsole.log("상태코드 : " + request.status); // 404, 500
        }
    });

}
    