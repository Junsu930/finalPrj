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
	<link rel="stylesheet" href="${contextPath}/resources/css/memberListModal.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/myPagebootStrap.css">

    <script src="https://kit.fontawesome.com/cbcad42a26.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/modal.min.js"></script>

    <title>memberList</title>

	<style>
		dl, ol, ul {
			margin-top: 0;
			margin-bottom: 0;
			padding-left: 0;
		}
		body{
			line-height: normal;	
		}
		button, input, optgroup, select, textarea {
			font-family : revert;
			font-size: revert;
			line-height: inherit;
		}
	
		p{
			margin-bottom: 0;
		}
		
		a:hover {
		color: revert;
		}
	</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section class="memberListSection">
		<c:choose>
			<c:when test="${!empty memberList}">
				<c:forEach items="${memberList}" var="member">

					<div class="wrapper">
			            <div class="userNameBox">
			                <div class="userImgBox">
								<img src="${contextPath}/resources/images/profileImage/user.png" alt="#">
							</div>
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
			                    <li class="bi bi-chat-dots"></li>
								<li class="profileMsg bi bi-envelope"></li>
								<input id="receiverUserNo_memberList" type="hidden" value="${member.userNo}">
			                    <li class="bi bi-person-circle" data-bs-toggle="modal" data-bs-target="#exampleModal"></li>
			                </ul>
			            </div>
        			</div>

				</c:forEach>
			</c:when>

			<c:otherwise>

				<div class=notFoundBox>
					<h1>Not Found!</h1>
				</div>
			</c:otherwise>
		</c:choose>
		

		<!-- block Modal -->
		<div class="container">
			<!-- <button class=" js-static-modal-toggle btn btn-primary " type="button">test</button> -->
			<div id="static-modalBlock" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
			<div class="modal-dialog" id="memberListDialog">
				<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				</div>
				<div class="modal-body memberModal">
					
					<div class="sendMsgModalBox">
					<h1>SEND MESSAGE</h1>
					<textarea name="" id="replyMsgText_memberList" cols="" rows=""></textarea>
					<button id="msgSendModalBtn" onclick="sendMsg()" type="button"  class="bi bi-envelope"></button>
					</div>
	
					
				</div>
				<div class="modal-footer"></div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
			</div>
		</div>

		

		
		
		
		
	</section>
	
	<jsp:include page="/WEB-INF/views/profile/lookProfile.jsp"/>
	<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
	<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script src="${contextPath}/resources/js/memberList.js"></script>    
<script src="${contextPath}/resources/js/infiniteScroll.js"></script>   
</body>
</html>