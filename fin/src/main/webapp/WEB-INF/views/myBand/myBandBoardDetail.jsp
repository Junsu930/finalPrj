<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myBandBoardDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
<input type="hidden" value="${sessionScope.loginUser.userNo}" id="hiddenLoginUser">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="containerForBandBoardDetail">
		<div class="realContentForBandBoard">		
			<!-- 제목 -->
			<div>${boardDetail.boardTitle}</div>
			<!-- 정보 -->
			<div>
				<!-- 글쓴이 -->
				<div>
					${boardDetail.userNick }
				</div>
				<!-- 시간 -->
				<div>
					<i class="fa-regular fa-clock"></i>
					<span>${boardDetail.boardDate}</span>
				</div>
				<!-- 조회수 -->
				<div>
					<i class="fa-regular fa-eye"></i>
					<span>${boardDetail.readCount }</span>
				</div>
				<!-- 좋아요 -->
				<div>
					<i class="fa-regular fa-heart"></i>
					<span>${boardDetail.boardLike }</span>
				</div>
				<c:if test="${sessionScope.loginUser.userNo eq boardDetail.userNo }">
					<div class="editAndDeleteBtnDiv">
						<form action="${contextPath}/updateBandBoardDetail" method="post">
							<input type="hidden" name="boardNoForUpdateBoardDetail" value="${boardDetail.boardNo}">
							<button>수정</button>
						</form>
						<form action="${contextPath}/deleteBandBoardDetail" method="post" id="deleteBandBoardDetail">
							<input type="hidden" name="boardNoForUpdateBoardDetail" value="${boardDetail.boardNo}">
							<input type="hidden" name="bandNoForUpdateBoardDetail" value="${boardDetail.bandNo}">
							<button type="button" id="deleteBtnForBandBoard">삭제</button>
						</form>
					</div>
				</c:if>
			</div>
			<!-- 내용 -->
			<div>
				${boardDetail.boardContent}
			</div>
			<input type="hidden" value="${likeCheck}" id="likeCheckFor">
			<c:if test="${likeCheck eq 'T' }">
				<!-- 추천 -->
				<div class="underBarDiv">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-6 h-6 like">
		            	<path  d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
		       		</svg>
		       		<div>
		       			<button type="button" id="backButtonForBandBoard" onclick="window.history.back();">뒤로가기</button>
		       		</div>
				</div>
			</c:if>
			<c:if test="${likeCheck eq 'F' }">
				<!-- 추천 -->
				<div class="underBarDiv">
					<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-6 h-6">
		            	<path  d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
		       		</svg>
		       		<div>
		       			<button type="button" id="backButtonForBandBoard" onclick="window.history.back();">뒤로가기</button>
		       		</div>
				</div>
			</c:if>
		</div>
	</div>
	<div class="replyForBandBoardDetail" id="replyForBandBoardDetail">
		<!-- 댓글표식 -->
		<div>댓글</div>
		<input type="hidden" value="${boardDetail.boardNo}" id="hiddenReplyBoardNoForBandBoard">
		<input type="hidden" value="${sessionScope.loginUser.userNo}" id="hiddenSessionNoForReply">
		<input type="hidden" value="${memberFl}" id="memberFlForAjax">
		<!-- 각각의 댓글 -->
		<div id="replyContDiv">
		</div>
		<c:if test="${memberFl == 'T'}">
			<!-- 댓글 쓰기 -->
			<div class="replyForBandBoardDetailBtnDiv">
				<textarea id="replyForBandBoard"></textarea>
				<button type="button" id="replyForBandBoardBtn">댓글작성</button>
			</div>
		</c:if>
		<c:if test="${memberFl == 'F' }">
			<!-- 댓글 쓰기 -->
			<div class="replyForBandBoardDetailBtnDiv">
				<div id="replyForBandBoardNotMem">밴드 멤버의 경우만 댓글을 작성할 수 있습니다.</div>
				<button type="button" id="replyForBandBoardBtnNotMem">댓글작성</button>
			</div>
		</c:if>
	</div>

<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<c:if test="${!empty message }">
	<script>
		swal.fire("${message}");
	</script>
</c:if>
<script type="text/javascript" src="${contextPath}/resources/js/myBandBoardDetail.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/myBandBoardReply.js"></script>
</body>
</html>