<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Footer</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footerbootStrap.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footerModal.css">
	<script src = "${contextPath}/resources/js/footerModal.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
</head>
<body>

    <footer>
        <div class="custom-shape-divider-bottom-1685198268">
            <!-- <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" class="shape-fill"></path>
            </svg> -->
        </div>
        
        <section class="footerSection">
          
            <section class="footerFirstSec">
                <div>
                    <span>Company</span>
                    <span>Information</span>
                    <span>Contact</span>
                    <span class="displayNone">(주) 기타치는 오리</span>
                </div>
            </section>

            <section class="footerSecSec">
                <div class="firstDiv">
                    <ul class="firstUl">
                        <li id="asd">대표 : 조미현</li>
                        <li>서비스명 : Band Archive</li>
                        <li>사업자 번호 : 120-87-1233043</li>
                        <li>통신 판매 : 제2023-서울강남-01234</li>
                        <li>작업정보제공 : J120000201900002</li>
                    </ul>
                </div>

                <div class="secondDiv">
                    <ul class="secondUl">
                        <li><a href="" class="footerA">공지사항</a></li>
                        <li><a href="#" class="footer2-modal-toggle">이용약관</a></li>
                        <li><a href="#" class="footer3-modal-toggle">개인정보처리방침</a></li>
                    </ul>
                </div>

                <div class="thirdDiv">
                    <ul class="thirdUl">
                        <li><i class="bi bi-envelope"></i>&nbsp;&nbsp; gosrod05@gmail.com</li></li>
                        <li><i class="bi bi-geo-alt"></i>&nbsp;&nbsp;서울시 강남구 테헤란로 12 3층</li></li>
                    </ul>
                </div>
            </section>
        
	        <section class="footerThirdSec">
	            <div class="socialdiv">
	                <ul class="forthUl">
	                    <li><i class="bi bi-envelope"></i></li>
	                    <li><i class="bi bi-instagram"></i></li>
	                    <li><i class="bi bi-twitter"></i></li>
	                </ul>
	            </div>
	        </section>
	        
	    <!-- 이용약관 -->
	    <div id="footer2-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
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
		            <label for="checkAll">BandArchive 이용약관, 매치정보</label>
		          </div>
			          <ul class="terms__list">
			            <li class="terms__box">
			              <div class="input__check">
			                <label for="termsOfService" class="required">이용약관 및 서비스 </label>
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
			                 <label for="privacyPolicy" class="required">개인정보 수집 및 이용 </label>
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
			                <label for="allowPromotions"  class="required">매치 정보</label>
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
			           <button type="button" class="btn btn-primary" data-dismiss="modal" id="agreebtn">Check</button>
			         </div>
			        </form>
			      </div>
			   </div>
              </div>
           </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
          
          
          <!-- 개인정보처리방침 -->
	    <div id="footer3-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
              <h1>Privacy Policy</h1>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
             </div>
              <div class="modal-body">
               <div class="contents">
		        <form action="/" method="POST" id="form__wrap">
		          <div class="terms__check__all">
		            <label for="checkAll">BandArchive 개인정보지침</label>
		          </div>
			          <ul class="terms__list">
			            <li class="terms__box">
			              <div class="input__check">
			                <label for="termsOfService" class="required">홈페이지 회원 가입 및 관리 </label>
			              </div>
			              <div class="terms__content">
			                회원 가입의사 확인 회원제 서비스 제공에 따른 본인 식별. 인증, 회원자격 유지 관리, 제한적 본인 확인제 시행에 
			                따른 본인확인, 서비스 부정이용방지, 만 14세 미만 아동의 개인정보처리시 법정대리인의 동의여부 확인, 각종 고지,통지 고충
			                처리등을 목적으로 개인정보를 처리합니다.
			              </div>
			            </li>
			            <li class="terms__box">
			              <div class="input__check">
			                 <label for="privacyPolicy" class="required">개인정보 수집 및 이용 </label>
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
			                <label for="allowPromotions"  class="required">개인정보의 처리 및 보유기간</label>
			              </div>
			              <div class="terms__content">
			                1. 회사는 법령에 따른 개인정보 보유, 이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유 이용기간 내에서
			                개인정보를 처리 보유합니다.
			                2. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
			                3. 재화 또는 서비스 제공하는데 민원인의 신원 확인, 사실조사를 위한 연락 통지, 처리결과를 통보 등의 목적으로 개인정보를 처리합니다.
			              </div>
			            </li>
			          </ul>
			         <div class="modal-footer">
			           <button type="button" class="btn btn-primary" data-dismiss="modal" id="agreebtn">Check</button>
			         </div>
			        </form>
			      </div>
			   </div>
              </div>
           </div><!-- /.modal-content -->
         </div><!-- /.modal-dialog -->
          

        </section>
        
  
    </footer>
    
    <script src="${contextPath}/resources/js/footer.js"></script>
</body>
</html>