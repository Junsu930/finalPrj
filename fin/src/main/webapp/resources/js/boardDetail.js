const addLikeDiv = document.getElementById('addLike');

const commentBox2 = () => {
    if(heart.classList.contains('like')){
        heart.classList.remove('like');
        heart.classList.add('unlike');

    }else{
        heart.classList.remove('unlike');
        heart.classList.add('like');
    }
}












function addLike(){
    let boardNo = document.getElementById('boardNo').value;
    let userNo = document.getElementById('userNo').value;
    let loginUserNo = document.getElementById('loginUserNo').value;
    let like_Check = document.getElementById('like_Check');
    let likeck = document.getElementById('likeck');
    
    if(likeck.value == 'T'){
        console.log("TTTTTTT");
        $.ajax({
            url:"removeLike",
            method: "POST",
            dataType: "JSON",
            data:{"boardNo" : boardNo, "userNo" : userNo, "loginUserNo" : loginUserNo},
            success: function(result){
                if(result == 1){
                    let minusResult = Number(like_Check.innerText -1);
                    like_Check.innerText = minusResult;
                    likeck.value= "F";
                }else{
                    like_Check.innerText = result;
                }
            },
            error : function(request, status, error){
                console.log("removeLike AJAX 에러 발생");
                console.log("상태코드 : " + request.status); 
            }
        });
    } // if 끝
    else{
        console.log("FFFFFF NOTHING");
        $.ajax({
            url:"addLike",
            method: "POST",
            dataType: "JSON",
            data:{"boardNo" : boardNo, "userNo" : userNo, "loginUserNo" : loginUserNo},
            success: function(result){
                like_Check.innerText = result;
                likeck.value= "T";
            },
            error : function(request, status, error){
                console.log("addLike AJAX 에러 발생");
                console.log("상태코드 : " + request.status); 
            }
        });
    } // else끝
}


addLikeDiv.addEventListener('click', addLike);



