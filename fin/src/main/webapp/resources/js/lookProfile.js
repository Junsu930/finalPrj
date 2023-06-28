
// 프로필 보기 모달
let profileModalOn = $(".bi bi-person-circle");

for(let eachModal of profileModalOn){
  $(eachModal).click((e)=>{
    
    let userId = $(e.target).prev().val();
    
    $.ajax({
        type: 'post',
        url: '/fin/dbTest',
        async: true,
        data:{'userNo' : userId},
        dataType: 'JSON',
        beforeSend:function(){
          $('.wrap-loading').removeClass('display-none');
          $('.modal-content').css("display", 'none');
        },complete:function(){
          $('.wrap-loading').addClass('display-none');
          $('.modal-content').css("display", 'flex');
        },
        success: function(data){   
            $("#modalMainTitle").html(data.userName + "님의 프로필");
            $("#modalInName").html(data.userName);
            $("#modalInEmail").html(data.userEmail);
            $("#modalInInst").html(data.inst);
            $("#modalInGenre").html(data.genreFavor);
            $("#modalInRegion").html(data.region);
            $("#modalInExp").html(data.yoe);
            $("#modalInMent").html(data.introMent);
    
        },
        error: function(err){
            console.log(err);
        }
    })
  });
}


