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
		</div>
		<div class="bandContentsDiv">
			<div class="leftSideBandMemberDiv">
				<div class="bandTitleDiv">
					<p>${bandTitle}</p>
				</div>
				<div class="bandInfoDiv">
					<div>
						<i class="fa-solid fa-crown"></i>
						<span class="memList">${leaderNick}</span>
					</div>
					<c:forEach var="eachBandMember" items="${memberList }" >
						<div>
							<i class="fa-solid fa-user"></i>
							<span class="memList">${eachBandMember}</span>
						</div>			
					</c:forEach>
				</div>
				<c:if test="${memberFl eq 'T' }">
					<div class="writeBandDiv">
						<form method="post" action="${contextPath}/bandBoardWrite">
							<input type="hidden" value="${bandNo}" name="hiddenBandNoForWrite">
							<button type="submit" id="bandBoardWriteButton">글쓰기</button>
						</form>
					</div>
				</c:if>
			</div>
			<div class="rightSideBandBoardDiv">
				<!-- 게시판 영역 -->
				<div class="realBoardDiv">
					<!-- 글 영역 -->
					<div>
						<c:forEach var="eachBoard" items="${bandList}">
							<form method="post" action="bandBoardDetail" class="eachBoardFormForBand">
								<!-- 각각의 글 -->
								<div class="eachBoardDiv" onclick="$(this).parent().submit();">
									<!-- 보드넘버, 밴드 넘버 숨기기 -->
									<input type="hidden" name="thisBoardNo" value="${eachBoard.boardNo}">
									<input type="hidden" name="thisBandNo" value="${bandNo}">
									<!-- 제목 영역 -->
									<div>
										${eachBoard.boardTitle }
									</div>
									<!-- 조회수, 좋아요 등등 -->
									<div>
										<!-- 글쓴이 -->
										<div>
											${eachBoard.userNick }
										</div>
										<!-- 시간 -->
										<div>
											<i class="fa-regular fa-clock"></i>
											<span>${eachBoard.boardDate}</span>
										</div>
										<!-- 조회수 -->
										<div>
											<i class="fa-regular fa-eye"></i>
											<span>${eachBoard.readCount}</span>
										</div>
										<!-- 좋아요 -->
										<div>
											<i class="fa-regular fa-heart"></i>
											<span>${eachBoard.boardLike}</span>
										</div>
									</div>
								</div>
							</form>
						</c:forEach>
					</div>
					<!-- 페이지네이션 영역 -->
					<div class="paginations">
						<c:if test="${pageVo.prev}">
							<li><a href="myBandBoard?bandNo=${bandNo}&pageNum=${pageVo.startPage =1}&amount=${pageVo.amount}">이전</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}">
							<li class="${pageVo.pageNum eq num ? 'active' : ''}">
								<a href="myBandBoard?bandNo=${bandNo}&pageNum=${num}&amount=${pageVo.amount}">${num}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageVo.next}">
							<li><a href="myBandBoard?bandNo=${bandNo}&pageNum=${pageVo.endPage + 1}&amount=${pageVo.amount}">다음</a></li>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/myBand.js"></script>
<c:if test="${!empty message }">
	<script>
		swal.fire("${message}");
	</script>
</c:if>
</body>
</html>