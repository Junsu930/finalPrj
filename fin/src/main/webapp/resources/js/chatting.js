let darks = localStorage.getItem('darkMode');

if(darks != null){
    console.log(darkMode);
    document.getElementById("chatting-img").innerHTML="<img src='/resources/images/guitarduck-black.png'>"
}