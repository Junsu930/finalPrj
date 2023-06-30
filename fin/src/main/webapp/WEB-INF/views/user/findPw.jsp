<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>

	<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
	<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/findPw.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/naverLogin.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/loginbootStrap.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/loginModal.css">
	<script src = "${contextPath}/resources/js/myPageModal.js"></script>
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>


	</head>
      <!--바디 부분 시작-->
      <body>
 	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   
 	
 	<div class="svgBox">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1117 669">
            <g id="loginBack">
              <path class="loginPath" d="m335.5,92.5c-4.16,2.26-10.27,5.28-18,8-8.44,2.97-13.67,4.82-21,5-10.67.27-18.75-3.15-23-5-3.78-1.64-11.02-4.88-18-12-3.16-3.22-13.32-13.59-14-29-.21-4.66-.56-12.57,5-19,.9-1.04,8.34-9.38,18-7,8.32,2.05,11.43,10.35,12,12,.36,1.06,3.27,9.82-1,13-2.63,1.96-7.61,1.5-9-1-1.38-2.49,1.22-6.24,3-8,5.4-5.35,14.34-3.4,16-3,2.37.57,7.03,1.7,10,6,3.06,4.42,2.37,9.36,2,12-.27,1.94-1.12,8.02-6,12-2.91,2.38-6.27,2.92-13,4-3.59.58-4.63.23-11,1-1.78.21-1.92.26-7,1-9.03,1.31-9.98,1.36-14,2-4.17.66-6.65,1.17-11,2-12.11,2.32-16.06,2.87-22,4-7.1,1.35-20.1,3.88-35,9-3.24,1.11-13.4,4.7-26,11-9.61,4.81-26.21,13.24-44,29-5.77,5.11-14.78,13.19-24,26-7.64,10.63-12.08,19.85-15,26-6.89,14.5-10.24,26.27-11,29-2.67,9.6-7.39,26.99-6,49,.45,7.14,1.43,12.96,2,16,.44,2.34,2.14,11.07,8,27,4.49,12.19,6.73,18.29,11,26,2.05,3.7,8.21,14.39,19,26,1.6,1.72,8.49,9.05,19,17,3.72,2.81,8.37,6.3,15,10,8.29,4.62,14.82,6.86,24,10,9.06,3.1,15.68,5.37,25,7,2.84.5,4.54.69,24,2,22.33,1.5,24.32,1.53,28,1,6.91-1,17.46-2.68,25-11,1.46-1.61,8.36-9.23,6-15-2.62-6.4-15.11-6.83-22-6-2.63.32-11.26,1.63-28,15-7.95,6.35-18.19,14.66-28,29-10.17,14.87-14.82,28.8-17,37-.93,3.5-4.22,16.51-4,34,.09,7.12.42,22.71,7,41,10.23,28.46,29.02,45.19,38,53,14.36,12.49,27.65,18.99,36,23,18.58,8.93,33.86,12.32,51,16,9.76,2.1,28.13,5.59,52,7,8.88.52,43.93,2.26,91-6,19.29-3.39,32.38-7.01,54-13,48.71-13.49,83.88-27.69,92-31,33.51-13.68,57.49-26.25,78-37,8.03-4.21,35.22-18.59,70-40,11.43-7.04,29.96-19.36,67-44,46.63-31.01,55.1-37.12,63-43,20.19-15.04,16.21-13.47,48-38,32.07-24.74,37.09-27.09,57-44,16.88-14.34,25.32-21.51,34-30,14.62-14.3,21.85-23.39,24-22,1.52.98-.23,6.74-13,36-8.19,18.77-14.78,33.15-17,38-15.19,33.17-22.82,49.82-24,53-1.29,3.45-8.16,22.09-13,31-.45.83-2.56,4.65-5,10-1.95,4.26-1.49,6.21-3,7-2.78,1.44-7.05-2.6-13-7-.5-.37-7-4.25-20-12-12.45-7.43-15.94-6.12-22-12-3.27-3.17-3.82-4.77-6-5-5.11-.53-8.7,7.57-19,20-8.12,9.79-8.83,11.29-10,11-4.87-1.22,2.34-24.49-10-45-2.24-3.73-4.4-7.29-8-10-3.65-2.74-6.35-3.15-11-5-4.85-1.93-3.71-2.2-17-10-10.87-6.38-16.31-9.57-20-11-4.11-1.59-5.87-1.88-6-3-.36-3.1,12.44-6.63,32-13,10.72-3.49,21.31-7.39,32-11,1.32-.45,25.01-8.46,50-18,19.55-7.46,37.11-14.79,52-21,32.24-13.45,40.9-17.77,42-16,2.05,3.29-24.45,23.57-42,37-1.62,1.24-12.41,9.16-34,25-17.99,13.2-26.01,19.07-37,28-8.59,6.98-15.46,12.96-20,17"/>
            </g>
        </svg>
    </div>
 	
 	
    <section class="loginSection"> <!-- body -->

        <div class="wrapper"> <!--wrapper-->

            <div class="formBox login"> <!--for-box login-->
                <h2>CHANGE PASSWORD</h2>
                
                
		
                <form action="fin/findPassword" method="POST" name="login-form" onsubmit="return findPwValidate()">
                    <div class="inputBox"> <!--input-box-->
                        <span class="icon">
                            <ion-icon name="mail" id="sendEmail"></ion-icon>
                        </span>
                        <input type="email" id="email" name="userEmail" required>
                        <label>EMAIL&nbsp;&nbsp;<span class="signUp-message" id="emailMessage"></span></label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon">                           
                        </span>
                        <input type="text" id="checkEmail" name="certification" required>
                        <label>CERTIFICATION NUMBER&nbsp;&nbsp;<span class="signUp-message" id="emailCheckMessage"></span></label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon" onclick="showAndHide()">
                            <i id="eye" class="bi bi-eye-fill"></i>
                        </span>
                        <input type="password" id="password" name="userPw" required>
                        <label>NEW PASSWORD&nbsp;&nbsp;<span class="signUp-message" id="pwMessage"></span></label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon">
            
                        </span>
                        <input type="password" id="chpassword" name="userPw2" required>
                        <label>CHECK PASSWORD&nbsp;&nbsp;<span class="signUp-message" id="pwMessage2"></span></label>
                    </div>
               

                    <div class="loginBtnBox" title="비밀번호 변경">
                      
                      <button type="submit" class="btn">CONFIRM</button>
                      
                    </div>


                </form>
            </div>

            </div>

        </section>

            <script>
                const msg = "${msg}";
                if (msg.trim() !== "") {
                  alert(msg);
                } 

   

              </script>
              <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
              <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
              
                      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
             
                <script src="${contextPath}/resources/js/findPw.js?ver=1"></script>
            </body>
          </html>