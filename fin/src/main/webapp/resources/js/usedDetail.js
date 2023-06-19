   var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
       
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

let hiddenWritersUserNo = document.getElementById("hiddenWritersUserNo").value;


//글쓴이와 채팅하기
document.getElementById("questionChatBtn").addEventListener("click", function(){

  if($("#hiddenUserNo").val() == null || $("#hiddenUserNo").val() ==""){
    swal.fire("로그인 먼저 진행해주세요");
  }else{
     chatStart(hiddenWritersUserNo);
  }
});

$("#deleteUsedBoardBtn").click(()=>{
    Swal.fire({
      title: '정말로 삭제하시겠습니까?',
      text: '다시 되돌릴 수 없습니다. 신중하세요.',
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
            url : "/fin/deleteUsedBoard",
            type : "post",
            data : {"hiddenUsedBoardNo" : $("#hiddenUsedBoardNo").val()},
            success : function(data){
                
              if(data>0){

                Swal.fire({
                  title: '삭제가 완료되었습니다.',
                  icon: 'success',
                  
                  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
                  
               }).then(result => {
                  // 만약 Promise리턴을 받으면,
                  if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                    redirectToUsedMain();
                  }else{
                    redirectToUsedMain();
                  }
               });
              }else{
                swal.fire("게시글 삭제 실패했습니다.");
              }

            }
            
          });
          
        }
    });
});

function redirectToUsedMain(){
  location.href="/fin/used";
}





/*

function chatStart(withUserNo){
    // 세션에 있는 유저넘
  let chatUserNo = document.getElementById("hiddenUserNo").value;
  let chatUserName = document.getElementById("hiddenUserName").value;
   
  // 세션과 글쓴이가 같다면
  if(withUserNo == chatUserNo){
      Swal.fire("자기 자신과는 채팅할 수 없습니다.");
  }else{

      $.ajax({
          url : "/fin/chatStart",
          data : {"withUser" : withUserNo ,
                  "userNo" : chatUserNo,
                  "userName" : chatUserName              
                  },
          type : "post",
          success : function(data){
              
              if(data == 0){
                  Swal.fire("이미 채팅 중인 상대입니다.");
              }else if(data == -1){
                  Swal.fire("알 수 없는 오류입니다.");
              }else{
                  checkRoom(chatUserNo);
                  $("#chatBody").css("display", "none");
                  $("#roomList").css("display", "flex");
                  Swal.fire("채팅방이 만들어졌습니다.");
              }
          }

      })
  }
};
*/