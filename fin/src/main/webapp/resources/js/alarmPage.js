// 프로필에 있는 초대하기 버튼 가져오기
let bandInviteBtn = document.getElementById('bandInviteBtn');


bandInviteBtn.addEventListener('click',invitate);

function invitate(e){
    let toUserNo = e.target.nextElementSibling.value;
    console.log(toUserNo);
    $.ajax({
        url:"sendInvitate",
        type:"POST",
        data:{"toUserNo" : toUserNo},
        dataType:"JSON",
        success: function(result){
            alert(result);
            location.reload();
        },
        error : function(request, status, error){
            console.log("invitate() AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
}




