<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alarmPage</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/messageBoxPage.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPagebootStrap.css">
<link rel="stylesheet" href="${contextPath}/resources/css/alarmPage.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

		<section class="alarmSection">
			<c:choose>
				<c:when test="${!empty inviList}">
					<c:forEach var="invi" items="${inviList}">
						<div class="alarmWrapper">
							<h1>✉밴드 초대장</h1>
							<p>한 장의 ${invi.bandName}&nbsp;초대장이 도착했습니다!</p>
							<div class="alarmBtnBox">
								<form action="acceptBand" method="POST">
									<input type="hidden" value="${sessionScope.loginUser.userNo}">
									<button class="acceptBtn">수락&nbsp;&nbsp;😊</button>
									<input type="hidden" name="bandNo" value="${invi.bandNo}" >
								</form>
								<form action="deniedBand" method="POST">
									<button>거절&nbsp;&nbsp;😱</button>
									<input type="hidden" value="${invi.bandNo}" name="bandNo">
								</form>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div id="emptyInvitation">
						<p style="cursor: pointer;" onclick="location.href='/fin/main'" id="inviEmpty">EMPTY!</p>
					</div>
				</c:otherwise>
			</c:choose>
		</section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="${contextPath}/resources/js/alarmPage.js"></script>
</body>
</html>