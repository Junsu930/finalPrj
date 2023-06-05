<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/findingMember.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

    <title>findingMember</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <br>
    <br>
    
    <button id="open-modal">모달 창 열기 버튼</button>
    
    <div id="modal">
  <div class="modal-content">
    <h2>모달창 제목</h2>
    <p>모달창 내용</p>
    <button id="close-modal">닫기</button>
 
 
   
   	<div id="modalWrap">
   		<div id="modalBody">
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
					<hr>
				  
	
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
					<hr>
	
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
					<hr>
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
	
					<hr>
					<br>
					<br>
				   
	
					<button id="find">숨은 나의 멤버 찾기</button>
					<a href="memberList">MemberList</a>
					<br>
					<br>
					<br>
					<br>
	
	
	
	
	
		
				</section>
		</section>
		</div>
	</div>		
	
	 </div>
</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script src="${contextPath}/resources/js/findingMember.js"></script>    
</body>
</html>