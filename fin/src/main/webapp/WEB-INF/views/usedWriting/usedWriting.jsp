<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/usedWriting.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<title>중고거래작성</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <div class="usedContent">
 	<!-- 기본 정보 -->
 	<div>
 		<p>기본정보</p>
 		<p>* 필수항목</p>
 	</div>
 	<!-- 상품 이미지 -->
 	<div>
 		<div>상품 이미지<p style="color : var(--red-color); display: inline;">*</p></div>
 		<!-- 사진 칸 -->
 		<div>
 			<img id="imageInsertPic" src="${contextPath}/resources/images/imageinsert.png">
 		</div>
 	</div>
 	<!-- 제목 -->
 	<div>
 		<div>제목<p style="color : var(--red-color); display: inline;">*</p></div>
 		<div class="usedTitleDiv">
	 		<input id="usedTitlePlace" type="text" maxlength="39">
	 		<p id="usedTitleInputTextLength">0/40</p>
 		</div>
 	</div>
 	<!-- 거래 지역 -->
 	<div>
 		<div>거래지역<p style="color : var(--red-color); display: inline;">*</p></div>
 		<!-- 지역 카드 -->
 		<div class="regionCardBox">
 			<div class="regionCard">
	 			<input class="regionBtn" type="radio" name="region" value="seoul" id="seoulBtn">
 				<label for="seoulBtn">서울</label>
 			</div>
 			<div class="regionCard">
	 			<input class="regionBtn" type="radio" name="region" value="gyeonggi" id="gyeonggiBtn">
 				<label for="gyeonggiBtn">경기도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="busan" id="busanBtn">
 				<label for="busanBtn">부산</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="daegu" id="daeguBtn">
 				<label for="daeguBtn">대구</label>
 			</div>
 			<div class="regionCard">
				<input class="regionBtn" type="radio" name="region" value="gwangju" id="gwangjuBtn">
 				<label for="gwangjuBtn">광주</label>
			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="daejeon" id="daejeonBtn">
 				<label for="daejeonBtn">대전</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="jeju" id="jejuBtn">
 				<label for="jejuBtn">제주도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="chungbuk" id="chungbukBtn">
 				<label for="chungbukBtn">충청북도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="chungnam" id="chungnamBtn">
 				<label for="chungnamBtn">충청남도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="gyeongbuk" id="gyeongbukBtn">
 				<label for="gyeongbukBtn">경상북도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="gyeongnam" id="gyeongnamBtn">
 				<label for="gyeongnamBtn">경상남도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="jeonbuk" id="jeonbukBtn">
 				<label for="jeonbukBtn">전라북도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="jeonnam" id="jeonnamBtn">
 				<label for="jeonnamBtn">전라남도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="kangwon" id="kangwonBtn">
 				<label for="kangwonBtn">강원도</label>
 			</div>
 		</div>
 	</div>
 	<!-- 상태 -->
 	<div>
 		<div>상태<p style="color : var(--red-color); display: inline;">*</p></div>
 		<div>
			<label>
				<input type="radio" name="status" value="used">
				중고상품
			</label> 		
			<label>
				<input type="radio" name="status" value="clean">
				새상품
			</label> 		
 		</div>
 	</div>
 	<!-- 가격 -->
 	<div>
 		<div>가격<p style="color : var(--red-color); display: inline;">*</p></div>
 		<div class="usedPriceDiv">
			<div>
				<input type="number" id="priceInput" placeholder="가격을 입력해주세요"> 원
			</div> 		
			<div>
				<label>
					<input type="checkbox"><span>배송비 포함</span>
				</label>
			</div> 		
 		</div>
 	</div>
 	<!-- 설명 -->
 	<div>
 		<div>설명<p style="color : var(--red-color); display: inline;">*</p></div>
 		<div>
 			<textarea id="usedDetailExplain" placeholder="여러 장의 상품 사진과 구입 연도 , 브랜드 , 사용감 , 하자 유무 등 &#13;&#10;구매자에게 필요한 정보를 꼭 포함해 주세요 (10자 이상)
 			"></textarea>
 			<div id="detailExplainTextAmount">0 / 4000</div>
 		</div>
 	
 	</div>
 	<!-- 버튼 -->
 	<div>
 		<button type="button" id="usedBoardInsertBtn">등록하기</button>
 	</div>
 </div>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/usedWriting.js"></script>
</body>
</html>