<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/roomDetail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<title>예약실 상세</title>
</head>
<body>
<input type="hidden" value="${roomDetail.pricePerHour }" id="hiddenPricePerHour">
<input type="hidden" value="${roomDetail.pracRoomNo }" id="hiddenRoomNo">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<button type="button" onclick="chatStart(3)">3번 회원과 채팅해보기~</button>
	<input type="hidden" id="sessionNoForBookRoom" value="${sessionScope.loginUser.userNo}">
	<div class="content">
		<!-- left -->
		<div class="leftSide">
			<!-- 사진 영역 -->
			<div>
				<img src="${contextPath}/resources/images/pracRoom1.jpeg" id="pracImg">
			</div>
			<!-- 제목 영역 -->
			<div class="titleArea">
				<p>${roomDetail.pracRoomName }</p><br>
				<p>${roomDetail.region }</p>
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
						<div class="lineDiv"></div>
						${roomDetail.introMent }
					</div>
					<!-- 시설 안내 -->
					<div id="facility">
						<h1>시설 안내</h1>
						<div class="lineDiv"></div>
						${roomDetail.facilMent }
					</div>
					<!-- 유의 사항 -->
					<div id="warn">
						<h1>유의 사항</h1>
						<div class="lineDiv"></div>
						${roomDetail.warnningMent }
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
			<div class="roomDetailPhoto" id="roomDetailPhoto">
				<img src="${contextPath}/resources/images/band.jpg" id="detailImages">
			</div>
			<div class="picto" id="picto">
				<div class="eachPicto">
					<i class="fa-solid fa-burger"></i>
					<p>음식물 반입 허용</p>
				</div>
				<div class="eachPicto">
					<i class="fa-solid fa-ban-smoking"></i>
					<p>금연</p>
				</div>
				
				<div class="eachPicto">
					<i class="fa-solid fa-car-side"></i>
					<p>주차</p>
				</div>
				<div class="eachPicto">
					<i class="fa-solid fa-wifi"></i>
					<p>인터넷 사용 가능</p>
				</div>				
			</div>
			<div class="price-tag">
				<p style="font-size: 1.4em; margin:1em 0"> 이용 시간 </p>
				<p id="hoursOfUse"></p><br>
				<p style="font-size: 1.4em; margin: 1em 0;"> 가격 </p>
				<p id="totalPrice" style="font-size: 1.2em">원</p>
				
			</div>
			<div class="submitDiv">
				<!-- 정보 전송 버튼 -->
				<button type="button" id="timeSubmit">신청하기</button>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/roomDetail.js"></script>

</body>
</html>