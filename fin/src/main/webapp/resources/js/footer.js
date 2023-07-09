

const mode = localStorage.getItem('darkMode');
const footerA = document.querySelectorAll('.footerA');


// const footerIMG = document.getElementsByClassName('bi')
// const shapeFill = document.querySelector(".shape-fill");

/*
window.onload = function(){
    
    if(mode === 'dark'){
        for(let i = 0; i < footerA.length; i++){
            footerA[i].classList.remove("footerA");
            footerA[i].classList.add("footerDarkAtag");
            console.log("다크모드임");
        }
    }else{
        for(let i = 0; i < footerA.length; i++){
            footerA[i].classList.remove("footerDarkAtag");
            footerA[i].classList.add("footerA");
            console.log("다크모드아님");
        }
    }
}
*/

    document.querySelector('.footer1-modal-toggle').addEventListener('click', function() {
      new Modal({el: document.getElementById('footer1-modal')}).show();
    });

    document.querySelector('.footer2-modal-toggle').addEventListener('click', function() {
      new Modal({el: document.getElementById('footer2-modal')}).show();
    });
    
    document.querySelector('.footer3-modal-toggle').addEventListener('click', function() {
      new Modal({el: document.getElementById('footer3-modal')}).show();
    });

