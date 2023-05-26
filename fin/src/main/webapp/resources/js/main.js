console.log("svg.js loaded")


// ======================================패스 요소======================================
// 밴드 그림
const path1 = document.querySelector('.path1');

const content2 = document.querySelector('.content2');
const path2 = document.querySelector('.path2');

const path2Length = path2.getTotalLength();

const content3 = document.querySelector('.content3');
const path3 = document.querySelector('.path3');
const path3Length = path3.getTotalLength();

const content4 = document.querySelector('.content4');
const path4 = document.querySelector('.path4');
const path4Length = path4.getTotalLength();

const content5 = document.querySelector('.content5');
const path5 = document.querySelector('.path5');
const path5Length = path5.getTotalLength();

const content6  = document.querySelector('content6');
const path6 = document.querySelector('.path6');
const path6Length = path6.getTotalLength();



// 기타그림
path2.style.strokeDasharray = path2Length;
path2.style.strokeDashoffset = calcDashoffset(window.innerHeight * 0.8, content2, path2Length);
// 드럼 그림
path3.style.strokeDasharray = path3Length;
path3.style.strokeDashoffset = path3Length;
// 헤드폰 그림
path4.style.strokeDasharray = path4Length;
path4.style.strokeDashoffset = path4Length;
// 폰 그림
path5.style.strokeDasharray = path5Length;
path5.style.strokeDashoffset = path5Length;

path6.style.strokeDasharray = path6Length;
path6.style.strokeDashoffset = path6Length;



function calcDashoffset(scrollY, element, length){
    const ratio = (scrollY - element.offsetTop)/ element.offsetHeight;
    const value = length - (length * ratio);
    return value < 0 ? 0 : value > length ? length : value
}

function scrollHandler(){
    const scrollY = window.scrollY + (window.innerHeight * 0.8 );
    path2.style.strokeDashoffset = calcDashoffset(scrollY, content2, path2Length);
    path3.style.strokeDashoffset = calcDashoffset(scrollY, content3, path3Length);
    path4.style.strokeDashoffset = calcDashoffset(scrollY, content4, path4Length);
    path5.style.strokeDashoffset = calcDashoffset(scrollY, content5, path5Length);
    path6.style.strokeDashoffset = calcDashoffset(scrollY, content6, path6Length);
}


window.addEventListener('scroll', scrollHandler);




// =========================================모드==========================================

let pathArr = document.querySelectorAll('path.path'); 

let Mode = localStorage.getItem('darkMode');

if (Mode === 'dark') {
    for(let i = 0; i< pathArr.length; i ++){
        pathArr[i].style.stroke ="#35c97a";
      };
  }