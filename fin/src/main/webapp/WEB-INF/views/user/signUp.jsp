<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>

	<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/signUp.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
	<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

    <main>
    
         <jsp:include page="/WEB-INF/views/common/header.jsp"/>


        <body>
            <!--콘텐츠 작성 영역-->
            <section class="content">
                <h1 class="sign-up-text">회원가입</h1>
            </section>

            <section class="content-2">
                <!--회원가입시 필요한 정보 기입 영역-->
                <form action="#" name="sign-up-form">
                    <fieldset id="sign-up-area">

                        <section class="sign-up-1">

                            <!--이메일--> 
                            아이디<br><input type="email" name="email" class="input-text" placeholder="아이디를 입력해주세요.">
                            <button id="email-check-btn">인증번호받기</button><br><br>

                             <!--이메일 인증번호 확인--> 
                             인증번호<br><input type="text" name="auth_number" class="input-text" placeholder="인증번호를 입력해주세요.">
                             <button id="email-check-btn">인증번호 확인</button><br><br>

                            <!--비밀번호-->
                            비밀번호<br><input type="password" input name="password" id="pw1" class="input-text-1" placeholder="비밀번호를 영문/숫자/특수 문자 중 2개 이상 사용해 입력해주세요."><br>
                                    <span id = "result1" class="confirm"></span><br>
                            비밀번호 확인<br><input type="password" input name="password-check" id="pw2" class="input-text-1" placeholder="비밀번호를 확인해주세요."><br>
                                    <span id = "result2" class="confirm"></span><br>
                            <!--닉네임-->
                            닉네임<br><input type="text" name="Nickname" class="input-text-1" placeholder="닉네임을 입력해주세요.">
                            <br><br><br>

                            <!--포지션-->
                            나의 포지션
                            <button id='hide' onclick="mainContent()">show</button>
                             <section class="mainContent">
            
               

                            <div class ="checkbox_group" >
                                <input type="checkbox" id="check_all" name="checkall" onclick="checkall">
                                <label for ="check_all">전체 동의</label><br>

                                <input type="checkbox" id="check_1" class="normal" name="check" onclick="checkSelectAll">
                                <label for="check_1">[필수] 이용약관 동의</label><br>

                                <input type="checkbox" id="check_2" class="normal" name="check" onclick="checkSelectAll">
                                <label for="check_2">[필수] 개인정보 이용 동의</label><br>

                                <input type="checkbox" id="check_3" class="normal" name="check" onclick="checkSelectAll">
                                <label for="check_3">[필수] 14세이상입니다</label>
                            </div>
							
							
            
                    
                            <article class="sign-up-article-1">
                                <button type="submit" id="signup-btn">회원가입</button><br>
                            </article >
                       
                        </section>       
                     
                    </fieldset>
                    
                </form>

            </section>

				<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

           <script src="${contextPath}/resources/js/signUp.js"></script>
                        
</body>
        
    </main>

</html>