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
	 <link rel="stylesheet"href="${contextPath}/resources/css/usedDetail.css"></script>
 
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
    <title>중고거래상세페이지</title>
   </head>
   <body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="main" >
    
    	<div class="topBox">
    		<div class="left">
    			<button class="leftButton">
    				<i class="fa-sharp fa-solid fa-chevron-left"></i>
    			</button>
    		</div>
   			<div class="pictureBox">
    			<div class="picture">
    				<img src="${contextPath}/resources/images/guitar.jpg" class="guitarImg">
    							</div>
    						</div>
    		<div class="right">
    			<button class="rightButton">
    		<i class="fa-sharp fa-solid fa-chevron-right"></i>
    		</div>
    			</button>
    
    	</div>
    	<div class="bottomBox">
    	<div class="bottomBoxDetail">
    		<div class="nickName">이갈치</div>
			<div class="dealTitileBox">
			<div class="SaleOrSoldout">판매</div>
			<div class="thingTitle">피아노 팔게요</div>
			</div>
			<div class="price">20,000원</div>    	
    	</div>
    	<div class="productDetailBox">
    		<div class="productConditionDetailBox">
    			<div class="productCondition">- 상품상태</div>
    			<div class="ConditionResult">중고</div>
    		</div>
    		<div class="deliveryPriceDetailBox">
				<div class="deliveryPrice">- 배송비</div>
				<div class="PriceResult">배송비포함</div>
		
    		</div>
    		<div class="tradingAreaDetailBox">
				<div class="tradingArea">- 거래지역</div>
				<div class="AreaResult">경기도</div>
		
    		</div>
			</div>
			
    	<div class="productInformationBox">
    		<div class="productInformationTitle">상품정보</div>
			<div class="productInformationAnswer">
			셋팅 죄어 있는 상태입니다 바로 연주가능해요<br>
    	비커스 케이스 같이 드려요<br>
    	신품보다 저렴하게 산다고 생각하면 될 듯 해요<br>
    	노리턴<br>
    	주말 천안시 직거래,고속버스 (택비별도)로 보내드립니다 <br>
    	<br>
    	안전결제 가능해요 <br>
    		</div>
		
			</div>
    	<div class="QuestionChat">
    	<button class="QuestionChatButton">
    <i class="fa-sharp fa-regular fa-comments" style="color: #f5f5f5;"></i></i>
    	구매 문의 채팅</button>
    	</div>
    	</div>
    </div>
<!-- 세션 분류 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>