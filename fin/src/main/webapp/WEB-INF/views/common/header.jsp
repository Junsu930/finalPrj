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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
        }  */
        
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
              <li><a href="${contextPath}/room" class="navA">Reservation</a></li>
              <li><a href="${contextPath}/used" class="navA">Used</a></li>
              <li><a href="${contextPath}/lesson" class="navA">Lesson</a></li>
              <li><a href="${contextPath}/findingMember" class="navA">Searching</a></li>

          </ul>
          <div class="navSecondDiv">

            <c:choose>
            	<c:when test="${empty sessionScope.loginUser}"> 
                	<a href="${contextPath}/login" class="loginText navA" id="logintext">Login</a>
                    <!-- <a href="${contextPath}/login" class="loginIMG navA"><i class="bi bi-door-open" id="loginIMGI"></i></a> -->
            	</c:when>
                <c:otherwise>
                    

                    <!-- <a href="${contextPath}/checkPw" class="myPageText navA">My Page</a>
                    <a href="${contextPath}/logout" class="loginText navA">Logout</a> -->

                    <button type="button" id="alertBell" class="alertBell navA">
                        <i class="bi bi-bell" id="alertBellImg"></i>
                        <p id="alarmCount"></p>
                    </button> <!-- 로그인 시 알림 아이콘-->

                            <!-- 알림 창 -->
                    <ul class="wrapperUl">
                        <h1>Latest Post</h1>
                        <!-- <li>
                            <div class="date">
                                <h3>Mar<br><span>03</span></h3>
                            </div>
                            <a href="#none">
                                <p>깅깅님께서 회원님의 게시글 좋아요를 눌렀습니다!</p>
                                <span id="reserveDate">신청날짜 : Jun &nbsp;24일</span>
                            </a>
                        </li> -->
                    </ul>
                    
                    <button type="button" id="msgBoxOpen" class="msgBoxOpen navA">
                        <i class="fa-regular fa-paper-plane"></i>
                        <p id="msgAlarmCount"></p>
                    </button> <!-- 로그인 시 쪽지 아이콘 -->

                                <!-- 쪽지 확인  -->
                    <ul class="messageUlBox">
                        <h1>Message Box</h1>
                        <!-- <li class="wrapperLi"> -->
                            <!-- <div class="messageDate">
                                <h3>
                                    <br>
                                    <span></span>
                                </h3>
                            </div>
                            <a href="msgBoxPage" class="messageUserBox">
                                <p></p>
                            </a> -->
                        <!-- </li> -->
                    </ul>

                    <div class="profileImgBox" onclick="activeMenu()">
                        <img src="${contextPath}/resources/images/guitarduck.png" alt="" id="profileImg">
                    </div>
        
                    <div class="menu">
                        <ul>
                            <li>
                                <a href="${contextPath}/checkPw" class="myPageText navA">
                                    <i class="bi bi-person-badge-fill" id="signUpIMGI"></i>
                                    My Page
                                </a>
                            </li>
                            <li>
                                <a href="${contextPath}/logout" class="logoutText navA">
                                    <i class="bi bi-door-closed" id="logoutIMGI"></i>
                                    LogOut
                                </a>
                            </li>
                        </ul>
                    </div>

                    <!-- <a href="${contextPath}/checkPw" class="myPageIMG navA"><i class="bi bi-person-badge-fill" id="myPageIMGI"></i></a>
                    myPageIMG 임
                    <a href="${contextPath}/logout" class="logoutIMG navA"><i class="bi bi-door-closed" id="logoutIMGI"></i></a>
                    logout IMG -->
                </c:otherwise>
            </c:choose>
            <button type="button" class="light"><i class="bi bi-moon navA" id="sun"></i></button>
          </div>
          <!-- 반응형 메뉴 바  -> 평소에는 display : none -->
          <a href="#" id="hamburger"><i class="fa-solid fa-bars" id="toggle"></i></a>
          <input type="hidden" value="${loginUser}" id="hiddenUser">
        </nav>       
      </header>
    <script src="${contextPath}/resources/js/header.js"></script>
    
</body>
</html>