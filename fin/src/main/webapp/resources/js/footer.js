console.log("footer");

const mode = localStorage.getItem('darkMode');
const footerA = document.querySelectorAll("a.footerA")
const footerIMG = document.getElementsByClassName('bi')
const shapeFill = document.querySelector(".shape-fill");


if(mode === 'dark'){
    for(let i = 0; i < footerA.length; i++){
        footerA[i].style.color = "#fff";
    }
    for(let j = 0; j < footerIMG.length; j++){
        footerIMG[j].style.color ="#fff";
    }
    shapeFill.style.stroke = "#FB4F93";
}