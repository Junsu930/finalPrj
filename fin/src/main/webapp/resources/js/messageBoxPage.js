// 쪽지 삭제
let msgDeleteBtnArr = document.querySelectorAll('.msgDeleteBtn');

for(let i = 0; i< msgDeleteBtnArr.length; i++){
    msgDeleteBtnArr[i].addEventListener("click", deleteMsg);
}



function deleteMsg(e) {
    let msgNo = e.target.nextElementSibling.value;
    console.log(msgNo);
    console.log("click");
    Swal.fire({
        title: '쪽지를 삭제하시겠습니까?',
        text: '짜루짜루?',
        icon: 'warning',
        
        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
        confirmButtonText: '승인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
        
        reverseButtons: true, // 버튼 순서 거꾸로
        
     }).then(result => {
        // 만약 Promise리턴을 받으면,
        if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            $.ajax({
                url:"deleteMsg",
                data: {"msgNo" : msgNo},
                type: "POST",
                dataType: "JSON",
                success : function(result){
                    Swal.fire(result, '삭제완료~', 'success');
                    location.reload();
                },
                error: function(request, status, error){
                    console.log("AJAX 에러 발생");
                    console.log("상태코드 : " + request.status); // 404, 500
                }
            });
        }
     });
};


// 쪽지 답장

let msgReplyBtn = document.querySelectorAll('.msgReplyBtn');
let modalFromMsgBox;

for(let i = 0; i < msgReplyBtn.length; i++){
    msgReplyBtn[i].addEventListener('click', function(e){
       let receiverUserNo = e.target.nextElementSibling.value
       let msgNoForAlarm = e.target.previousElementSibling.value
        console.log(receiverUserNo);
        modalFromMsgBox = new Modal({el: document.getElementById('static-modalBlock'), event: receiverUserNo, evnet2: msgNoForAlarm}).show();
    });
    
}

// 부트스트랩이 el: ~~ 라듯이 키와 값으로 이루어져있는데 이걸 활용해서 receiverUserNo을 담아서 전달해줌
// _options 안에 계단식으로 키와 밸류로 이루어져있는데 여기서 내가 event로 키를 준 애를 갖고 와서
// replyMsg() 함수를 호출할 때, 값으로 씀

function replyMsg(){
    let replyMsgText = document.getElementById('replyMsgText');
    let receiverUserNo = modalFromMsgBox._options.event;
    let msgNoForAlarm = modalFromMsgBox._options.evnet2
    if(replyMsgText.value == ""){
        console.log("받는 사람 번호 :" + receiverUserNo);
        Swal.fire({
            icon: "warning",
            text: "쪽지를 입력해주세요!",
            title: "MessageBox"
          });
    }else{
        $.ajax({
            url:"sendMsg",
            data: {"replyMsgText" : replyMsgText.value , "receiverUserNo": receiverUserNo},
            type : "POST",
            dataType: "JSON",  // dataType : 응답데이터 형식을 지정
            // -> "JSON"으로 지정 시 자동으로 JS 객체로 변환
            success : function(result){ 
                Swal.fire({
                    icon: "success",
                    text: result,
                    title: "MessageBox"
                  });
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


let emptyMsgText = document.getElementById('emptyMsgText');
emptyMsgText.addEventListener('mouseover', function(){
    emptyMsgText.innerText = '';
    emptyMsgText.innerText = '👋 BACK TO MAIN!';
});




