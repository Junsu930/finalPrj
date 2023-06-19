let password = document.getElementById('password');
let eye = document.getElementById('eye');
    
function showAndHide(){
    if(password.type === 'password'){
        password.setAttribute('type', 'text');
        eye.classList.toggle('bi-eye-slash-fill');
    }else{
        password.setAttribute('type', 'password');
        eye.classList.toggle('bi-eye-slash-fill');
    }
}


const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');




registerLink.addEventListener('click', ()=> {
    wrapper.classList.add('active');
});

loginLink.addEventListener('click', ()=> {
    wrapper.classList.remove('active');
});


let showBusiness = document.getElementById('showBusiness');
let busniessBox = document.querySelector('.busniessBox');

showBusiness.addEventListener('click', () =>{
    busniessBox.classList.toggle('USER');
    setText();
       if (showBusiness.innerText === 'USER') {
        busniessBox.classList.add('visible');
        console.log(busniessBox);
    } else {
        busniessBox.classList.remove('visible');
    }
});


function setText() {
    const $showBusiness = document.getElementById("showBusiness")
    const text = $showBusiness.innerText;
    $showBusiness.innerText = text === "USER" ? "Business" : "USER";
}

    document.querySelector('.js-static-modal-toggle').addEventListener('click', function() {
      new Modal({el: document.getElementById('static-modal')}).show();
    });


("use strict");

const form = document.querySelector("#form__wrap");
const checkAll = document.querySelector(".terms__check__all input");
const checkBoxes = document.querySelectorAll(".input__check input");
const submitButton = document.querySelector("button");

const agreements = {
  termsOfService: false,
  privacyPolicy: false,
  allowPromotions: false
};

form.addEventListener("submit", (e) => e.preventDefault());

checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle("active");
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener("click", (e) => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add("active");
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove("active");
    });
  }
  toggleSubmitButton();
});





/*회원가입 js*/
// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "email"     : false,
    "rpassword"  : false,
    "password2" : false,
    "nickname"  : false,
    "agree" : false,
    //"sendEmail" : false
    //"checkEmail" : false
};



/*이메일 유효성검사*/

const email = document.getElementById("email");
const emailMessage = document.querySelector("#emailMessage");

email.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if( email.value.length == 0 ){
        emailMessage.innerText = "";
        emailMessage.classList.remove("confirm", "error");

        checkObj.email = false; // 유효 X 기록
        return;
    }

    // 입력된 경우
    const regExp = /^[\w\-\_]{4,}@[\w\-\_]+(\.\w+){1,3}$/;//숫자,문자@포함

    if( regExp.test(email.value) ){ // 유효한 경우
        
        // ****** 이메일 중복 검사(ajax) 진행 예정 ******

        //  $.ajax( {k:v , k:v} );  // jQuery ajax 기본형태

        // email.value  == 입력된 이메일

        $.ajax({
            url : "emailDupCheck",   
            //  필수 속성 url
            // 현재 주소 : /fin/login
            // 상대 경로 : /comm/login/emailDupCheck

            data : { "userEmail" : email.value },
            // data속성 : 비동기 통신 시 서버로 전달할 값을 작성(JS 객체 형식)
            // -> 비동기 통신 시 input에 입력된 값을
            //   "memberEmail" 이라는 key 값(파라미터)으로 전달

            type : "GET", // 데이터 전달 방식 type

            success : function(result){
                // 비동기 통신(ajax)가 오류 없이 요청/응답 성공한 경우
                
                // 매개변수 result : servlet에서 출력된 result 값이 담겨있음
                // console.log(result);

                if(result == 1){ // 중복 O
                    emailMessage.innerText = "Duplicated Email";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");
                    checkObj.email = false; // 유효 X 기록

                } else { // 중복 X
                    emailMessage.innerText = "";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    checkObj.email = true; // 유효 O 기록
                }
            },
            
            error : function(){
                // 비동기 통신(ajax) 중 오류가 발생한 경우
                console.log("에러 발생");
            }

        });
        


    }else{
        emailMessage.innerText = "invalid Email";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        checkObj.email = false; // 유효 X 기록
    }

});


/*인증번호 보내기 js*/

