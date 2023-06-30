const heart = document.getElementById('heart');

const likeUnlikeFunc = () => {
    if(heart.classList.contains('like')){
        heart.classList.remove('like');
        heart.classList.add('unlike');

    }else{
        heart.classList.remove('unlike');
        heart.classList.add('like');
    }
}

$("#deleteBtnForBandBoard").click(function(){
    Swal.fire({
        title: '정말로 삭제하시겠습니까?',
        icon: 'warning',
        
        showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
        confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
        cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
        confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
        cancelButtonText: '취소', // cancel 버튼 텍스트 지정
        
        
    }).then(result => {
        // 만약 Promise리턴을 받으면,
        if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
            $("#deleteBandBoardDetail").submit();
        }
    });
});

// 좋아요 로직
$("#heart").click(()=>{
    let loginUser = $("#hiddenLoginUser").val();
    let boardNo = $("#hiddenReplyBoardNoForBandBoard").val();
    // 로그인 유저가 없으면
    if(loginUser == null || loginUser == ""){
        swal.fire("로그인 먼저 진행하세요");
    }else{
        if($("#likeCheckFor").val() == 'T'){
            // 이미 체크된 상태면
            $.ajax({
                url : "/fin/unlikeLogic",
                data : {"userNo" : loginUser, "boardNo": boardNo},
                type: "POST",
                success : function(result){

                    if(result==1){

                        likeUnlikeFunc();
                        $("#likeCheckFor").val('F');
                        let toLike = Number($('#likeItSpan').html())-1;
                        $('#likeItSpan').html(toLike);
                    }else{
                        alert("실패");
                    }
                }
            });
            
        }else{
            // 체크가 안된 상태면
            $.ajax({
                url : "/fin/likeLogic",
                data : {"userNo" : loginUser, "boardNo": boardNo},
                type: "POST",
                success : function(result){
                    if(result==1){
                        likeUnlikeFunc();
                        $("#likeCheckFor").val('T');
                        let toLike = Number($('#likeItSpan').html())+1
                        $('#likeItSpan').html(toLike);
                    }else{
                        alert("실패");
                    }
                }
            });
        }
        
        

    }

})

