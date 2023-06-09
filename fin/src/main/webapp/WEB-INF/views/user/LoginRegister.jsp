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
               <div class="contents">
        <form action="/" method="POST" id="form__wrap">
          <div class="terms__check__all">
            <input type="checkbox" name="checkAll" id="checkAll" />
            <label for="checkAll"
              >BandArchive 이용약관, 개인정보 수신(선택)에 모두 동의합니다.</label
            >
          </div>
          <ul class="terms__list">
            <li class="terms__box">
              <div class="input__check">
                <input type="checkbox" name="agreement" id="termsOfService" value="termsOfService" required />
                <label for="termsOfService" class="required">BandArchive 이용약관 동의</label>
              </div>
              <div class="terms__content">
                BandArchive 여러분을 환영합니다.  서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 JUN
                서비스의 이용과 관련하여 서비스를 제공하는  주식회사(이하 ‘서비스’)와 이를 이용하는  서비스
                회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의  서비스 이용에 도움이 될 수 있는
                유익한 정보를 포함하고 있습니다. 서비스를 이용하시거나 서비스 회원으로 가입하실 경우 여러분은 본
                약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기
                바랍니다.
              </div>
            </li>
            <li class="terms__box">
              <div class="input__check">
                <input type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required />
                <label for="privacyPolicy" class="required">개인정보 수집 및 이용 동의</label>
              </div>
              <div class="terms__content">
                개인정보보호법에 따라 BandArchive에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및
                이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니
                자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색,
                뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페,
                블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을
                위해 필요한 최소한의 개인정보를 수집합니다.
              </div>
            </li>
            <li class="terms__box">
              <div class="input__check">
                <input type="checkbox" name="agreement" id="allowPromotions" value="allowPromotions" />
                <label for="allowPromotions"  class="required">정보 수신 동의</label>
              </div>
              <div class="terms__content">
                BandArchive에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(BandArchive앱 알림 또는 문자), 이메일로 받아보실 수
                있습니다. 일부 서비스(별도 회원 체계로 운영하거나 BandArchive 가입 이후 추가 가입하여 이용하는 서비스 등)의
                경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고
                동의를 받습니다.
              </div>
            </li>
          </ul>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Agree</button>
              </div>
        </form>
      </div>
    </div>
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