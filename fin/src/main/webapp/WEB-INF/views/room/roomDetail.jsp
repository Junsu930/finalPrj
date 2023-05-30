<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/roomDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					</div>
					<!-- 시설 안내 -->
					<div id="facility">
						<h1>시설 안내</h1>
						<hr>
					</div>
					<!-- 유의 사항 -->
					<div id="warn">
						<h1>유의 사항</h1>
						<hr>
					</div>
				</div>
			</div>
		</div>
		
		<!-- right -->
		<div class="rightSide"></div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/roomDetail.js"></script>
</body>
</html>