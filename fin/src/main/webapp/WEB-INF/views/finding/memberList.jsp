<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/memberList.css">
    
    <script src="https://kit.fontawesome.com/cbcad42a26.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

    <title>memberList</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section class="memberListSection">
		<c:choose>
			<c:when test="${!empty memberList}">
				<c:forEach items="${memberList}" var="member">
					<div class="wrapper">
			            <div class="userNameBox">
			                <img src="" alt="#">
			                <p>${member.userName}</p>
			            </div>
			            
			            <div class="userStyleBox">
			                <ul class="userStylUl">
			                    <li><i class="bi bi-house"></i><p>${member.region}</p></li>
			                    <li><i class="bi bi-music-note-beamed"></i><p>${member.genre}</p></li>
			                    <li><i class="fa-solid fa-guitar"></i><p>${member.inst}</p></li>
			                </ul>
			            </div>
			    
			            <div class="userChatProfieBox">
			                <ul class="userChatProfieUl"> 
			                    <li><i class="bi bi-chat-dots"></i></li>
			                    <li><i class="bi bi-person-circle"></i></li>
			                </ul>
			            </div>
        			</div>
				</c:forEach>
			</c:when>

			<c:otherwise>

				<div class=notFoundBox>
					<p>Not Found!</p>
				</div>
			</c:otherwise>
		</c:choose>

		
		
	</section>
	
	<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
	<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script src="${contextPath}/resources/js/memberList.js"></script>    
<script src="${contextPath}/resources/js/infiniteScroll.js"></script>   
</body>
</html>