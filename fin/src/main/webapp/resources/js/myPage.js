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

  const userNick =document.getElementById("userNick");
  const userPw =document.getElementById("userPw");
  const userIntro =document.getElementById("userIntro");
  const instLength = document.querySelectorAll('input[name="inst"]:checked');
  const genreLength = document.querySelectorAll('input[name="genre"]:checked');
  const regionLength = document.querySelectorAll('input[name="region"]:checked');

  
/*
  const checkOb = {
    "userNick" : false,
    "userPw" : false,
    "userIntro" : false,
    "instLength" : false,
    "genreLength" : false,
    "regionLength": false

  }

instLength.addEventListener("change", function() {

  if(instLength.length == 0){

    checkOb.instLength = false;
   
 
  } else {
    checkOb.instLength = true;
  }
  

});

regionLength.addEventListener("change", function() {

  if(regionLength.length == 0){

    checkOb.regionLength = false;
   
 
  } else {
    checkOb.regionLength = true;
  }
  

});

genreLength.addEventListener("change", function() {

  if(genreLength.length == 0){

    checkOb.genreLength = false;
   
 
  } else {
    checkOb.genreLength = true;
  }
  

});


*/



// 닉네임 중복 검사
const nickMessage = document.getElementById("nickMessage");

  userNick.addEventListener("input", function() {

    if(userNick.value.length == 0){

      nickMessage.innerText = "";

      checkOb.userNcik = false;
      return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,10}$/;

    if(regExp.test(userNick.value)) {



      $.ajax({
        url : "nicknameDupCheck",  // 필수 작성 속성
        data : { "userNickname" : userNick.value }, // 서버로 전달할 값(파라미터)
        type : "GET", // 데이터 전달 방식(기본값 GET)

        success : function(res){ // 비동기 통신 성공 시(에러 발생 X)

            // 매개변수 res : Servlet에서 응답으로 출력된 데이터가 저장

            if(res == 0){ // 닉네임 중복 X
              nickMessage.innerText = "";
              nickMessage.classList.add("confirm");
              nickMessage.classList.remove("error");
                checkOb.userNick = true; // 유효 O 기록

            } else { // 닉네임 중복 O
              nickMessage.innerText = "Duplicated name";
              nickMessage.classList.add("error");
              nickMessage.classList.remove("confirm");
                checkOb.userNick = false; // 유효 O 기록
            }
        },

        error : function(){ // 비동기 통신 중 에러가 발생한 경우
            console.log("에러 발생");
        }
    });
    }
  });


  userPw.addEventListener("input", function(){

    if(userPw.value.length == 0){
        pMessage.innerText = "";
        pMessage.classList.remove("confirm", "error");

        checkOb.userPw = false; // 유효 X 기록
        return;
    }

    const regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;

    if( regExp.test(userPw.value) ){ // 비밀번호 유효

            pMessage.innerText = "";
            pMessage.classList.add("confirm");
            pMessage.classList.remove("error");

            checkOb.userPw = true;
        

    }else{
        pMessage.innerText = "Invalid PW";
        pMessage.classList.add("error");
        pMessage.classList.remove("confirm");

        checkOb.userPw = false; // 유효 X 기록
    }
});

userIntro.addEventListener("input", function(){

      if(userIntro.value.length == 0){
          checkOb.userIntro = false;
      }
      const regExp = /^[.]{20}$/;

      if(regExp.test(userIntro.value)) {
        checkOb.userIntro = true;
      }


});


  
/*

  function UpdateValidate(){

    if(instLength == 0){
      alert("POSITION 항목이 비었습니다!");
     
      return false;
  }else if(genreLength == 0){
      alert("GENRE 항목이 비었습니다!");
     
      return false;
  }else if( regionLength == 0){
      alert("REGION 항목이 비었습니다!");
      return false;
  } else {

    return true;
  }
}

function UpdateValidate(){

  for( let key  in checkOb ){

    let str;

    if( !checkOb[key] ){ 

        switch(key){
          case "userNick" :     str="닉네임이"; break;
          case "userPw" :       str="비밀번호가"; break;
          case "userIntro" :    str="자기 소개가"; break;
          case "instLength":    str="내 서칭 정보가"; break;
          case "genreLength":   str="내 서칭 정보가"; break;
          case "regionLength":  str="내 서칭 정보가"; break;      
        }
        str += " 유효하지 않음.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    
      }
    return true; // form태그 기본 이벤트 수행

  }
 */
  