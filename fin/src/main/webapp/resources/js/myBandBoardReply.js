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
                mainReplyDiv.append(eachReplyDiv);
                console.log(result);
            }

        },
        error: function(request, status, error){
            console.log("AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
}

