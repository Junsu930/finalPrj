console.log("header");

// =========================================반응형=========================================

const hamburger = document.getElementById("hamburger");
const navUl = document.querySelector(".navUl");
const navDiv = document.querySelector(".navDiv")
const navSecondDiv = document.querySelector(".navSecondDiv");
const signUpIMG = document.querySelector(".signUpIMG");
const loginIMG = document.querySelector(".loginIMG");




// 반응형 줄어들었을 때, JS
hamburger.addEventListener("click", () => {
    navUl.classList.toggle("active");
    navSecondDiv.classList.toggle("active");
    signUpIMG.classList.toggle("active");
    loginIMG.classList.toggle("active");
})

// =========================================반응형=========================================


// =========================================모드==========================================
// 라이트, 다크모드 요소모음
const sun = document.getElementById("sun");
const body = document.querySelector('body');

const navBar = document.querySelector('.navBar');
const navA = document.querySelectorAll("a.navA"); // navA 클래스를 가진 모든 a태그 요소 담아주기
const toggle = document.getElementById("toggle"); // 반응형 햄버거 토글
const loginIMGI = document.getElementById("loginIMGI");
const logoutIMGI = document.getElementById("logoutIMGI");
const signUpIMGI = document.getElementById("signUpIMGI");


// 다크모드, 라이트모드
// check for saved 'darkMode' in localStorage -> 다크모드 로컬스토리지에 있는지 체크하기위해 변수 선언
let darkMode = localStorage.getItem('darkMode');


// 다크모드 함수
const darkModeFunc = () => {
  // 바디 태그에 다크모드 클래스 입히기
  document.body.classList.add('darkmode');
  
  for(let i = 0; i < navA.length; i++){
    navA[i].style.color="#fff";
  }

let path = document.querySelectorAll('path.path'); 

for(let i = 0; i< path.length; i ++){
  console.log("test");
  path[i].style.stroke ="#FB4F93";
}



// let mainInput = document.querySelectorAll('.mainInput');


// for(let j = 0; j < mainInput.length; j++){
//     	mainInput[j].style.color = "#fff";
// }
 

  // 각각 요소 색깔 바꾸기
  navBar.style.background = "#000";
  sun.style.color="#fff";
  toggle.style.color = "#fff";
  loginIMGI.style.color = "#fff";
  signUpIMGI.style.color = "#fff";
  

  
//   해로 바꿔주기
  sun.className = "bi-brightness-high"
  
  // 로컬 스토리지에 key: darkMode, value: dark
  localStorage.setItem('darkMode', 'dark');
}

// 라이트모드 함수
const lightModeFunc = () => {
  // 바디태그에 다크모드 클래스 지우기
  document.body.classList.remove('darkmode');
  document.body.style.transition = "0.5s";

  for(let i = 0; i < navA.length; i++){
    navA[i].style.color="#000";
  }

  let path = document.querySelectorAll('path.path'); 

  for(let i = 0; i< path.length; i ++){

    path[i].style.stroke ="#000";
  }



  navBar.style.background = "#fff";
  sun.style.color="#000";
  toggle.style.color = "#000";
  loginIMGI.style.color = "#000";
  signUpIMGI.style.color = "#000";
  
//  달로 바꿔주기
  if(sun.className != 'bi-moon'){
    sun.className = "bi-moon";
  }
  // 로컬 스토리지 다크모드 값을 light로 바꿔주기
  localStorage.setItem('darkMode', 'light');
}
 
// If the user already visited and enabled darkMode
// start things off with it on
if (darkMode === 'dark') {
  darkModeFunc();
}

// 다크모드 토글 클릭시
sun.addEventListener('click', () => {
  // 변수에 다크모드 값  가져오기
  darkMode = localStorage.getItem('darkMode'); 
  
  // 다크모드가 아닐 경우 밑에 함수 실행
  if (darkMode !== 'dark') {
    darkModeFunc();
  // 라이트 모드일 경우 라이트모드 함수 실행 
  } else {  
    lightModeFunc(); 
  }
});


