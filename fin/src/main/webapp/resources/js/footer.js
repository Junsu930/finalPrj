console.log("footer");

const mode = localStorage.getItem('darkMode');
const footerA = document.querySelectorAll('.footerA');

// const footerIMG = document.getElementsByClassName('bi')
// const shapeFill = document.querySelector(".shape-fill");

window.onload = function(){
    if(mode === 'dark'){
        console.log("dark??")
        for(let i = 0; i < footerA.length; i++){
            footerA[i].classList.replace("footerA", "footerAWhite");
        }
       console.log("if문 빠져나옴");
    }else{
        for(let i = 0; i < footerA.length; i++){
            footerA[i].classList.replace("footerAWhite", "footerA");
        }
        console.log("else문 빠져나옴");
    }
}
