const heart = document.getElementById('heart');

const commentBox2 = () => {
    if(heart.classList.contains('like')){
        heart.classList.remove('like');
        heart.classList.add('unlike');

    }else{
        heart.classList.remove('unlike');
        heart.classList.add('like');
    }
}
heart.addEventListener('click', addLike);


function addLike(loginUserNo,boardNo){
  $.ajax({
    url:"addLike",
    type: "POST",
    data:{"loginUserNo" : loginUserNo, "boardNo" : boardNo},
    dataType:"JSON",
    contentType: false,
    processData: false,
    success: function(result){
    alert(result);
    },
    error : function(request, status, error){
      console.log("addLike AJAX 에러 발생");
      console.log("상태코드 : " + request.status);
    }
  });
}