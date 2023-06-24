

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
  // 각각 요소 색깔 바꾸기
  // navBar.style.background = "#fff";
  sun.style.color="#fff";
  toggle.style.color = "#fff";
  // loginIMGI.style.color = "#fff";
  // signUpIMGI.style.color = "#fff";
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
  // navBar.style.background = "#000";
  sun.style.color="#000";
  toggle.style.color = "#000";
  // loginIMGI.style.color = "#000";
  // signUpIMGI.style.color = "#000";
  
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



// =========================================탑 버튼 스크롤 함수==========================================

let lastScrollTop = 0;
let nav = document.querySelector('.navBar');

window.addEventListener('scroll', () =>{ // header scroll시 사라지게 함

  let scrollTop = window.scrollY;

  if(scrollTop > lastScrollTop){
    nav.style.top = "-60px";
  }else{
    nav.style.top = "0";
  }
  lastScrollTop = scrollTop;
});

// =========================================탑 버튼 스크롤 함수==========================================

let wrapperUlOpen = false;
let messageUlBoxOpen = false;
// alert View 보이기

let wrapperUl = document.querySelector('.wrapperUl');
let messageUlBox = document.querySelector('.messageUlBox');

// 프사 이미지 클릭 시, 밑에 ul 나오게하는 js

let menu = document.querySelector('.menu');
function activeMenu(){
    menu.classList.toggle('activeMenu');
}
// 프사 이미지 클릭 시, 밑에 ul 나오게하는 js

// post, messagebox나오게 하는 함수

function showAlertView(){
  wrapperUl.classList.toggle('show');
  return wrapperUlOpen = true;
}

function showMsgBoxView(){
  messageUlBox.classList.toggle('show');
  return messageUlBoxOpen = true;
}

// post, messagebox나오게 하는 함수





function getUserNicks(loginUserNo){ //userNicksList 부르는 함수 
  $.ajax({ // userNo를 바탕으로 userNickslist 가져오는 ajax
    url:"getUserNicks",
    method:"GET",
    data:{"loginUserNo": loginUserNo},
    dataType:"JSON",
    success: function(getUserNicks){
      let stringMsg = "님께서 회원님에게 쪽지를 보냈습니다!"

      if(getUserNicks === "none"){
        $('.messageUlBox').append('<li class="wrapperLi"><a href="msgBoxPage" id="msgBoxPageA"><p>NO MESSAGE</p></a></li>') // 쪽지가 없거나, 읽었을 때, 코드 수행
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

}

function getMsgAlarmCount(loginUserNo){ // msgAlarmCount 가져오는 함수 
  $.ajax({ // userNo를 바탕으로 alarmCount 가져오는 ajax
    url:"getMsgAlarmCount",
    method:"GET",
    data:{"loginUserNo": loginUserNo},
    dataType: "JSON",
    success: function(count){
      const alarmCount = count;
      if(alarmCount != 0){
        $('#msgAlarmCount').css('display', 'block');
        $('#msgAlarmCount').text(alarmCount); // 알람 카운트가 0 초과일 때, 수행
      }else{
        
      }
    }, // success 끝나는 부분
    error : function(request, status, error){
      console.log("getMsgAlarmCount AJAX 에러 발생");
      console.log("상태코드 : " + request.status); 
    }
  });
}



function disappearCount(loginUserNo){ // msgCount 갯수 사라지게 하는 함수
  // 메세지 아이콘 클릭 시, count 갯수 사라지게 하는 이벤트 리스너
  document.getElementById('msgBoxOpen').addEventListener('click', function() {
        
    console.log("msg click");

    $.ajax({
      url:"disappearCount",
      method:"GET",
      data:{"loginUserNo": loginUserNo},
      dataType: "JSON",
      success: function(result){
        $('#msgAlarmCount').css('display', 'none'); // 알람 카운트 보이는 걸 없애기
        console.log("msgCount 지우기 성공 result : " + result);
      },
      error : function(request, status, error){
        console.log("disappearCount AJAX 에러 발생");
        console.log("상태코드 : " + request.status); 
      }
    });
    // messageUlBox.classList.toggle('alertViewShow');
    // return messageUlBoxOpen = true;
    showMsgBoxView();

  });
}



function getAlarmCount(loginUserNo){ // alarmCount 가져오는 함수 
  $.ajax({ // userNo를 바탕으로 alarmCount 가져오는 ajax
    url:"getAlarmCount",
    method:"GET",
    data:{"loginUserNo": loginUserNo},
    dataType: "JSON",
    success: function(count){

      if(count != 0){
        $('#alarmCount').css('display', 'block');
        $('#alarmCount').text(count); // 알람 카운트가 0 초과일 때, 수행
      }else{
        
      }
    }, // success 끝나는 부분
    error : function(request, status, error){
      console.log("getAlarmCount AJAX 에러 발생");
      console.log("상태코드 : " + request.status); 
    }
  });
}


function alarmDisappearCount(loginUserNo){ // alarmCount 지우기 함수
  document.getElementById('alertBell').addEventListener('click', function(){

    $.ajax({
      url: "alarmDisappearCount",
      method:"GET",
      data:{"loginUserNo": loginUserNo},
      dataType:"JSON",
      success: function(result){
        $('#alarmCount').css('display', 'none');
        console.log("알람 카운트 지우기 성공 여부 : " + result);
      },
      error : function(request, status, error){
        console.log("alarmDisappearCount AJAX 에러 발생");
        console.log("상태코드 : " + request.status); 
      }
    });
    showAlertView();
  });
}


function getUserNicksFromRoom(loginUserNo){ // 예약 신청알람 함수
  $.ajax({
    url:"getUserNicksFromRoom",
    method:"GET",
    data:{"loginUserNo" : loginUserNo},
    dataType: "JSON",
    success(getUsers){
      
      let stringMsg1 = "님께서 회원님의 "
      let stringMsg2 = "을 예약 신청했습니다!"
      if(getUsers === "none"){
        $('.wrapperUl').append('<li class="wrapperLi"><a href="#" id="noMsgAlarmBox"><p>NO POST</p></a></li>') // 예약신청이 없거나, 읽었을 때, 코드 수행
      }else{
        for(let i = 0; i < getUsers.length; i++){
          $('.wrapperUl').append(`<li class="wrapperLi"><div class="date"><h3>${getUsers[i].sendMonth}<br><span>${getUsers[i].sendDay}</span></h3></div>
          <a href="#"><p>${getUsers[i].userNick + stringMsg1 + getUsers[i].roomName + stringMsg2 }</p></a></li>`) // 새로운 예약신청 알람 있을 때, 코드 수행
        }
      } // if끝
    },
    error : function(request, status, error){
      console.log("getUserNicksFromRoom AJAX 에러 발생");
      console.log("상태코드 : " + request.status); 
    }
  });
}



let loginText = document.querySelector('.loginText').innerText;

if(loginText === "Login"){
}else{
  $.ajax({ // 접속하자마자 userNo 가져오는 ajax
    url:"getUserNo",
    method:"GET",
    dataType:"JSON",
    success: function(loginUserNo){
      getUserNicks(loginUserNo);
      getMsgAlarmCount(loginUserNo);
      disappearCount(loginUserNo);
  
      getAlarmCount(loginUserNo);
      alarmDisappearCount(loginUserNo);
      getUserNicksFromRoom(loginUserNo);
    }, //  success 끝
    error : function(request, status, error){
      console.log("getUserNo AJAX 에러 발생");
      console.log("상태코드 : " + request.status); 
      return false;
    }
  }); //  ajax끝
}

















  
