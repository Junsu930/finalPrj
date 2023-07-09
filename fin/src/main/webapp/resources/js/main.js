



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


// ============================@keyframes scroll============================



 


// 현재 높이 + view port높이 / 문서 전체높이 * 100 = 내가 현재 있는 지점을 퍼센트로 보여주는 함수
function getCurrentScrollPercentage(){ 
  return (window.scrollY + window.innerHeight) / document.body.clientHeight * 100
}

const boardText = document.querySelector('.boardText')
const usedText = document.querySelector('.usedText');
const reservationText = document.querySelector('.reservationText');

window.addEventListener("scroll", ()=>{
  const mediaQuery = window.matchMedia("screen and (min-width: 56rem)"); // 56 rem 이상 다 적용
  const scrollValue = getCurrentScrollPercentage();
  if(mediaQuery.matches){
      // guitar Text
    if(scrollValue > 28){
      boardText.style.animation = "slideGuitar 0.7s ease-out forwards"
      if(scrollValue > 38){
        boardText.style.animation = "disappearSlideGuitar 0.7s ease-out forwards"
      }
    }

  // drum Text
    if(scrollValue > 40){
      usedText.style.animation = "slideDrum 0.7s ease-out forwards"
      if(scrollValue > 47.7){
        usedText.style.animation = "disappearSlideDrum 0.7s ease-out forwards"
      }
    }

  // headphone Text
    if(scrollValue > 52){
      reservationText.style.animation = "slideHeadPhone 0.7s ease-out forwards"
      if(scrollValue > 58.8){
        reservationText.style.animation = "disappearSlideHeadPhone 0.7s ease-out forwards"
      }
    }
  }

});










// ============================@keyframes============================








// =========================================모드==========================================

const pathArr = document.querySelectorAll('path.path'); 

const Mode = localStorage.getItem('darkMode');

const mainInput = document.querySelectorAll('.mainInput');

if (Mode === 'dark') {
  // 패스컬러 -> 핑크
    for(let i = 0; i< pathArr.length; i ++){
        pathArr[i].style.stroke ="#FB4F93";
      }
  // 하단 메일 보내는 인풋 요소들 
    // for(let j = 0; j < mainInput.length; j++){
    // 	mainInput[j].style.color = "#fff";
    // }
    
}else{
  // 패스컬러 -> 블랙
  for(let i = 0; i< pathArr.length; i ++){
    pathArr[i].style.stroke ="#000";
  }
  // 하단 메일 보내는 인풋 요소들 
  // for(let j = 0; j < mainInput.length; j++){
  //   mainInput[j].style.color = "#000";
  // } 
}






// top 버튼
const topBtn = document.querySelector(".topBtn");
window.addEventListener('scroll', ()=>{
  let forTopScroll = getCurrentScrollPercentage();
  if(forTopScroll > 16){
    topBtn.classList.add('show');
  }else{
    topBtn.classList.remove('show');
  }
});

topBtn.addEventListener("click", () =>{
  window.scrollTo({ top:0, behavior: 'smooth'});
});



// 탑버튼 패드 미디어쿼리
const topPadMedia = window.matchMedia("screen and (min-width:47.8rem) and (max-width:53rem)"); // 패드 width 영역 768 ~ 820px
// 탑버튼 폰 미디어쿼리
const topPhoneMedia = window.matchMedia("screen and (min-width:21rem) and (max-width: 26rem)"); // 폰 width 영역 360 ~ 414px


if(topPadMedia.matches){
  window.addEventListener('scroll', () =>{
    let mediaTopValue1 = getCurrentScrollPercentage();
    if(mediaTopValue1 > 23){
      topBtn.classList.add('show');
    }else{
      topBtn.classList.remove('show');
    }
  });
}


