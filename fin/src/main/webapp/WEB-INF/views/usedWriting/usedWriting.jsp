<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/usedWriting.css">	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<title>중고거래작성</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <form method="post" action="${contextPath}/writeUsedForm" id="usedWriteForm" enctype="multipart/form-data">
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
 			<label for="img1"> 			
	 			<img id="imageInsertPic" src="${contextPath}/resources/images/imageinsert.png">
 			</label>
 			<input type="file" class="inputImage" id="img1" name="images" accept="image/*">
 		</div>
 	</div>
 	<!-- 제목 -->
 	<div>
		 <div>제목<p style="color : var(--red-color); display: inline;">*</p></div>
 		<div class="usedTitleDiv">
			 <input id="usedTitlePlace" name="usedTitleInput" type="text" maxlength="39">
	 		<p id="usedTitleInputTextLength">0/40</p>
		</div>
	</div>
	<!-- 상품명 -->
	<div>
		<div>상품명<p style="color : var(--red-color); display: inline;">*</p></div>
		<div class="usedProductNameDiv">
			<input id="usedProductName" name="usedProductName" type="text" maxlength="30">
	   </div>
	</div>
 	<!-- 거래 지역 -->
 	<div>
 		<div>거래지역<p style="color : var(--red-color); display: inline;">*</p></div>
 		<!-- 지역 카드 -->
 		<div class="regionCardBox">
 			<div class="regionCard">
	 			<input class="regionBtn" type="radio" name="region" value="서울" id="seoulBtn">
 				<label for="seoulBtn">서울</label>
 			</div>
 			<div class="regionCard">
	 			<input class="regionBtn" type="radio" name="region" value="경기도" id="gyeonggiBtn">
 				<label for="gyeonggiBtn">경기도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="부산" id="busanBtn">
 				<label for="busanBtn">부산</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="대구" id="daeguBtn">
 				<label for="daeguBtn">대구</label>
 			</div>
 			<div class="regionCard">
				<input class="regionBtn" type="radio" name="region" value="광주" id="gwangjuBtn">
 				<label for="gwangjuBtn">광주</label>
			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="대전" id="daejeonBtn">
 				<label for="daejeonBtn">대전</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="제주" id="jejuBtn">
 				<label for="jejuBtn">제주도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="충청북도" id="chungbukBtn">
 				<label for="chungbukBtn">충청북도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="충청남도" id="chungnamBtn">
 				<label for="chungnamBtn">충청남도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="경상북도" id="gyeongbukBtn">
 				<label for="gyeongbukBtn">경상북도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="경상남도" id="gyeongnamBtn">
 				<label for="gyeongnamBtn">경상남도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="전라북도" id="jeonbukBtn">
 				<label for="jeonbukBtn">전라북도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="전라남도" id="jeonnamBtn">
 				<label for="jeonnamBtn">전라남도</label>
 			</div>
 			<div class="regionCard">
 				<input class="regionBtn" type="radio" name="region" value="강원도" id="kangwonBtn">
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
				<input type="number" id="priceInput" name="usedPriceInput" placeholder="가격을 입력해주세요"> 원
			</div> 		
 		</div>
 	</div>
 	<!-- 설명 -->
 	<div>
 		<div>설명<p style="color : var(--red-color); display: inline;">*</p></div>
 		<div>
 			<textarea id="usedDetailExplain" name="usedDetailInput" placeholder="여러 장의 상품 사진과 구입 연도 , 브랜드 , 사용감 , 하자 유무 등 &#13;&#10;구매자에게 필요한 정보를 꼭 포함해 주세요 (10자 이상)
 			"></textarea>
 			<div id="detailExplainTextAmount">0 / 4000</div>
 		</div>
 	
 	</div>
 	<!-- 버튼 -->
 	<div>
 		<button type="button" id="usedBoardInsertBtn">등록하기</button>
 	</div>
 </div>
 </form>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/usedWriting.js"></script>
</body>
</html>