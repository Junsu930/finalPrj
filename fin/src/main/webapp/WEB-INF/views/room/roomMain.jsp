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
<div class="content" id="content">
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