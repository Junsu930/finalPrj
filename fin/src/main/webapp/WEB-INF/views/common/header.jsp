<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/header.css">
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@300&display=swap');
        dl, ol, ul {
            margin-top: 0;
            margin-bottom: 0;
            padding-left: 0;
        }
        body{
            line-height: normal;	
        }
        button, input, optgroup, select, textarea {
            font-family : revert;
            font-size: revert;
            line-height: inherit;
        }
    
        p{
            margin-bottom: 0;
        }
        
        /* a:hover {
        color: revert;
        } */
    </style>
</head>
<body>
    <header>
        <nav class="navBar">
          <div class="navDiv">
              <a href="${contextPath}/main" class="navA">Band Archive</a>
          </div>
          <ul class="navUl">
              <li><a href="${contextPath}/board" class="navA">Board</a></li>
              <li><a href="${contextPath}/room" class="navA">Reservations</a></li>
              <li><a href="${contextPath}/used" class="navA">Used</a></li>
              <li><a href="${contextPath}/lesson" class="navA">Lessons</a></li>
              <li><a href="${contextPath}/findingMember" class="navA">Searching</a></li>

          </ul>
          <div class="navSecondDiv">

            <!-- <a href="signUp" class="signUpText navA">SignUp</a> -->
            <a href="${contextPath}/checkPw" class="myPageText navA">My Page</a>
            <c:choose>
            <c:when test="${ empty sessionScope.loginUser }"> 
                <a href="${contextPath}/login" class="loginText navA">Login</a>
            </c:when>
            <c:otherwise>
                <a href="${contextPath}/logout" class="loginText navA">Logout</a>
            </c:otherwise>
            </c:choose>
            <button id="alertBell" class="alertBell navA" onclick="showAlertView()"><i class="bi bi-bell"></i></button> <!-- 로그인 시 알림 아이콘-->
            <button id="msgBoxOpen" class="msgBoxOpen navA" onclick="showMessageView()"><i class="fa-regular fa-paper-plane"></i></button> <!-- 로그인 시 쪽지 아이콘 -->
        
            <a href="" class="signUpIMG navA"><i class="bi bi-person-badge-fill" id="signUpIMGI"></i></a> <!-- myPageIMG 임 signUPUMG가 아님 signUP 페이지가 사라지고 로그인 페이지에서 다돼기 때문에-->
            <a href="" class="loginIMG navA"><i class="bi bi-door-open" id="loginIMGI"></i></a>
            <a href="" class="logoutIMG navA"><i class="bi bi-door-closed" id="logoutIMGI"></i></a> <!-- logout IMG-->
            <button class="light"><i class="bi bi-moon navA" id="sun"></i></button>

            <!-- 알림 창 -->
            <ul class="wrapperUl">
                <h1>Latest Post</h1>
                <li>
                    <div class="date">
                        <h3>Mar<br><span>03</span></h3>
                    </div>
                    <a href="#none">
                        <p>깅깅님께서 회원님의 게시글 좋아요를 눌렀습니다!</p>
                    </a>
                </li>

                <li>
                    <div class="date">
                        <h3>Mar<br><span>03</span></h3>
                    </div>
                    <a href="#none">
                        <p>깅깅님께서 회원님의 게시글 댓글을 달았습니다!</p>
                    </a>
                </li>

                <li>
                    <div class="date">
                        <h3>Mar<br><span>03</span></h3>
                    </div>
                    <a href="#none">
                        <p>깅깅님께서 회원님에게 수강 신청을 하였습니다!</p>
                    </a>
                </li>

                <li>
                    <div class="date">
                        <h3>Mar<br><span>03</span></h3>
                    </div>
                    <a href="#none">
                        <p>깅깅님께서 회원님의 연습실 예약 신청을 했습니다!</p>
                    </a>
                </li>
            </ul>
          </div>
          
          
          <!-- 쪽지 확인  -->
          
          <ul class="messageUlBox">
	        <h1>Message Box</h1>
	        <li>
	            <div class="messageDate">
	                <h3>Mar<br><span>03</span></h3>
	            </div>
	            <a href="msgBoxPage">
	                <p>깅깅님께서 회원님에게 쪽지를 보냈습니다!<br>지금 확인하세요!</p>
	            </a>
	        </li>
	
	        <li>
	            <div class="messageDate">
	                <h3>Mar<br><span>03</span></h3>
	            </div>
	            <a href="#none">
	                <p>깅깅님께서 회원님에게 쪽지를 보냈습니다!<br>지금 확인하세요!</p>
	            </a>
	        </li>
	
	        <li>
	            <div class="messageDate">
	                <h3>Mar<br><span>03</span></h3>
	            </div>
	            <a href="#none">
	                <p>깅깅님께서 회원님에게 쪽지를 보냈습니다!<br>지금 확인하세요!</p>
	            </a>
	        </li>
	
	        <li>
	            <div class="messageDate">
	                <h3>Mar<br><span>03</span></h3>
	            </div>
	            <a href="#none">
	                <p>깅깅님께서 회원님에게 쪽지를 보냈습니다!<br>지금 확인하세요!</p>
	            </a>
	        </li>
	
	        <li>
	            <div class="messageDate">
	                <h3>Mar<br><span>03</span></h3>
	            </div>
	            <a href="#none">
	                <p>깅깅님께서 회원님에게 쪽지를 보냈습니다!<br>지금 확인하세요!</p>
	            </a>
	        </li>
   		 </ul>
          
          
          
          
          <!-- 반응형 메뉴 바  -> 평소에는 display : none -->
          <a href="#" id="hamburger"><i class="fa-solid fa-bars" id="toggle"></i></a>
        </nav>








       
        
      </header>
    <script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>