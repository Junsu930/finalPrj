
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
  if(confirm("정말 삭제하시겠습니까?")){
      $.ajax({
          url: "deleteLesson",
          type:"POST",
          dataType:"JSON",
          data:{"lessonNo" : lessonNo.value},
          success(result){
              alert(result);
              location.href="lesson";
          },
          error: function(request, status, error){
              console.log("delte AJAX 에러 발생");
              console.log("상태코드 : " + request.status); // 404, 500
          }
      });
  }else{
    alert("취소하셨습니다!");
  }
}