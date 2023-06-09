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
	<div class="logoDiv">
		<svg id="titleLogo" width="283" height="102" viewBox="0 0 283 102" fill="none" xmlns="http://www.w3.org/2000/svg">
		<path d="M52.936 101L29.032 59.96H13.192V101H0.0880127V0.632004H32.488C40.072 0.632004 46.456 1.928 51.64 4.52C56.92 7.11201 60.856 10.616 63.448 15.032C66.04 19.448 67.336 24.488 67.336 30.152C67.336 37.064 65.32 43.16 61.288 48.44C57.352 53.72 51.4 57.224 43.432 58.952L68.632 101H52.936ZM13.192 49.448H32.488C39.592 49.448 44.92 47.72 48.472 44.264C52.024 40.712 53.8 36.008 53.8 30.152C53.8 24.2 52.024 19.592 48.472 16.328C45.016 13.064 39.688 11.432 32.488 11.432H13.192V49.448Z"  stroke="black" stroke-width="5"/>
		<path d="M91.8734 101.864C89.3774 101.864 87.2654 101 85.5374 99.272C83.8094 97.544 82.9454 95.432 82.9454 92.936C82.9454 90.44 83.8094 88.328 85.5374 86.6C87.2654 84.872 89.3774 84.008 91.8734 84.008C94.2734 84.008 96.2894 84.872 97.9214 86.6C99.6494 88.328 100.513 90.44 100.513 92.936C100.513 95.432 99.6494 97.544 97.9214 99.272C96.2894 101 94.2734 101.864 91.8734 101.864Z"  stroke="black" stroke-width="5"/>
		<path d="M131.036 11.288V44.84H167.612V55.64H131.036V90.2H171.932V101H117.932V0.488007H171.932V11.288H131.036Z"  stroke="black" stroke-width="5"/>
		<path d="M195.936 101.864C193.44 101.864 191.328 101 189.6 99.272C187.872 97.544 187.008 95.432 187.008 92.936C187.008 90.44 187.872 88.328 189.6 86.6C191.328 84.872 193.44 84.008 195.936 84.008C198.336 84.008 200.352 84.872 201.984 86.6C203.712 88.328 204.576 90.44 204.576 92.936C204.576 95.432 203.712 97.544 201.984 99.272C200.352 101 198.336 101.864 195.936 101.864Z"  stroke="black" stroke-width="5"/>
		<path d="M233.082 89.624H282.042V101H217.53V90.632L266.202 12.008H218.106V0.632004H281.754V11L233.082 89.624Z" stroke="black" stroke-width="5"/>
		</svg>
	</div>

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