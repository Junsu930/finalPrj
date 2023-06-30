const checkObj = { 
    "email"     : false,
    "newpassword"  : false,
    "checkpassword" : false,
    "checkEmail" : false
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
            url : "emailCheck",   
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
                    emailMessage.innerText = "";
                    emailMessage.classList.add("confirm");
                    emailMessage.classList.remove("error");
                    checkObj.email = true;

                } else { // 중복 X
                    emailMessage.innerText = "Does not exist Email";
                    emailMessage.classList.add("error");
                    emailMessage.classList.remove("confirm");
                    checkObj.email = false; 
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
const sendEmail = document.getElementById("sendEmail");
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

});

const rpassword = document.getElementById("password");
const password2 = document.getElementById("chpassword");
const pwMessage = document.getElementById("pwMessage");
const pwMessage2 = document.getElementById("pwMessage2");

rpassword.addEventListener("input", function(){

    if(rpassword.value.length == 0){
        pwMessage.innerText = "";
        pwMessage.classList.remove("confirm", "error");

        checkObj.newpassword = false; // 유효 X 기록
        return;
    }

    const regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,20}$/;

    if( regExp.test(rpassword.value) ){ // 비밀번호 유효

            pwMessage.innerText = "";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

            checkObj.newpassword = true;
        

    }else{
        pwMessage.innerText = "Invalid PW";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.newpassword = false; // 유효 X 기록
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

        checkObj.checkpassword = false; // 유효 X 기록
        return;
    }


    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(rpassword.value == password2.value){
        pwMessage2.innerText = "";
        pwMessage2.classList.add("confirm");
        pwMessage2.classList.remove("error");

        checkObj.checkpassword = true; // 유효 O 기록

    } else{
        pwMessage2.innerText = "incorrrect PW";
        pwMessage2.classList.add("error");
        pwMessage2.classList.remove("confirm");

        checkObj.checkpassword = false; // 유효 X 기록

    }
});

// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function findPwValidate(){


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
            case "checkEmail":       str="인증번호가"; break;
            case "newpassword":      str="비밀번호가"; break;    
            case "checkpassword":    str="비밀번호 확인이"; break;
            }

            str += " 유효하지 않음.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    } 

    return true; // form태그 기본 이벤트 수행

}

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