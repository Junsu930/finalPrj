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
}


window.addEventListener('scroll', scrollHandler);


// ============================@keyframes============================

const boardText = document.querySelector('.boardText')
const usedText = document.querySelector('.usedText');
const reservationText = document.querySelector('.reservationText');

window.addEventListener("scroll", ()=>{

  const scrollValue = window.scrollY;

// guitar Text
  if(scrollValue > 1331){
    boardText.style.animation = "slideGuitar 1.2s ease-out forwards"
    if(scrollValue > 2050){
      boardText.style.animation = "disappearSlideGuitar 1.2s ease-out forwards"
    }
  }

// drum Text
  if(scrollValue > 2108){
    usedText.style.animation = "slideDrum 1.2s ease-out forwards"
    if(scrollValue > 2850){
      usedText.style.animation = "disappearSlideDrum 1.2s ease-out"
    }
  }

// headphone Text
 if(scrollValue > 2970){
  reservationText.style.animation = "slideHeadPhone 1.2s ease-out forwards"
  if(scrollValue > 3730){
    reservationText.style.animation = "disappearSlideHeadPhone 1.2s ease-out forwards"
  }
 }

});

// ============================@keyframes============================





// =========================================모드==========================================

let pathArr = document.querySelectorAll('path.path'); 

let Mode = localStorage.getItem('darkMode');

let mainInput = document.querySelectorAll('.mainInput');

let mainTextA = document.querySelectorAll('.mainTextA');

let mainTextP = document.querySelectorAll('.mainTextP')

if (Mode === 'dark') {
  // 패스컬러 -> 핑크
    for(let i = 0; i< pathArr.length; i ++){
        pathArr[i].style.stroke ="#FB4F93";
      }

  // 하단 메일 보내는 인풋 요소들 
    for(let j = 0; j < mainInput.length; j++){
    	mainInput[j].style.color = "#fff";
    }

  // 메인텍스트
    for(let q = 0; q < mainTextP.length; q++){
      mainTextP[q].style.color = "#fff";
    }

  // 메인 텍스트 a태그 
    for(let k = 0; k < mainTextA.length; k++){
      mainTextA[k].style.color = "#fff";
    } 
}else{
  // 패스컬러 -> 블랙
  for(let i = 0; i< pathArr.length; i ++){
    pathArr[i].style.stroke ="#000";
  }

  // 하단 메일 보내는 인풋 요소들 
  for(let j = 0; j < mainInput.length; j++){
    mainInput[j].style.color = "#000";
  }

  // 메인텍스트
  for(let q = 0; q < mainTextP.length; q++){
    mainTextP[q].style.color = "#000";
  }

  // 메인 텍스트 a태그 
  for(let k = 0; k < mainTextA.length; k++){
    mainTextA[k].style.color = "#000";
  } 
}