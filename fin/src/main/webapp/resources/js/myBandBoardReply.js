$('#replyForBandBoardBtn').click(function(){
    let replyText = $('#replyForBandBoard').val();
    let boardNo = $('#hiddenReplyBoardNoForBandBoard').val();

    console.log(boardNo);
    
    $.ajax({
        url :"/fin/insertReplyForBandBoard",
        data: {"replyText" : replyText, "boardNo":boardNo},
        type: "POST",
        success : function(result){ 
            replyOn();
            $("#replyForBandBoard").val("");
        },
        error: function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }

    });
});


$(document).ready(function(){
    replyOn();
})


function replyOn(){

    let mainReplyDiv = document.getElementById("replyContDiv");
    mainReplyDiv.innerHTML = "";

    let hiddenBoardNo = $('#hiddenReplyBoardNoForBandBoard').val();
    let loginUserNo = $('#hiddenSessionNoForReply').val();
    let memberFl = $('#memberFlForAjax').val();
    $.ajax({
        url :"/fin/loadReplyForBandBoard",
        data: {"boardNo" : hiddenBoardNo},
        type: "GET",
        dataType: "JSON",
        success : function(result){

            for(let eachR of result){
                let eachReplyDiv = document.createElement("div");
                let eachFatherDiv = document.createElement("div");
                let replyNoInput = document.createElement("input");
                replyNoInput.type="hidden";
                replyNoInput.value=eachR.replyNo;
                eachFatherDiv.className="eachFatherDiv";
                eachFatherDiv.append(replyNoInput);
                eachFatherDiv.append(eachReplyDiv);
                eachReplyDiv.className = "eachReplyDiv";

                let hInput = document.createElement("input");
                hInput.type="hidden";
                hInput.value= eachR.userNo;
                hInput.className= "hiddenReplyUserNoForBandBoard";
                let replyDiv = document.createElement("div");
                
                let rDiv1 = document.createElement("div");
                rDiv1.className = "replyNickDiv";
                rDiv1.innerHTML = eachR.userNick;
                let rDiv2 = document.createElement("div");
    
                rDiv2.innerHTML = eachR.replyContent;

                replyDiv.append(rDiv1);
                replyDiv.append(rDiv2);



                eachReplyDiv.append(replyDiv);
                eachReplyDiv.append(hInput);
                
                
                if(memberFl == 'T'){
                    let optionDiv = document.createElement("div");
    
                    if(loginUserNo == eachR.userNo){
                        let btn1 = document.createElement("button");
                        btn1.className = "reReplyBtn";
                        btn1.innerHTML = "답글";
                        let btn2 = document.createElement("button");
                        btn2.className = "editReplyBtn";
                        btn2.innerHTML = "수정";
                        let btn3 = document.createElement("button");
                        btn3.className = "removeReplyBtn";
                        btn3.innerHTML = "삭제"

                        optionDiv.append(btn1);
                        optionDiv.append(btn2);
                        optionDiv.append(btn3);

                        eachReplyDiv.append(optionDiv);
                    }else{
                        let btn1 = document.createElement("button");
                        btn1.className = "reReplyBtn";
    
                        btn1.innerHTML = "답글";
                        optionDiv.append(btn1);
                        eachReplyDiv.append(optionDiv);
                    }

                }
                mainReplyDiv.append(eachFatherDiv);
            }

        },
        error: function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
}

$(document).on("click",'.editReplyBtn', e=>{
    
    let replyText = $(e.target).parent().parent().children().first().children().last().text();
    
    // 수정을 위한 input 생성
    let upateRDiv = document.createElement("div");
    let updateRText = document.createElement("textarea");
    let updateRBtn = document.createElement("button");

    upateRDiv.className = "replyForBandBoardDetailBtnDiv";
    updateRText.id= "replyForBandBoard";
    updateRText.innerHTML = replyText;
    updateRBtn.className = "updateReplyForBandBoardBtn";
    updateRBtn.type = "button";
    updateRBtn.innerText="수정";
    
    upateRDiv.append(updateRText);
    upateRDiv.append(updateRBtn);

    // 기존 버튼 말고 취소 버튼 활성화
    let dBtn = document.createElement("button");
    dBtn.className = "rollbackReplyBtn";
    dBtn.innerHTML = "취소"
    
    $(e.target).before(dBtn);
   
    $(e.target).css("display", "none");

    $(e.target).parent().parent().parent().append(upateRDiv);
});

$(document).on("click",'.rollbackReplyBtn', e=>{
    $(e.target).next().css("display", "flex");
    // 생성된 인풋 박스 삭제

    $(e.target).parent().parent().parent().children().last().remove();

    $(e.target).remove();
});

$(document).on("click", '.updateReplyForBandBoardBtn', e=>{
    // 댓글넘버 가져오기
    let replyNo = $(e.target).parent().parent().children().first().val();
    let replyText = $(e.target).prev().val();

    $.ajax({
        url : "/fin/updateReplyLogic",
        type : "post",
        data : {"replyNo":replyNo, "replyText": replyText},
        success : function(e){
            replyOn();
        }
    });

});

//삭제 로직
$(document).on("click",'.removeReplyBtn', e=>{

    let replyNo = $(e.target).parent().parent().parent().children().first().val();

    Swal.fire({
        title: '정말로 삭제하시겠습니까?',
        icon: 'warning',
        
        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
        confirmButtonText: '승인', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
        
      }).then(result => {
          // 만약 Promise리턴을 받으면,
          if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            $.ajax({
              url : "/fin/deleteReplyForBandBoard",
              type : "post",
              data : {"replyNo" : replyNo},
              success : function(data){
                    replyOn();
              }
            }); 
          }
      });
});


/*
for(let eachRBtn of editReplyBtn){

    eachRBtn.addEventListener("click",function(){
        alert("클릭스");

        let upateRDiv = document.createElement("div");
        let updateRText = document.createElement("textarea");
        let updateRBtn = document.createElement("button");

        upateRDiv.className = "replyForBandBoardDetailBtnDiv";
        updateRText.id= "replyForBandBoard";
        updateRBtn.id = "updateReplyForBandBoardBtn"
        
        upateRDiv.append(updateRText);
        upateRDiv.append(updateRBtn);


        $(this).append(upateRDiv);
    });
}
*/