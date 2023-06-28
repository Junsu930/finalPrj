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
			<div class="alarmWrapper">
				<h1>✉밴드 초대장</h1>
				<p>한 장의 밴드 초대장이 도착했습니다!</p>
				<div class="alarmBtnBox">
					<form action="">
						<button>수락&nbsp;&nbsp;😊</button>
					</form>
					<form action="">
						<button>거절&nbsp;&nbsp;😱</button>
					</form>
				</div>
			</div>
		</section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>