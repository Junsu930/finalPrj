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
  const toggleBa = document.getElementById("toggleBA")
  const toggleBaP = document.getElementById("toggleBAP")

  if(toggleBa !=null) {
  toggleBa.addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBand')}).show();
  })};

  if(toggleBaP !=null) {
    toggleBaP.addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalBand')}).show();
  })};


   // 모달 회원정보 수정

   const toggleInfo =document.getElementById("toggleInfo");
   const toggleInfoP =document.getElementById("toggleInfoP");
  
   if(toggleInfo != null) {
    toggleInfo.addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalInfo')}).show();
  })};

  if(toggleInfoP != null) {
    toggleInfoP.addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalInfo')}).show();
  })};

 /*
  document.querySelector('.js-static-modal-togglefindMemberP').addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalfindMember')}).show();
  });*/
  
  
  // groupModal

  //const groupToggle = document.getElementById("groupToggle");

  const toggleGo = document.getElementById("toggleGA")
  const toggleGop = document.getElementById("ToggleGAP")
  if(toggleGo != null) {
    toggleGo.addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalGroup')}).show();
  })};

  if(toggleGop !=null) {
    toggleGop.addEventListener('click', function() {
    new Modal({el: document.getElementById('static-modalGroup')}).show();
  })};
  
  
  let inputImg = document.getElementById("inputimage");
  let fileImg = document.getElementById("fileImg");
  fileImg.addEventListener("click", function() {
   inputImg.click()

  });








  const secession = document.getElementById("secessionBtn");
  const userNo = document.getElementById("No");
  const secessionout =document.getElementById("secessionout");
  
  secession.addEventListener("click", function() {

    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })
    
    swalWithBootstrapButtons.fire({
      title: '정말 탈퇴하시겠습니까?',
      text: "탈퇴시 모든 정보가 삭제됩니다",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: '네 탈퇴하겠습니다',
      cancelButtonText: '아니요',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {secessionout.submit();
        swalWithBootstrapButtons.fire(
          '탈퇴되었습니다',
          '계정 정보가 삭제 되었습니다',
          'success'
        )
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          '취소되었습니다',
          '.....',
          'error'
        )
      }
    })

  });

  /*
  Swal.fire({
    title: '정말로 탈퇴하시겠습니까?',
    text: "탈퇴 하시면 정보가 모두 사라집니다",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: '네 탈퇴하겠습니다'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire(
        '탈퇴 성공',
        '계정이 탈퇴되었습니다',
        'success'
      )
    }
  })*/
/*
  if(confirm("정말로 탈퇴하시겠습니까?")) {
    secessionout.submit();
  } else {
    alert("탈퇴 취소")
    return false;
  }*/

  let imgpreview = document.getElementById("profileimage2");
  
  
  
  inputImg.addEventListener("change", function(){
    
    if(this.files[0] != undefined){// 파일이 선택 되었을 때
      const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
      reader.readAsDataURL(this.files[0]);
      // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

      reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
          // e.tartget == redaer
          // e.target.result == 읽어들인 이미지의 URL
          // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
          imgpreview.setAttribute("src", e.target.result);
      }
    }

  });
  