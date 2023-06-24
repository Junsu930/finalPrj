// const msnry = new Masonry(document.getElementById("container"), {
//     itemSelector: ".item",
//     columnWidth: ".item",
//     gutter: ".gutterSizer",
//     percentPosition: !0
// });

// infiniteScroll({
//     container: "#container",
//     item: ".item",
//     next: ".next",
//     prev: ".prev",
//     prevLoader: ".prevLoader",
//     pushHistory: true,
//     nextCallback: (newElement) => {
//         msnry.appended(newElement)
//     },
//     prevCallback: (newElement) => {
//         msnry.prepended(newElement)
//     },
//     onLoadFinish: () => {
//         msnry.layout()
//     }
// }),

// window.addEventListener("load", () => {
//     msnry.layout()
// })



// const loader = document.querySelector('.loadingio-spinner-magnify-khdk4exhsp9');
// const html = document.querySelector('html');

// html.style.overflow = 'hidden'; //로딩 중 스크롤 방지

// window.addEventListener('load', ()=>{

//      setTimeout(() => { //  <-* 로딩속도를 구현하기 위한 코드로 실제 적용시 제거
    
//       	loader.style.opacity = '0';
// 		html.style.overflow = 'auto'; //스크롤 방지 해제
      	
//         setTimeout(() => {
//       		loader.style.display = 'none';
//   		}, 400);
        
//   }, 5000); // <-* 로딩속도 구현

// })



// $(window).load(function() {
//     $('.loadingio-spinner-magnify-khdk4exhsp9').hide();
// });



// 모달
let profileMsg = document.querySelectorAll('.profileMsg');
let modalFromProfile;
for(let i = 0; i < profileMsg.length; i++){
    profileMsg[i].addEventListener('click', function(e){
        let receiverUserNo = e.target.nextElementSibling.value
        console.log(receiverUserNo);
        modalFromProfile = new Modal({el: document.getElementById('static-modalBlock'), userNo: receiverUserNo}).show();
    })
}


// 처음 쪽지보내기
function sendMsg(){
    let replyMsgText = document.getElementById('replyMsgText_memberList');
    let receiverUserNo = modalFromProfile._options.userNo
    
    if(replyMsgText.value == ""){
        alert("쪽지 내용을 작성해주세요!ㅁㄴㅇㅁㄴㅇ");
    }else{
        $.ajax({
            url:"sendMsg",
            data: {"replyMsgText" : replyMsgText.value , "receiverUserNo": receiverUserNo },
            type : "POST",
            dataType: "JSON",  // dataType : 응답데이터 형식을 지정
            // -> "JSON"으로 지정 시 자동으로 JS 객체로 변환
            success : function(result){ 
                alert(result);
                replyMsgText.value = "";
                location.reload();
            },
            error : function(request, status, error){
              console.log("AJAX 에러 발생");
              console.log("상태코드 : " + request.status); // 404, 500
            }
        });
    }
}



/******************** 채팅 연결하기 ***********************/
let chatStartIconLi = $(".bi-chat-dots");

for(let eachLi of chatStartIconLi){
    $(eachLi).click(e=>{
        let userNo = $(e.target).next().next().val();

        chatStart(userNo);
    })

}