<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/roomDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<title>예약실 상세</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="content">
		<!-- left -->
		<div class="leftSide">
			<!-- 사진 영역 -->
			<div>
				<img src="${contextPath}/resources/images/pracRoom1.jpeg" id="pracImg">
			</div>
			<!-- 제목 영역 -->
			<div class="titleArea">
				<p>잉잉 연습실</p><br>
				<p>경기도 의정부시</p>
			</div>
			<!-- 소개 영역 -->
			<div class="introduction">
				<div>
					<ul>
						<li><a href="#space">공간소개</a></li>
						<li><a href="#facility">시설안내</a></li>
						<li><a href="#warn">유의사항</a></li>
					</ul>
				</div>
				<div class="introContent">
					<!-- 공간 소개 -->
					<div id="space">
						<h1>공간 소개</h1>
						<hr>
						<p>
						
						
	서초역 도보 5분거리 24시간 음악연습실입니다<br>
	각방 에어컨, 제습기, 공기청정기, 환풍기, 전기히터, 도어락 등이 설치되어 있어 굉장히 쾌적하며 <br>
	고급방음소재 사용으로 만족도가 매우 높은 연습실입니다<br><br>
	
	작은방부터 대형방까지 크기 다양하며, 가성비 매우 좋습니다<br><br>
	
	- 위치 : 서초역 도보 5분거리 <br>
	- 방음 : 고급 방음 재료 사용 <br>
	- 파트 : 드럼, 관악기를 제외한 전파트<br>
	- 인터넷 : 기가 인터넷<br>
	- 습기 및 환기 : 각방 에어컨 설치, 각방 환풍기, 각방 전기히터, 중앙 복도 환풍시설, <br>
	중앙 실링팬 설치 공기정화에 좋은 식물 관리<br>
	- 보안 : CCTV 24시간 녹화 및 서버 저장. 각 방 도어락 설치<br>
	- 연습실 건물이 상가건물이라 24시간 사용 가능하며, 주변 맥도날드, 롯데슈퍼, 커피전문점 등 환경 좋습니다.<br>
						</p>
					</div>
					<!-- 시설 안내 -->
					<div id="facility">
						<h1>시설 안내</h1>
						<hr>
						<p>
						
						
	서초역 도보 5분거리 24시간 음악연습실입니다<br>
	각방 에어컨, 제습기, 공기청정기, 환풍기, 전기히터, 도어락 등이 설치되어 있어 굉장히 쾌적하며 <br>
	고급방음소재 사용으로 만족도가 매우 높은 연습실입니다<br><br>
	
	작은방부터 대형방까지 크기 다양하며, 가성비 매우 좋습니다<br><br>
	
	- 위치 : 서초역 도보 5분거리 <br>
	- 방음 : 고급 방음 재료 사용 <br>
	- 파트 : 드럼, 관악기를 제외한 전파트<br>
	- 인터넷 : 기가 인터넷<br>
	- 습기 및 환기 : 각방 에어컨 설치, 각방 환풍기, 각방 전기히터, 중앙 복도 환풍시설, <br>
	중앙 실링팬 설치 공기정화에 좋은 식물 관리<br>
	- 보안 : CCTV 24시간 녹화 및 서버 저장. 각 방 도어락 설치<br>
	- 연습실 건물이 상가건물이라 24시간 사용 가능하며, 주변 맥도날드, 롯데슈퍼, 커피전문점 등 환경 좋습니다.<br>
						</p>
					</div>
					<!-- 유의 사항 -->
					<div id="warn">
						<h1>유의 사항</h1>
						<hr>
						<p>
						
						
	서초역 도보 5분거리 24시간 음악연습실입니다<br>
	각방 에어컨, 제습기, 공기청정기, 환풍기, 전기히터, 도어락 등이 설치되어 있어 굉장히 쾌적하며 <br>
	고급방음소재 사용으로 만족도가 매우 높은 연습실입니다<br><br>
	
	작은방부터 대형방까지 크기 다양하며, 가성비 매우 좋습니다<br><br>
	
	- 위치 : 서초역 도보 5분거리 <br>
	- 방음 : 고급 방음 재료 사용 <br>
	- 파트 : 드럼, 관악기를 제외한 전파트<br>
	- 인터넷 : 기가 인터넷<br>
	- 습기 및 환기 : 각방 에어컨 설치, 각방 환풍기, 각방 전기히터, 중앙 복도 환풍시설, <br>
	중앙 실링팬 설치 공기정화에 좋은 식물 관리<br>
	- 보안 : CCTV 24시간 녹화 및 서버 저장. 각 방 도어락 설치<br>
	- 연습실 건물이 상가건물이라 24시간 사용 가능하며, 주변 맥도날드, 롯데슈퍼, 커피전문점 등 환경 좋습니다.<br>
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- right -->
		<div class="rightSide">
			<!-- 달력 -->
			<div class="calDiv">
				<div>
					<p>시간 예약</p>
				</div>
				<div id="calendar"></div>
			</div>
			<div class="days">
				<div id="schedule"></div><br>
				<div class="timeline" id="timeline">
					<button type="button" class="times" value="09">09:00</button>
					<button type="button" class="times" value="10">10:00</button>
					<button type="button" class="times" value="11">11:00</button>
					<button type="button" class="times" value="12">12:00</button>
					<button type="button" class="times" value="13">13:00</button>
					<button type="button" class="times" value="14">14:00</button>
					<button type="button" class="times" value="15">15:00</button>
					<button type="button" class="times" value="16">16:00</button>
					<button type="button" class="times" value="17">17:00</button>
					<button type="button" class="times" value="18">18:00</button>
					<button type="button" class="times" value="19">19:00</button>
					<button type="button" class="times" value="20">20:00</button>
					<button type="button" class="times" value="21">21:00</button>
					<button type="button" class="times" value="22">22:00</button>
					<button type="button" class="times" value="23">23:00</button>
					<button type="button" class="times" value="24">24:00</button>
				</div>
			</div>
			<div class="submitDiv">
				<!-- 정보 전송 버튼 -->
				<button type="button" id="timeSubmit">신청하기</button>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/chatting/chatting.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/roomDetail.js"></script>
</body>
</html>