// 인증번호 보내기
const sendEmail = document.getElementById("sendEm");
const cMessage = document.getElementById("cMessage");
let chem;
// 타이머에 사용될 변수
let checkInterval; // setInterval을 저장할 변수
let min = 4;
let sec = 59;

sendEmail.addEventListener("click", function(){

    if( checkObj.email ){ // 유효한 이메일이 작성되어 있을 경우에만 메일 보내기

        $.ajax({
            url : "checkEmail"  ,
            data : { "inputEmail" : email.value },
            type : "GET",
            success : function(result){
                console.log("이메일 발송 성공");
                console.log(result);

                chem = result;
                // 인증 버튼이 클릭되어 정상적으로 메일이 보내졌음을 checkObj에 기록
                //checkObj.sendEmail = true;
                

            },
            error : function(){
                console.log("이메일 발송 실패")
            }
        });

        // Mail 발송 Ajax 코드는 동작이 느림....
        // -> 메일은 메일대로 보내고, 타이머는 버튼이 클릭 되자 마자 바로 실행
        // --> ajax 코드가 비동기이기 때문에 메일이 보내지는 것을 기다리지 않고
        //      바로 다음 코드가 수행된다!!

        // 5분 타이머
        // setInerval(함수, 지연시간) : 지연시간이 지난 후 함수를 수행 (반복)
        /*
        cMessage.innerText = "5:00"; // 초기값 5분
        min = 4;
        sec = 59; // 분, 초 초기화

        cMessage.classList.remove("confirm");
        cMessage.classList.remove("error");

        // 변수에 저장해야지 멈출 수 있음
        checkInterval = setInterval(function(){
            if(sec < 10) sec = "0" + sec;
            cMessage.innerText = min + ":" + sec;

            if(Number(sec) === 0){
                min--;
                sec = 59;
            }else{
                sec--;
            }

            if(min === -1){ // 만료
                cMessage.classList.add("error");
                cMessage.innerText = "인증번호가 만료되었습니다.";

                clearInterval(checkInterval); // checkInterval 반복을 지움
            }

        }, 1000); // 1초 지연 후 수행
        */

        
        alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
    }
});


//이메일인증 유효성 검사
const checkmail = document.getElementById("checkEmail");
const emailCheckMessage = document.getElementById("emailCheckMessage");

checkmail.addEventListener("input", function() {

    if(checkmail.value.length == 0){
        emailCheckMessage.innerText = "input code";
        emailCheckMessage.classList.remove("confirm", "error");

        checkObj.checkEmail = false; // 유효 X 기록
        return;
    }

    if(checkmail.value == chem) { // 이메일 인증번호 동일

        emailCheckMessage.innerText = "";
        emailCheckMessage.classList.add("confirm");
        emailCheckMessage.classList.remove("error");

        checkObj.checkEmail = true;

    } else {

        emailCheckMessage.innerText = "invaild code";
        emailCheckMessage.classList.add("error");
        emailCheckMessage.classList.remove("confirm");

        checkObj.checkEmail = false;

    }

})



// 비밀번호 유효성 검사.

const rpassword = document.getElementById("rpassword");
const password2 = document.getElementById("password2");
const pwMessage = document.getElementById("pwMessage");
const pwMessage2 = document.getElementById("pwMessage2");

rpassword.addEventListener("input", function(){

    if(rpassword.value.length == 0){
        pwMessage.innerText = "";
        pwMessage.classList.remove("confirm", "error");

        checkObj.rpassword = false; // 유효 X 기록
        return;
    }

    const regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;

    if( regExp.test(rpassword.value) ){ // 비밀번호 유효

            pwMessage.innerText = "";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

            checkObj.rpassword = true;
        

    }else{
        pwMessage.innerText = "Invalid PW";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.rpassword = false; // 유효 X 기록
    }
});



// 비밀번호 확인 유효성 검사

// 함수명() : 함수 호출(수행)
// 함수명   : 함수에 작성된 코드 반환

// -> 이벤트가 발생 되었을 때 정의된 함수를 호출하겠다


