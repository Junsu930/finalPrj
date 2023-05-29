<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <header>
        <nav class="navBar">
          <div class="navDiv">
              <a href="" class="navA">Band Archive</a>
          </div>
          <ul class="navUl">
              <li><a href="" class="navA">Board</a></li>
              <li><a href="" class="navA">Reservations</a></li>
              <li><a href="" class="navA">Used</a></li>
              <li><a href="" class="navA">Lessons</a></li>
              <li><a href="room" class="navA">My Band</a></li>
          </ul>
          <div class="navSecondDiv">
              <a href="" class="signUpText navA">SignUp</a>
              <a href="" class="loginText navA">Login</a>
              <a href="" class="signUpIMG navA"><i class="bi bi-person-badge-fill" id="signUpIMGI"></i></a>
              <a href="" class="loginIMG navA"><i class="bi bi-door-open" id="loginIMGI"></i></a>
              <a href="" class="logoutIMG navA"><i class="bi bi-door-closed" id="logoutIMGI"></i></a> <!-- logout IMG-->
              <button class="light"><i class="bi bi-moon navA"  id="sun" ></i></button>
          </div>
          <!-- 반응형 메뉴 바  -> 평소에는 display : none -->
          <a href="#" id="hamburger"><i class="fa-solid fa-bars" id="toggle"></i></a>
        </nav>
      </header>
  <script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>