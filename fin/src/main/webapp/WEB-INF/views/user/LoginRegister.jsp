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
	<link rel="stylesheet" href="${contextPath}/resources/css/LoginRegister.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
	
	<link rel="stylesheet" href="${contextPath}/resources/css/loginbootStrap.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/loginModal.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
	<script src = "${contextPath}/resources/js/myPageModal.js"></script>


      <!--바디 부분 시작-->
      <body>
 	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 	
    <section class="loginSection"> <!-- body -->

        <div class="wrapper"> <!--wrapper-->

            <div class="formBox login"> <!--for-box login-->
                <h2>LOGIN</h2>

                <form action="#">
                    <div class="inputBox"> <!--input-box-->
                        <span class="icon">
                            <ion-icon name="mail"></ion-icon>
                        </span>
                        <input type="email" required>
                        <label>EMAIL</label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon" onclick="showAndHide()">
                            <i id="eye" class="bi bi-eye-fill"></i>
                        </span>
                        <input type="password" id="password" required>
                        <label>PASSWORD</label>
                    </div>

                    <div class="rememberForgot">  <!--remember-forgot-->
                        <label><input type="checkbox"> Remember me</label>
                        <a href="#">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn">LOGIN</button>

                    <div class="loginRegister">   <!--login-register-->
                        <p>Don't have an account? <a href="#" class="register-link">Register</a></p>
                    </div>

                </form>
            </div>

            <!-- register -->

            <div class="formBox register"> 
                <h2>REGISTRATION</h2>

                <form id ="form" action="#">

                    <div class="inputBox"> <!--input-box-->
                        <span class="icon">
                            <ion-icon name="mail"></ion-icon>
                        </span>
                        <input type="email" id="email" required>
                        <label>EMAIL</label>
                    </div>

                    <div class="inputBox"> <!--input-box-->
                        <span class="icon">
                            <ion-icon name="key-outline"></ion-icon>
                        </span>
                        <input type="text" required>
                        <label>CERTIFICATION NUMBER</label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon">
                            <ion-icon name="lock-closed"></ion-icon>
                        </span>
                        <input type="password" id="password" required>
                        <label>PASSWORD</label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon">
                            <ion-icon name="checkmark-outline"></ion-icon>
                        </span>
                        <input type="password" id="password2" required>
                        <label>CHECK PW</label>
                    </div>

                    <div class="inputBox">  <!--input-box-->
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input type="text" id="nickname" required>
                        <label>USER</label>
                    </div>

                    <div class="inputBox busniessBox">  <!--busniess-box-->
                        <span class="icon">
                            <ion-icon name="business-outline"></ion-icon>
                        </span>
                        <input type="text" required>
                        <label>BUSINESS NUMBER</label>
                    </div>

                    <div class="rememberForgot">  <!--remember-forgot-->
                        <label><input type="checkbox"> Agree to the terms & conditions</label>
                        <a href="#" id="showBusiness">Business</a>
                        <a href="#" class="js-static-modal-toggle">Show terms & conditions</a>
              		</div>
					           
                    <button type="submit" class="btn">REGISTER</button>

                    <div class="loginRegister">   <!--login-register-->
                        <p>Already have an account? <a href="#" class="login-link">Login</a></p>
                    </div>

                </form>
            </div>
        </div>
    </section>
    
              
        <div id="static-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
              <h1>Terms Of Use</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">
              <p>
              Register to enjoy user-exclusive benefits
              </p>
              
					            <p>Google은 Google 서비스 사용자들이 신뢰를 바탕으로 정보를 제공한다는 것을 잘 알고 있습니다.
					             Google은 사용자의 신뢰에 대한 막중한 책임을 인지하며 최선을 다해 개인정보를 보호하고 사용자가 직접 제어할 수 있도록 노력하고 있습니다.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Agree</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>



    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

        	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   
   			<script src="${contextPath}/resources/js/LoginRegister.js"></script>

  </body>
</html>