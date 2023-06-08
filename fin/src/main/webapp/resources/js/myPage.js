const showBtn = document.getElementById('show');
const positionBox = document.querySelector('.positionBox');
const genreBox = document.querySelector('.genreBox');
const locationBox = document.querySelector('.locationBox');
const positionP = document.getElementById('positionP');
const genreP = document.getElementById('genreP');
const locationP = document.getElementById('locationP');

const disPlayNone = document.querySelectorAll('.disPlayNone');


showBtn.addEventListener('click', function(){
    
    for(let i = 0; i < disPlayNone.length; i++){
        disPlayNone[i].classList.toggle('infoShow');
    }
    show.classList.toggle('bi-caret-up')
})

  // 모달 차단
  document.querySelector('.js-static-modal-toggleBlock').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBlock')}).show();
  });

  document.querySelector('.js-static-modal-toggleBlockP').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBlock')}).show();
  });

  
  // 모달 댓글
  document.querySelector('.js-static-modal-toggleReply').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalReply')}).show();
  });

  document.querySelector('.js-static-modal-toggleReplyP').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalReply')}).show();
  });

  
  // 모달 게시글
  document.querySelector('.js-static-modal-toggleBoard').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBoard')}).show();
  });

  document.querySelector('.js-static-modal-toggleBoardP').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBoard')}).show();
  });

  // 모달 밴드
  document.querySelector('.js-static-modal-toggleBand').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBand')}).show();
  });

  document.querySelector('.js-static-modal-toggleBandP').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBand')}).show();
  });

  // 모달 회원정보 수정
  document.querySelector('.js-static-modal-toggleInfo').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalInfo')}).show();
  });

  document.querySelector('.js-static-modal-toggleInfoP').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalInfo')}).show();
  });






  // 프로필 보기 모달
  $('#toModalDiv').click(()=>{
    let userId = $("#hiddenUserNo").val();

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