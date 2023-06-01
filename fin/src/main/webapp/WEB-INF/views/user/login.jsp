<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>

	<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/login.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
	<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>


      <!--바디 부분 시작-->
      <body>
      <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <!--콘텐츠 작성 영역-->
        <section class="content">
          <h2 class="sign-in-text">
          <img src="#"  width="60px" height="60px"/>Band Archive</h2>
        </section>

        <section class="content-2">
          <!--로그인시 필요한 정보 기입 영역-->
          <form action="#" name= "sign-in-form">
            <fieldset id="sign-in-area">
              <section class="sign-in">

                <!--아이디-->
                <h1>아이디</h1>
                <fieldset id="id-area">
                  <i class="id-user"></i>
                  <input type="text" name="inputId" class="input-text" /><br />
                </fieldset>
                <br />

                <!--비밀번호-->
                <h1>비밀번호</h1>
                <fieldset id="pw-area">
                  <i class="pw-user"></i>
                  <input type="password" name="password" class="input-text"
                  /><br/><br/>
                </fieldset>
                <br/>

                <!-- 로그인 버튼-->
                <article class="signInBtn-article">
                  <button class="signInBtn">Login</button>
                </article>

                <!--비밀번호 찾기/ 아이디 찾기/ 회원가입 -->
                <article class="id-pw-found">
                  <a href="#" class="id-found">아이디/비밀번호 찾기 </a>|
                  <a href="#" class="id-found"> 일반회원</a>|
                  <a href="#" class="id-found"> 사업자회원</a>
                </article><br><hr>


              </section>
            </fieldset>


            <br/>

        
          </form>
        </section>
        	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	   <script src="${contextPath}/resources/js/login.js"></script>
   

  </body>
</html>