// =========================================모드==========================================


// header scroll시 사라지게 함

let lastScrollTop = 0;
let nav = document.querySelector('.navBar');

window.addEventListener('scroll', () =>{

  let scrollTop = window.scrollY;
  if(scrollTop > lastScrollTop){
    nav.style.top = "-60px";
  }else{
    nav.style.top = "0";
  }
  lastScrollTop = scrollTop;
});



let wrapperUlOpen = false;
let messageUlBoxOpen = false;
// alert View 보이기

const wrapperUl = document.querySelector('.wrapperUl');

function showAlertView(){
  wrapperUl.classList.toggle('alertViewShow');
  return wrapperUlOpen = true;
}



$.ajax({ // 접속하자마자 userNo 가져오는 ajax
  url:"getUserNo",
  method:"GET",
  dataType:"JSON",
  success: function(result){

    let loginUserNo = result;

    $.ajax({ // userNo를 바탕으로 userNick 가져오는 ajax
      url:"getUserNicks",
      method:"GET",
      data:{"loginUserNo": loginUserNo},
      dataType:"JSON",
      success: function(getUserNicks){
        console.log(getUserNicks);
        let stringMsg = "님께서 회원님에게 쪽지를 보냈습니다!"

        if(getUserNicks === "none"){
          $('.messageUlBox').append('<li class="wrapperLi"><a href="msgBoxPage" id="msgBoxPageA"><p>NO NEW MESSAGE</p></a></li>') // 쪽지가 없거나, 읽었을 때, 코드 수행
        }else{
          for(let i = 0; i < getUserNicks.length; i++){
            $('.messageUlBox').append(`<li class="wrapperLi"><div class="messageDate"><h3>${getUserNicks[i].sendMonth}<br><span>${getUserNicks[i].sendDay}</span></h3></div>
            <a href="msgBoxPage"><p>${getUserNicks[i].userNick + stringMsg}<br>지금 확인하세요!</p></a></li>`) // 새로운 쪽지가 있을 때, 코드 수행
          }
        } // if끝

      },
      error : function(request, status, error){
        console.log("getUserNicks AJAX 에러 발생");
        console.log("상태코드 : " + request.status); 
      }
    });

    $.ajax({ // userNo를 바탕으로 alarmCount 가져오는 ajax
      url:"getAlarmCount",
      method:"GET",
      data:{"loginUserNo": loginUserNo},
      dataType: "JSON",
      success: function(count){
  
        const alarmCount = count;
        console.log(alarmCount);
  
        if(alarmCount != 0){
          $('#alarmCount').css('display', 'block');
          $('#alarmCount').text(alarmCount); // 알람 카운트가 0 초과일 때, 수행
        }else{
          console.log(alarmCount);
        }
      }, // success 끝나는 부분
      error : function(request, status, error){
        console.log("getAlarmCount AJAX 에러 발생");
        console.log("상태코드 : " + request.status); 
      }
    });


    // 메세지 아이콘 클릭 시, count 갯수 사라지게 하는 이벤트 리스너
    document.getElementById('msgBoxOpen').addEventListener('click', function() {

    let messageUlBox = document.querySelector('.messageUlBox');
    $.ajax({
      url:"disappearCount",
      method:"GET",
      data:{"loginUserNo": loginUserNo},
      dataType: "JSON",
      success: function(result){
        console.log(result);
        $('#alarmCount').css('display', 'none'); // 알람 카운트 보이는 걸 없애기
      },
      error : function(request, status, error){
        console.log("showMessageView AJAX 에러 발생");
        console.log("상태코드 : " + request.status); 
      }
    });
    messageUlBox.classList.toggle('alertViewShow');
    return messageUlBoxOpen = true;
  }); // 이벤트 리스너 끝

  }, // 상단 success 끝
  error : function(request, status, error){
    console.log("getUserNo AJAX 에러 발생");
    console.log("상태코드 : " + request.status); 
  }
}); // 상단 ajax끝







  
