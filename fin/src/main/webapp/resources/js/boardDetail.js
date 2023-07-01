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

heart.addEventListener('click', function(){
  addLike(loginMemberNo,boardNo);
});


