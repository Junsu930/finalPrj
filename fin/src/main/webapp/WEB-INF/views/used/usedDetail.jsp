<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	<link rel="stylesheet"href="${contextPath}/resources/css/usedDetail.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
    <title>중고거래상세페이지</title>
   </head>
   <body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="main" >
    	<input type="hidden" value="${sessionScope.loginUser.userNo}" id="hiddenUserNo">
    	<input type="hidden" value="${sessionScope.loginUser.userNick}" id="hiddenUserName">
    	<!-- Slider main container -->
		  	<!-- Swiper -->
    	<div class="topBox">
		    <div class="swiper mySwiper">
		      <div class="swiper-wrapper">
		      	<c:forEach var="each" items="${imageList}" begin="0" end="${fn:length(imageList)}">
			        <div class="swiper-slide">
						<img src="${contextPath}${each.imageRename}" class="guitarImg">
					</div>  		
		      	</c:forEach>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
    	</div>
    	<div class="bottomBox">
		    	<div class="bottomBoxDetail">
		    		<div class="nickName">${usedDetailVo.userNick}</div>
					<div class="dealTitileBox">
						<div class="SaleOrSoldout">
							<c:if test="${usedDetailVo.boardState eq 'Y'}">
							판매중
							</c:if>
							<c:if test="${usedDetailVo.boardState eq 'N'}">
							판매완료
							</c:if>
						</div>
						<div class="thingTitle">${usedDetailVo.boardTitle}</div>
					</div>
					<div class="price"><fmt:formatNumber value="${usedDetailVo.price}" />원</div>    	
		    	</div>
		    	<div class="productDetailBox">
		    		<div class="productConditionDetailBox">
		    			<div class="productCondition">- 상품상태</div>
		    			<div class="ConditionResult">${usedDetailVo.boardTag}</div>
		    		</div>
		    		<div class="tradingAreaDetailBox">
						<div class="tradingArea">- 거래지역</div>
						<div class="AreaResult">${usedDetailVo.region}</div>
		    		</div>
				</div>
				
				<c:if test="${sessionScope.loginUser.userNo eq usedDetailVo.userNo}">
					<div class="updateAndDeleteBtn">
						<form action="${contextPath}/updateUsedBoard" method="post">
							<div>
								<button type="submit" id="updateUsedBoardBtn">수정</button>
								<input type="hidden" value="${usedDetailVo.usedBoardNo}" name="usedBoardNoValue">
							</div>
						</form>
						<div>
					  		<button type="button" id="deleteUsedBoardBtn">삭제</button>
					  		<input type="hidden" value="${ usedDetailVo.usedBoardNo}" id="hiddenUsedBoardNo">
						</div>
						<c:if test="${usedDetailVo.boardState eq 'Y'}">
							<div>
								<form action="${contextPath}/completeSelling" method="post" id="compSellForm">
									<input type="hidden" value="${ usedDetailVo.usedBoardNo}" name="boardNoForCompleteSelling">								
							  		<button type="button" id="completeSelling">판매완료</button>
								</form>
							</div>
						</c:if>
					</div>
				</c:if>
	    		<div class="productInformationBox">
					<div class="productInformationAnswer">
						${usedDetailVo.boardContent}
		    		</div>
			
				</div>
		    	<div class="QuestionChat">
					<button class="QuestionChatButton" id="questionChatBtn">
						<i class="fa-sharp fa-regular fa-comments" style="color: #f5f5f5;"></i>
						구매 문의 채팅
					</button>
					<input type="hidden" value="${usedDetailVo.userNo}" id="hiddenWritersUserNo">
		    	</div>
    		</div>
    	
    	</div>
    	<!--  
    	<div class="moreBox">
    		<div class="moreProductBox">
    		  <div class="moreProductPicture">
    		  <img src="${contextPath}/resources/images/guitar.jpg" class="
"></div>
    		  </div>
    			<div class="moreProductTitle">10년된 피아노</div>
    				<div class="moreProductPrice">20000원</div>
    					<div class="moreProducArea">경기도</div>
    			
    		</div>
    	
    	
    	</div>
    	
    	</div>
    -->
<!-- 세션 분류 -->
<c:if test="${ !empty message }">
    <script>
        swal.fire("${message}");
    </script>
</c:if> 
<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript" src="${contextPath}/resources/js/usedDetail.js"></script>
</body>
</html>