password2.addEventListener("input", function(){ // 비밀번호 일치 검사

    if(password2.value.length == 0){
        pwMessage.innerText = "";
        pwMessage.classList.remove("confirm", "error");

        checkObj.password2 = false; // 유효 X 기록
        return;
    }


    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(rpassword.value == password2.value){
        pwMessage2.innerText = "";
        pwMessage2.classList.add("confirm");
        pwMessage2.classList.remove("error");

        checkObj.password2 = true; // 유효 O 기록

    } else{
        pwMessage2.innerText = "incorrrect PW";
        pwMessage2.classList.add("error");
        pwMessage2.classList.remove("confirm");

        checkObj.password2 = false; // 유효 X 기록

    }
});


/*닉네임 중복검사*/

const nickname = document.getElementById("nickname");
const nicknameMessage = document.getElementById("nicknameMessage");

nickname.addEventListener("input", function(){
    // 입력되지 않은 경우
    if(nickname.value.length == 0){
        nicknameMessage.innerText = "";
        nicknameMessage.classList.remove("confirm", "error");

        checkObj.nickname = false; // 유효 X 기록
        return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,10}$/;

    if( regExp.test(nickname.value) ){ // 유효한 경우
        

        // ****** 닉네임 중복 검사(ajax) 진행 예정 ******

        //     /community/member/nicknameDupCheck
        $.ajax({
            url : "nicknameDupCheck",  // 필수 작성 속성
            data : { "userNickname" : nickname.value }, // 서버로 전달할 값(파라미터)
            type : "GET", // 데이터 전달 방식(기본값 GET)

            success : function(res){ // 비동기 통신 성공 시(에러 발생 X)

                // 매개변수 res : Servlet에서 응답으로 출력된 데이터가 저장

                if(res == 0){ // 닉네임 중복 X
                    nicknameMessage.innerText = "";
                    nicknameMessage.classList.add("confirm");
                    nicknameMessage.classList.remove("error");
                    checkObj.nickname = true; // 유효 O 기록

                } else { // 닉네임 중복 O
                    nicknameMessage.innerText = "Duplicated name";
                    nicknameMessage.classList.add("error");
                    nicknameMessage.classList.remove("confirm");
                    checkObj.nickname = false; // 유효 O 기록
                }
            },

            error : function(){ // 비동기 통신 중 에러가 발생한 경우
                console.log("에러 발생");
            }
        });



    }else{
        nicknameMessage.innerText = "Invailid name";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");

        checkObj.nickname = false; // 유효 X 기록
    }

});


// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate(){


    console.log("이벤트")

    // checkObj에 있는 모든 속성을 반복 접근하여
    // false가 하나라도 있는 경우에는 form태그 기본 이벤트 제거

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        console.log(checkObj)

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "email":            str="이메일이"; break;
            case "rpassword":        str="비밀번호가"; break;    
            case "password2":        str="비밀번호 확인이"; break;
            case "nickname":         str="닉네임이"; break;
            case "agree":            str="가입동의가"; break;
            //case "checkEmail":       str="인증번호가"; break;
            }

            str += " 유효하지 않음.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    } 

    return true; // form태그 기본 이벤트 수행

}

//아이디 저장 여부 확인
document.getElementById("saveId").addEventListener("change", function(){

    // 체크 여부 확인
    console.log(this.checked)
    // this : change 이벤트가 발생한 요소(체크박스)
    // 체크박스요소.checked   :  체크 여부 반환(true/false)

    // 체크박스요소.checked = true;  : 체크박스 체크
    // 체크박스요소.checked = false; : 체크박스 체크 해제


    if( this.checked ){ // 체크박스가 체크된 경우

        const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다.";

        //confirm(str) // 확인(true) / 취소(false) 대화상자

        if( !confirm(str)  ){ // 취소를 눌렀을 때
            this.checked = false; // 체크 해제
        }
    }


});

//가입동의 유효성 검사
const agreebtn = document.getElementById("agreebtn");
const agreeEasy = document.getElementById("agree");

agreebtn.addEventListener("click", function() {

    if($("input:checkbox[name=agreement]:checked").length == 3) {

        $('input:checkbox[name="agreeList"]').prop('checked',true);

        checkObj.agree = true;

    } else {

        $('input:checkbox[name="agreeList"]').prop('checked',false);

        checkObj.agree = false;

    }

});

agreeEasy.addEventListener("change", function() {

    if(this.checked) {
        checkObj.agree = true;
    }else {
        checkObj.agree = false;
    }

});









