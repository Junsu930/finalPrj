<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/roomMain.css">
<link rel="stylesheet" href="${contextPath}/resources/css/lookProfile.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<title>예약페이지</title>
</head>
<body>

<!-- 모달 파트 -->
<div class="modal" tabindex="-1" id="exampleModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">깅깅이 님의 프로필</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
 		<div class="mainProfile">
 			<!-- 프로필 이미지  -->
 			<div>
 				<div id="imgProfileRoundBox">
 					<img class="imgProfileImage" src="${contextPath}/resources/images/bill.jpg">
 				</div>
 			</div>
 			<!-- 닉네임과 이메일 -->
 			<div>
 				<div>깅깅이</div>
 				<div>gingging@naver.com</div>
 			</div>
 		</div>
 		<!-- 프로필 아이콘 -->
 		<div class="profileIcons">
 			<!-- 악기 -->
 			<div class="eachIconDiv">
 				<div>
 					<i class="fa-solid fa-guitar"></i>Instrument
 				</div>
 				<div>
	 				기타
 				</div>
 			</div>
 			<!-- 장르 -->
 			 <div class="eachIconDiv">
 				<div>
					<i class="fa-solid fa-music"></i>Genre
 				</div>
	 			<div>
	 				재즈
	 			</div>
 			</div>

 			<!-- 지역 -->
 			 <div class="eachIconDiv">
 				<div>
 					<i class="fa-solid fa-house"></i>Address
 				</div>
	 			<div>
	 				경기도 의정부시
	 			</div>
 			</div>
 			<!-- 경력 -->
 			 <div class="eachIconDiv">
 				<div>
 					<i class="fa-solid fa-calendar-days"></i>YearsOfExp
 				</div>
	 			<div>
	 				4년
	 			</div>
 			</div> 		
 		</div>
 		<!-- 소개 멘트 -->
 		<div class="introMentInput">
 			<div class="mentBox">안녕하세요.<br> 재즈를 좋아하는 깅깅이입니다.<br>
 			재즈 밴드 깅깅스의 기타리스트입니다.</div>
 		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">채팅하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
	
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">프로필보기</button>	
	<a href="${contextPath}/usedWriting">중고글 작성</a>
	<!-- 분류 창 -->
	<div class="sorting-bar">
		<!-- 각각의 메뉴 -->
		<div>
			<select>
				<option>지역</option>
				<option>서울</option>
				<option>경기</option>
				<option>부산</option>
				<option>대구</option>
				<option>대전</option>
				<option>강원도</option>
				<option>경상북도</option>
				<option>경상남도</option>
				<option>전라북도</option>
				<option>전라남도</option>
				<option>충청북도</option>
				<option>충청남도</option>
				<option>충청남도</option>
				<option>제주도</option>
			</select>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript" src="${contextPath}/resources/js/roomMain.js"></script>
</body>
</html>