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

function like_func(){
  var frm_read = $('.content');
  var boardNo = $('#boardNo', frm_read).val();
  var userNo = $('#userNo', frm_read).val();
  console.log("boardNo, userNo : " + boardNo +","+ userNo);
  
  $.ajax({
    url: "../BoardLike/Board.do",
    type: "GET",
    cache: false,
    dataType: "json",
    data: 'boardNo=' +boardNo+ '&userNo=' +userNo,
    success: function(data) {
      var msg = '';
      var heart = '';
      msg += data.msg;
      alert(msg);
       
      $('#heart', frm_read).attr('src', heart);
      $('#like_Cnt').html(data.like_Cnt);
      $('#like_Check').html(data.like_Check);
    },
    error: function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}