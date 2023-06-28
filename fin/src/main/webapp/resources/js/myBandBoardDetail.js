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
heart.addEventListener('click', likeUnlikeFunc);

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
           Swal.fire('승인이 완료되었습니다.', '화끈하시네요~!', 'success');
        }
     });
});