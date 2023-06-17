<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/faq.css">
</head>
<body>
	<div class="faqBox disappear" id="faqBox">
		<div class="faqQuestion">
			<div class="faqDuck"><img src="${contextPath}/resources/images/chatbot-removebg-preview.png"></div>
			<div class="talking">무엇을 도와드릴까요?</div>
		</div>
		<div class="questionList" id="reqQ">
			<div class="talking">
				<ul class="Q-lists" id="Q-lists">
					<li value="1">🎸 밴드 아카이브는 어떤 사이트인가요?</li>
					<li value="2">🔎 밴드 멤버를 찾고 싶어요</li>
					<li value="3">📻 중고 물품 거래는 안전거래인가요?</li>
					<li value="4">🤣 밴드 멤버가 나갔어요</li>
					<li value="5">✖️ 연습실 예약 취소는 어떻게 하나요?</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="faq-img">
		<img src="${contextPath}/resources/images/chatbot-removebg-preview.png">
	</div>
<script type="text/javascript" src="${contextPath}/resources/js/faq.js"></script>
</body>
</html>