/****************** 네이버 로그인 *******************/
var naver_id_login = new naver_id_login("cE2qHHhSMkJYsQGPIKaz", "http://127.0.0.1:8080/fin/callback");
// 접근 토큰 값 출력

naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

function naverSignInCallback() {
  
  // 네이버 사용자 프로필 조회
  let token = naver_id_login.oauthParams.access_token;
  let email = naver_id_login.getProfileData('email');
  let nick = naver_id_login.getProfileData('nickname');
  let profileImg = naver_id_login.getProfileData('profile_image');
  
  $.ajax({
    url : "/fin/dupCheckForNaver",
    type : "post",
    data : {"email" :email, "nick" : nick},
    success : function (data){

      dupCheck(data, email, nick, token, profileImg);
    }
  });
  

};

// 중복 여부 체크
function dupCheck(datas, email, nick , token, profileImg){

  if(datas == 1){
    swal.fire("이메일이 중복되었습니다. 확인해주세요");
  }else if(datas==2){
    swal.fire("닉네임이 중복되었습니다. 확인해주세요");
  }else{
    naverCheck(email, nick ,token,profileImg);
  }
};

// 네이버 DB가입처리
function naverSignUp(email, nick, profile_image, token){
  
  $.ajax({
    url : "/fin/naverSignUp",
    type : "post",
    data: {"email" :email, "nick" : nick, "profileImg" : profile_image, "token" : token},
    success : function(){
        opener.location.href='/fin/main'; 
        window.close();
    }
});
  
}
//토큰 교체
function changeToken(email,token){
  
  $.ajax({
    url : "/fin/changeToken",
    type : "post",
    data: {"email" :email, "token" : token},
    success : function(){
        opener.location.href='/fin/main'; 
        window.close();
    }
  });
  
};

function naverCheck(email, nick, token, profileImg){
  $.ajax({
    url : "/fin/checkNaverFl",
    type : "post",
    data: {"email" :email},
    success : function(data){
      if(data == 0) { // 만약 가입된 멤버가 없으면
        naverSignUp(email, nick, profileImg, token);
      }else { // 가입된 멤버가 있으면 
        changeToken(email,token);
      }
    }
  });
}