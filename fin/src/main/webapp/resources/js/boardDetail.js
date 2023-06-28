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
heart.addEventListener('click', addLike);


function addLike(){
  $.ajax({
    url:"addLike",
    type: "GET",
    data:{"userNo" : userNo},
    dataType:"JSON",
    success: function(result){
      if(result > 0){
        console.log("라이크 1증가");
      }else{
        console.log("증가 실패");
      }
    },
    error : function(request, status, error){
      console.log("addLike AJAX 에러 발생");
      console.log("상태코드 : " + request.status);
    }
  });
}