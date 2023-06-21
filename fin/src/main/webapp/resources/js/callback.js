/****************** 네이버 로그인 *******************/
var naver_id_login = new naver_id_login("cE2qHHhSMkJYsQGPIKaz", "http://localhost:8080/fin/callback");
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
  
}