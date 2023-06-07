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
              <a href="${contextPath}/main" class="navA">Band Archive</a>
          </div>
          <ul class="navUl">
              <li><a href="" class="navA">Board</a></li>
              <li><a href="room" class="navA">Reservations</a></li>
              <li><a href="used" class="navA">Used</a></li>
              <li><a href="lesson" class="navA">Lessons</a></li>
              <li><button id="open-modal">모달 창 열기 버튼</button></li>
              

          </ul>
          <div class="navSecondDiv">
              <!-- <a href="signUp" class="signUpText navA">SignUp</a> -->
              <a href="${contextPath}/myPage" class="myPageText navA">My Page</a>
              <a href="login" class="loginText navA">Login</a>
			  <button id="alertBell" class="alertBell navA"><i class="bi bi-bell"></i></button> <!-- 로그인 시 알림 아이콘-->
              <a href="" class="signUpIMG navA"><i class="bi bi-person-badge-fill" id="signUpIMGI"></i></a>
              <a href="" class="loginIMG navA"><i class="bi bi-door-open" id="loginIMGI"></i></a>
              <a href="" class="logoutIMG navA"><i class="bi bi-door-closed" id="logoutIMGI"></i></a> <!-- logout IMG-->
              <button class="light"><i class="bi bi-moon navA" id="sun"></i></button>
          </div>
          <!-- 반응형 메뉴 바  -> 평소에는 display : none -->
          <a href="#" id="hamburger"><i class="fa-solid fa-bars" id="toggle"></i></a>
        </nav>
        
        <!-- 멤버 찾기 모달 -->
        <div id="modal">
  		<div class="modal-content">
    	<button id="close-modal">닫기</button>
 

    	<section class="title">
		<br>
		<br>
				<p id="tt">Find your band companion</p>
			   
				<section class="mainContent">
				
					<!--성별-->
					<div class="gender">
						 <p class="cate">Gender</p>
						 <input type="radio" id="male" name="gender"><label for="male">남자</label>
						 <input type="radio" id="female" name="gender"><label for="female">여자</label>
					</div>
		
					<br>
					<hr class="hr">
				  
	
					<!--장르-->
					<div class="genre">
						 <p class="cate">Genre</p>
						 <input type="checkbox" id="electronic" name="genre"><label for="electronic">ELECTRONIC</label>
						 <input type="checkbox" id="rock" name="genre"><label for="rock">ROCK</label>
						 <input type="checkbox" id="folk" name="genre"><label for="folk">FOLK</label>
						 <input type="checkbox" id="pop" name="genre"><label for="pop">POP</label>
						 <input type="checkbox" id="R&B" name="genre"><label for="R&B">R&B</label>
						 <input type="checkbox" id="jazz" name="genre"><label for="jazz">JAZZ</label>
						 <input type="checkbox" id="metal" name="genre"><label for="metal">METAL</label>
					</div>
	
					<br>
					<hr class="hr">
	
					<!--포지션-->
					<div class="position">
						<p class="cate">Position</p>
						<input type="radio" id="guitar" name="position"><label for="guitar">Guitar</label>
						<input type="radio" id="bass" name="position"><label for="bass">Bass</label>
						<input type="radio" id="drum" name="position"><label for="drum">Drum</label>
						<input type="radio" id="vocal" name="position"><label for="vocal">Vocal</label>
						<input type="radio" id="keyboard" name="position"><label for="keyboard">Keyboard</label>
						<input type="radio" id="brass/horn" name="position"><label for="brass/horn">Brass/Horn</label>
					</div>
					<br>
					<hr class="hr">
					<!--지역-->
					<div class="location">
						<p class="cate">Location</p>
						<input type="radio" id="seoul" name="location"><label for="seoul">서울</label>
						<input type="radio" id="gyeonggi" name="location"><label for="gyeonggi">경기도</label>
						<input type="radio" id="incheon" name="location"><label for="incheon">인천</label>
						<input type="radio" id="daejeon" name="location"><label for="daejeon">대전</label>
						<input type="radio" id="daegu" name="location"><label for="daegu">대구</label>
						<input type="radio" id="busan" name="location"><label for="busan">부산</label>
						<input type="radio" id="ulsan" name="location"><label for="ulsan">울산</label>
						<input type="radio" id="sejong" name="location"><label for="sejong">세종</label>
						<input type="radio" id="gwangju" name="location"><label for="gwangju">광주</label>
						<input type="radio" id="N-chungcheong" name="location"><label for="N-chungcheong">충청북도</label>
						<input type="radio" id="S-chungcheong" name="location"><label for="S-chungcheong">충청남도</label>
						<input type="radio" id="N-gyeongsang" name="location"><label for="N-gyeongsang">경상북도</label>
						<input type="radio" id="S-gyeongsang" name="location"><label for="S-gyeongsang">경상남도</label>
						<input type="radio" id="gangwon" name="location"><label for="gangwon">강원도</label>
						<input type="radio" id="N-jeolla" name="location"><label for="N-jeolla">전라북도</label>
						<input type="radio" id="S-jeolla" name="location"><label for="S-jeolla">전라남도</label>
						<input type="radio" id="jeju" name="location"><label for="jeju">제주도</label>
					<br>
					</div>
	
					<hr class="hr">
					<br>
					<br>
				   
	
					<button id="find"><a href="memberList">숨은 나의 멤버 찾기</a></button>
					<br>
					<br>
					<br>
					<br>
		
				</section>
			</section>
	 		</div>
		</div>
        
      </header>
  <script src="${contextPath}/resources/js/header.js"></script>
</body>
</html>