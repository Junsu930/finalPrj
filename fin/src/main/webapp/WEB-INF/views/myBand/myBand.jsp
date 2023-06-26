<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myBand.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>내 밴드 보기</title>
</head>
<body>
<c:set var="bandTitle" value="${bandList[0].bandName}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="myBandContainer">
		<div class="bandHeader">
			<p><c:out value="${bandTitle}"/></p><p> Band Board</p>
		</div>
		<div class="bandContentsDiv">
			<div class="leftSideBandMemberDiv">
				<div class="bandInfoDiv">
					<div>
						<i class="fa-solid fa-crown"></i>
						<span class="memList">김빵빵이</span>
					</div>
					<div>
						<i class="fa-solid fa-user"></i>
						<span class="memList">룽빵뽕이</span>
					</div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div class="writeBandDiv">
					<button type="button" id="bandBoardWriteButton">글쓰기</button>
				</div>
			</div>
			<div class="rightSideBandBoardDiv">
				<!-- 게시판 영역 -->
				<div class="realBoardDiv">
					<!-- 글 영역 -->
					<div>
						<!-- 각각의 글 -->
						<div class="eachBoardDiv">
							<!-- 제목 영역 -->
							<div>
								안녕하세요 공지 올립니다 흐아아아
							</div>
							<!-- 조회수, 좋아요 등등 -->
							<div>
								<!-- 글쓴이 -->
								<div>
									짱짱한짱짱이
								</div>
								<!-- 시간 -->
								<div>
									<i class="fa-regular fa-clock"></i>
									<span>3시간 전</span>
								</div>
								<!-- 조회수 -->
								<div>
									<i class="fa-regular fa-eye"></i>
									<span>402</span>
								</div>
								<!-- 좋아요 -->
								<div>
									<i class="fa-regular fa-heart"></i>
									<span>32</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 페이지네이션 영역 -->
					<div></div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/myBand.js"></script>
</body>
</html>