if(topPhoneMedia.matches){
  window.addEventListener('scroll', ()=>{
    let mediaTopValue = getCurrentScrollPercentage(); // Y스크롤 위치 구하기
    if(mediaTopValue > 25 ){
      topBtn.classList.add('show');
    }else{
      topBtn.classList.remove('show');
    }
  });
}



// 패드일 때 mainText mediaQuery

window.addEventListener('scroll', () => {
  if (topPadMedia.matches) {
    let mediaTopValue2 = getCurrentScrollPercentage();
    if (mediaTopValue2 > 26) {
      boardText.style.animation = "slideGuitarMedia 0.7s ease-out forwards";
      // boardText 나오는 거
      if (mediaTopValue2 > 37){
        usedText.style.animation = "slideDrumMedia 0.7s ease-out forwards"
        // usedText 나오는 거
      }
      if (mediaTopValue2 > 46) {
        boardText.style.animation = "disappearSlideGuitarMedia 0.7s ease-out forwards";
        // boardText 들어가는 거
      }
      if(mediaTopValue2 > 47){
        reservationText.style.animation = "slideHeadPhoneMedia 0.7s ease-out forwards"
        // reservationText 나오는 거
      }
      if(mediaTopValue2 > 53){
        usedText.style.animation = "disappearSlideDrumMedia 0.7s ease-out forwards"
        // usedText 들어가는 거
      }
      if(mediaTopValue2 > 65){
        reservationText.style.animation = "disappearSlideHeadPhoneMedia 0.7s ease-out forwards"
        // reservationText 들어가는 거
      }
    }
  }
});

// 패드일 때 mainText mediaQuery


// 폰 일때 mainText mediaQuery
window.addEventListener('scroll', () => {
  if(topPhoneMedia.matches){ 
    console.log("phoneMedia!");
    let mediaTopValue3 = getCurrentScrollPercentage();
    if(mediaTopValue3 > 22){
      boardText.style.animation = "slideGuitarMediaPhone 0.7s ease-out forwards"
      if(mediaTopValue3 > 27){
        usedText.style.animation = "slideDrumMediaPhone 0.7s ease-out forwards";
      }
      if(mediaTopValue3 > 34){
        reservationText.style.animation = "slideHeadPhoneMediaPhone 0.7s ease-out forwards";
      }
      if(mediaTopValue3 > 35.6){
        boardText.style.animation = "disappearSlideGuitarMediaPhone 0.7s ease-out forwards";
      }
      if(mediaTopValue3 > 42){
        usedText.style.animation = "disappearSlideDrumMediaPhone 0.7s ease-out forwards";
      }
      if(mediaTopValue3 > 47.8){
        reservationText.style.animation = "disappearSlideHeadPhoneMediaPhone 0.7s ease-out forwards";
      }
    }
  }
});

// 폰 일때 mainText mediaQuery






// 메일 보내기 ajax

document.getElementById('sendEmailBtn').addEventListener("click", () =>{

  

  const subject = document.querySelector('.inputSubject').value;
  const fromName = document.querySelector('.inputName').value;
  const fromAddress = document.querySelector('.inputFromEmail').value;
  const mailContent = document.querySelector('.mainTextArea').value;


  $.ajax({
  url:"sendEmail",
  data: {"subject" : subject , "fromName" : fromName, "fromAddress" : fromAddress, "mailContent" : mailContent },
  type : "POST",
  dataType: "JSON",  // dataType : 응답데이터 형식을 지정
  // -> "JSON"으로 지정 시 자동으로 JS 객체로 변환
  success : function(result){ 

    Swal.fire({
      title: 'BandArchive',
      text: result,
      icon: 'success',
    })
    document.querySelector('.inputSubject').value = "";
    document.querySelector('.inputName').value = "";
    document.querySelector('.inputFromEmail').value = "";
    document.querySelector('.mainTextArea').value = "";
  },
  error : function(request, status, error){
    console.log("AJAX 에러 발생");
    console.log("상태코드 : " + request.status); // 404, 500
  }
  });
});



