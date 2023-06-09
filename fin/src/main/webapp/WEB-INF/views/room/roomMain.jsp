<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/roomMain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<title>예약페이지</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/profile/lookProfile.jsp"/>

<a href="${contextPath}/usedWriting">중고글 작성</a>
<div  data-bs-toggle="modal" data-bs-target="#exampleModal" id="toModalDiv" style="cursor: pointer;">
	<input type="hidden" value="1" id="hiddenUserNo">
	<span>프로필보기 넘어가기</span>
</div>
<div class="content" id="content">



	<div class="resrSvgBox">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1361 768">
            <g id="reservationBack">
              <path class="reservationPath" d="m0,617c24.57-2.49,62.01-5.51,108-6,36.65-.39,56.3,1.07,102,2,0,0,49.87.79,123,0,4.92-.05,17.03-.2,33-1,13.06-.66,24.45-1.23,39-3,12.83-1.56,23.22-3.71,44-8,29.29-6.05,36.27-8.61,39-15,2.23-5.23,1.08-11.77-2-16-4.61-6.33-12.97-6.69-20-7-7.23-.32-17.14-.75-22,6-3.52,4.88-3.25,11.94-1,17,4.25,9.54,16.01,12.98,31,16,31.76,6.41,57.71,6.87,69,7,27.13.31,40.69.47,60-1,3.79-.29,30.28-2.41,64-10,7.29-1.64,22.12-5.16,38-15,14.25-8.83,18.25-15.88,19-22,.18-1.5.77-6.29-2-9-3.44-3.37-10.41-.54-24,5-26.65,10.87-34.92,14.66-45,20-5.15,2.73-11.25,6.11-18,12-5.39,4.7-8.45,6.63-8,8,.33,1.02,2.3,2.23,40-4,11.95-1.98,17.55-3.06,21-8,4.02-5.76,2.59-13.13,2-16-2.64-12.74-12.08-19.05-26-31-25.15-21.59-18.53-21.73-41-40-17.54-14.27-24.17-16.29-27-26-3.64-12.51,2.79-24.89,7-33,8.3-15.98,19.54-25.08,28-32,30.92-25.3,54.64-46.15,57-48,11.02-8.64,21.81-17.58,33-26,7.27-5.47,15.84-11.75,26-22,3.85-3.88,8.91-9.33,14-17,5.76-8.68,8.64-13.02,9-19,.27-4.53-1.08-5.96-8-23-6.04-14.87-6.56-17.59-6-21,1.01-6.1,4.85-10.38,9-15,8.31-9.26,15.73-11.49,15-14-.56-1.9-5.03-1.31-19-3-6.91-.84-5.91-.99-14-2-9.09-1.13-16.09-1.65-21-2-7.28-.53-12.45-.9-19-1-9.94-.15-17.31.41-25,1-9.99.76-20.09.49-30,2-1.86.28-4.71.75-5,0-.52-1.36,7.58-6.17,15-9,7.44-2.84,14.08-3.63,23-4,17.45-.73,31,.68,34,1,23.74,2.56,42.23,7.65,47,9,13.81,3.91,16.29,5.79,28,8,6.7,1.27,5.08.5,30,2,.42.03,4.27.26,9-1,3.18-.85,5.45-1.45,6-3,1.05-2.99-4.78-8.15-10-11-5.48-2.99-10.23-3.4-18-4-17.21-1.32-25.81-1.98-30-2-10.74-.06-19.52.55-26,1-5.51.38-4.16.39-12,1-30.81,2.38-30.55.56-38,3-3.1,1.02-5.82,2.2-7,1-1.17-1.19-.37-4.23,6-16,4.56-8.43,6.96-12.06,11-19,8.8-15.12,7.99-16.11,11-18,5.93-3.73,13.37-2.2,28,1,13.59,2.97,12.2,4.95,24,7,10.27,1.78,15.42,1.02,18,5,1.74,2.69,1.16,6.46,0,14-.9,5.85-1.64,5.96-3,13-1.81,9.38-.88,11.21-3,13-1.86,1.57-3.73,1.13-14,1-3.33-.04-6.67.03-10,0-12.26-.12-14.28.76-29,1-7.94.13-7.3-.12-15,0-7.34.12-14.68,1.5-22,1-2.13-.15-4.3-.38-6,1-.96.78-2.37,2.55-2,11,.28,6.35.42,9.64,2,14,1.22,3.36,4.15,7.24,10,15,3.88,5.14,5.68,7.09,8,9,3.17,2.61,5.61,4.61,9,5,5.07.58,9.14-2.8,13-6,5.06-4.2,7.67-8.58,12-16,2.81-4.81,5.97-10.23,5-11-1.04-.83-6.72,3.85-11,9-5.7,6.86-5.13,9.99-11,18-4.08,5.57-8.62,11.75-13,11-4.52-.78-4.79-8.25-11-10-2.95-.83-5.36.15-8,1-.4.13-7.93,1.08-23,3-10.22,1.3-12.9.9-34,2-13.58.71-10.27.76-31,2-47.99,2.87-38.88.99-45,2-7.85,1.3-13.55,2.86-20,0-2.95-1.31-6.25-3.62-14-7-5.7-2.48-6.98-2.57-8-2-2.6,1.44-2.07,6.96-1,18,.43,4.5,1.12,9.17,4,14,.96,1.61,2.54,4.25,4,4,2.24-.38,2.79-7.32,3-10,.34-4.36.83-8.73-1-14-1.76-5.07-2.4-5.83-3-6-1.68-.48-4.06,1.01-5,3-1.28,2.7,1.01,4.41,2,11,.66,4.4-.09,5.37,1,7,2.06,3.07,7.13,3.94,11,3,4.06-.99,4.59-3.46,9-6,4.01-2.31,7.38-2.46,13-3,7.37-.71,14.63-2.3,22-3,10.64-1.02,23.76-3.01,50-7,.37-.06,8.76-1.74,19-3,2.7-.33,7.22-.84,13-1,2.13-.06,3.75-.04,7,0,1.6.02,6.36.09,12,1,1.24.2,3.19.55,5,2,.56.45,2.31,1.86,2,3-.26.96-1.76,1.04-6,2-4.36.99-4.1,1.21-8,2-.74.15-1.56.3-6,1-7.46,1.17-8.36,1.23-13,2-3,.5-3.44.61-6,1-4.76.73-4.45.55-7,1-5.07.9-5.57,1.51-7,1-2.61-.94-4.75-4.35-4-7,.58-2.06,2.71-3.02,5-4,4.05-1.74,7.1-1.6,13-2,3.34-.22,6.67-.67,10-1,7.84-.77,6.96-.46,10-1,5.97-1.06,6.35-2.27,10-2,2.5.18,4.25.89,7,2,1.96.79,2.6,1.26,3,2,.85,1.57.3,3.85-1,5-.78.69-1.55.73-3,1-3.48.64-3.16,1.13-7,2-3.38.76-3.18.28-7,1-3.81.72-4.02,1.21-8,2-3.07.61-3.51.43-7,1-4.63.75-5.33,1.3-9,2-3.89.75-4.38.37-13,1-5.17.38-4.28.46-11,1-8.04.65-8.19.44-14,1-6.04.58-6.23.84-10,1-3.61.15-3.45-.08-10,0-3.14.04-5.36.12-9,0-5.42-.18-6.3-.56-7-1-2.86-1.8-2.9-4.84-5-5-1.24-.09-2.55.88-3,2-.6,1.48.38,3.02,1,4,1.4,2.21,3.49,3.37,5,4,4.05,1.68,7.86,1.15,9,1,6.64-.9,13.39-.89,20-2,1-.17.34-.04,22-2,3.67-.33,7.4-.22,11-1,1.72-.37,3.4-.85,5,0,1.86,1,2.27,3.1,3,5,1.29,3.39,2.94,4.45,7,9,5.8,6.49,5.54,7.78,16,21,3.24,4.1,5.07,5.95,9,11,2.07,2.67,3.79,5,6,8,2.87,3.91,5.54,7.63,10,11,1.64,1.24,2.69,1.8,4,2,1.49.23,3.6.03,8-3,3.66-2.52,5.1-4.37,9-8,2.69-2.5,3.12-2.66,7-6,4.61-3.97,5.87-5.36,14-13,8.29-7.78,12.43-11.68,15-14,1.87-1.69,5.6-5.04,10-10,4.68-5.28,5.54-7.23,6-9,.16-.62,1.72-7.06-2-12-1.49-1.98-3.32-2.98-7-5-1.73-.95-3.91-2.13-7-3-.95-.27-4.77-1.29-10-1-3.79.21-8.11.45-12,3-3.1,2.03-2.66,3.38-8,11-4.63,6.6-5.52,6.39-9,12-.24.39-1.83,3.26-5,9,0,0-1.64,2.96-6,10-2.59,4.17-3.06,4.76-4,5-2.73.68-5.77-2.54-10-7-2.79-2.95-2.6-3.3-6-7-2.11-2.3-2.13-2.1-7-7-5.83-5.86-5.37-5.71-7-7-2.5-1.98-3.9-2.59-6-5-.91-1.04-1.71-2.15-2-2-.39.21.35,2.49,1,4,.55,1.28,1.39,2.84,4,6,1.13,1.37,3.81,4.52,8,8,2.16,1.8,2.62,1.94,3,2,2.41.4,4.31-1.76,9-6,1.29-1.17,4.11-3.71,7-6,4.08-3.23,4.2-2.69,10-7,3.3-2.45,4.34-3.42,7-5,.02-.01,0,0,6-3,2.67-1.33,4-2,4-2,.91-.62,1.63-1.23,2-1,.54.33.03,1.89,0,2-.54,1.65-1.76,2.34-4,4-2.2,1.63-1.04.98-5,4-2.32,1.77-2.26,1.65-4,3-3.09,2.4-3.16,2.7-5,4-1.9,1.34-1.9,1.06-5,3-2.73,1.71-3.1,2.14-6,4-1.81,1.15-3.11,1.91-5,3-4.05,2.34-5.23,2.82-9,5,0,0-2.16,1.25-5,3-15.81,9.76-40,38-40,38-7.28,8.5-16.86,19.7-29,35-8.14,10.26-13.99,18.02-20,26-7.79,10.34-11.77,15.64-16,22-7.51,11.3-5.25,9.48-14,23-5.71,8.82-7.39,10.71-8,15-.75,5.26.66,10.34,6,20,8.1,14.64,16.78,24.51,19,27,2.02,2.27,11.04,10.88,29,28,9.7,9.25,14.64,13.95,19,18,7.37,6.83,8.88,8.07,14,13,8.92,8.59,16,16,16,16,11.47,12,12.04,13.81,16,15,6.4,1.92,12.17-.64,22-5,2.93-1.3,3.15-1.62,23-15,7.48-5.04,9.4-6.31,10-9,1.09-4.9-3.25-9.98-12-18-13.95-12.78-21.26-16.69-34-27-4.97-4.03-.86-1-24-22-14.13-12.82-18.61-16.62-21-24-3.11-9.59-.33-18.52,1-23,1.87-6.3,4.04-8.83,16-27,6.55-9.95,9.83-14.93,11-17,6.42-11.35,12.09-21.66,12-35-.03-5.16-.2-13.37-6-19-3.37-3.27-7.45-4.53-9-5-3.4-1.05-9.84-2.2-11,0-.78,1.5,1.17,3.96,2,5,3.8,4.79,9.2,6.41,11,7,8.98,2.96,20.18,10.63,24,20,2.25,5.51,1.7,11.01,1,18-.47,4.68-1.37,8.01-3,14-2.62,9.64-3.8,10.57-6,19-1.17,4.48-2.48,9.49-3,16-.14,1.75-.77,10.4,1,19,2.85,13.85,10.96,22.8,22,35,9.66,10.67,18.59,17.7,23,21,6.13,4.59,12.19,8.45,34,20,17.2,9.11,25.8,13.67,33,17,35.56,16.45,67.9,19.64,112,24,0,0,15.8,1.56,48-2,13.78-1.52,21.53-3.23,23-8,1.91-6.22-7.93-14.14-9-15-2.53-2.04-9.09-7.32-15-5-2.9,1.14-5.55,4.07-6,7-1.54,10.1,22.93,21.66,30,25,33.42,15.79,65.27,17.59,95,19,64.75,3.07,107,4,107,4,64.21,1.41,86.98,1.12,95,1,34.67-.53,60.61-1.94,77-3,10.92-.71,20.15-1.43,27-2"/>
            </g>
        </svg>
    </div>
	
	</div>
	<!-- 임시 회원 기능 설정 -->
	<form action="${contextPath}/tempUserSession" method="post">
		<div id="first-user" style="cursor: pointer;">1번회원되기</div>
		<div id="second-user"  style="cursor: pointer;">2번회원되기</div>
		<div id="third-user"  style="cursor: pointer;">3번회원되기</div>
		<input type="text" name="nowUser" readonly="readonly" id="beingUserInput">
		<button>세션에 넣기</button>
	</form>
	<div>현재 세션에 넣은 user : "${sessionScope.tempUser}"</div>
	<div>현재 채팅방 리스트 : "${sessionScope.chatRoomList }"</div>

	<!-- 분류 창 -->
	<div class="sorting-bar">
		<!-- 각각의 메뉴 -->
		<div>
			<button class="regionBtn" id="regionBtn">
				<span id="regionTextSpan">REGION</span>
				<i class="bi bi-caret-down" id="bi"></i>
			</button>
			<ul class="regionListUl disappearList" id="regionListUl">
				<li>서울</li>
				<li>경기</li>
				<li>부산</li>
				<li>대구</li>
				<li>대전</li>
				<li>강원도</li>
				<li>경상북도</li>
				<li>경상남도</li>
				<li>전라북도</li>
				<li>전라남도</li>
				<li>충청북도</li>
				<li>충청남도</li>
				<li>충청남도</li>
				<li>제주도</li>
			</ul>
			<!--
			<select>
				<li>지역</li>
				<li>서울</li>
				<li>경기</li>
				<li>부산</li>
				<li>대구</li>
				<li>대전</li>
				<li>강원도</li>
				<li>경상북도</li>
				<li>경상남도</li>
				<li>전라북도</li>
				<li>전라남도</li>
				<li>충청북도</li>
				<li>충청남도</li>
				<li>충청남도</li>
				<li>제주도</li>
			</select>
			-->
		</div>
		<div>
			<input type="search" id="room-search">
			<button id="s-btn">
				<i class="fa-solid fa-magnifying-glass" id="glass"></i>			
			</button>
		</div>
	</div>
	<!-- 메인 카드 -->
	<div class="main-card-sec">

		<div class="box-card" onclick="location.href='${contextPath}/roomDetail'">
	
			<div></div>
	
			<div class="space-name">
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div> <i class="fa-solid fa-location-dot"></i>&nbsp;경기도 의정부시</div>

					<div><i class="fa-solid fa-tags" style="margin-top: 2px;"></i> &nbsp; #pearl 드럼 구비 <br> &nbsp;#5인 이상 연습 가능</div>
				</div>

				<div><i class="fa-solid fa-money-check"></i> 3000원 / 시간</div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
		<div class="box-card">
	
			<div></div>
	
			<div>
				<p>응왕 연습실</p>
			</div>
	
			<div id="detail-part">
	
				<div>

					<div></div>

					<div></div>
				</div>

				<div></div>
			</div>
	    </div>
	
	
	 </div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script type="text/javascript" src="${contextPath}/resources/js/roomMain.js"></script>
</body>
</html>