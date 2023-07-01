
// 잠깐! 카톡 공유하기 코드 가져가기전에 jsp 상단에 카카오톡 sdk도 가져가세요! 하단에 스크립트 태그로 놔두니 저는 적용이 안되더라구요.
// 그러니 저처럼 상단에 두세요!
const currentUrl = window.location.href; // 현재 url을 반환해줌
const profileExpalinContent = document.getElementById('profileExpalin').innerText; // 게시글 상세내용
console.log(currentUrl);

Kakao.init('4265179079dfc094b63372d8bfbc7b21'); // 사용하려는 앱의 JavaScript 키 입력 -> 이건 제가 등록해놔서 수정 안 해도됩니다.

Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: 'BandArchive 강사 신청',
      description: profileExpalinContent,
      imageUrl:
        'https://ifh.cc/g/4P6QG6.jpg', // 나중에 레슨게시판 같은 경우 강사 얼굴 이미지로 나오게 하면 될겁니다.
        // https://ifh.cc/ 여기서 이미지 업로드하면 이미지 url 주소가 나옵니다 참고하세요!
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'http://localhost:8091',
        webUrl: 'http://localhost:8091',	
      },
    },
    social: {
    //   likeCount: 286, 
    //   commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: currentUrl,
          webUrl: currentUrl,
        },
      },
      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: currentUrl,
          webUrl: currentUrl,
        },
      },
    ],
  });

  

function deleteLesson(lessonNo){
  console.log(lessonNo);
  Swal.fire({
    title: '게시글을 삭제하시겠습니까?',
    text: '짜루짜루?',
    icon: 'warning',
    
    showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
    confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
    cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
    confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
    cancelButtonText: '취소', // cancel 버튼 텍스트 지정
    closeOnClickOutside : false,
    reverseButtons: true, // 버튼 순서 거꾸로
    
 }).then(result => {
    // 만약 Promise리턴을 받으면,
    if (result.isConfirmed) {// 만약 모달창에서 confirm 버튼을 눌렀다면
      $.ajax({
        url: "deleteLesson",
        type:"POST",
        dataType:"JSON",
        data:{"lessonNo" : lessonNo.value},
        success(result){
           Swal.fire({
            title: result,
            text: '삭제완료~',
            icon: 'success',
          }).then(() => {
            location.href = "lesson";
          });
        },
        error: function(request, status, error){
            console.log("delte AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
      });
    }
 });
}



// 채팅 연결

let chatBtn = document.querySelector('#chatBtn');


chatBtn.addEventListener('click', function(){
  let userNo = chatBtn.nextElementSibling.value;
  console.log(userNo);
  chatStart(userNo);
});


