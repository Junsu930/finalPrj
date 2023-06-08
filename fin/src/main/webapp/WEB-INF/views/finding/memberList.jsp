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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

    <title>memberList</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">

		<div class="item">
	
			<div class="namebox">
                <p><i class="fa-solid fa-user"></i>이름</p>
            </div>
	
            <!--악기 장르 거주지-->
			<div class="info">
                <div><i class="fa-solid fa-drum"></i></div>

				<div><i class="fa-solid fa-compact-disc"></i>장르</div>

				<div><i class="fa-solid fa-building"></i>거주지</div>
			</div>
	
			<div class="chat">
	
				<div class="sendchat"><i class="fa-regular fa-comment-dots"></i></div>

				<div class="userinfo"><i class="fa-solid fa-circle-user"></i></div>
			</div>
	    </div>
		
	
		<div class="item">
	
			<div class="namebox">
                <p><i class="fa-solid fa-user"></i>이름</p>
            </div>
	
            <!--악기 장르 거주지-->
			<div class="info">
                <div><i class="fa-solid fa-drum"></i></div>

				<div><i class="fa-solid fa-compact-disc"></i>장르</div>

				<div><i class="fa-solid fa-building"></i>거주지</div>
			</div>
	
			<div class="chat">
	
				<div class="sendchat"><i class="fa-regular fa-comment-dots"></i></div>

				<div class="userinfo"><i class="fa-solid fa-circle-user"></i></div>
			</div>
	    </div>

        <div class="item">
	
			<div class="namebox">
                <p><i class="fa-solid fa-user"></i>이름</p>
            </div>
	
            <!--악기 장르 거주지-->
			<div class="info">
                <div><i class="fa-solid fa-drum"></i></div>

				<div><i class="fa-solid fa-compact-disc"></i>장르</div>

				<div><i class="fa-solid fa-building"></i>거주지</div>
			</div>
	
			<div class="chat">
	
				<div class="sendchat"><i class="fa-regular fa-comment-dots"></i></div>

				<div class="userinfo"><i class="fa-solid fa-circle-user"></i></div>
			</div>
	    </div>

        <div class="item">
	
			<div class="namebox">
                <p><i class="fa-solid fa-user"></i>이름</p>
            </div>
	
            <!--악기 장르 거주지-->
			<div class="info">
                <div><i class="fa-solid fa-drum"></i></div>

				<div><i class="fa-solid fa-compact-disc"></i>장르</div>

				<div><i class="fa-solid fa-building"></i>거주지</div>
			</div>
	
			<div class="chat">
	
				<div class="sendchat"><i class="fa-regular fa-comment-dots"></i></div>

				<div class="userinfo"><i class="fa-solid fa-circle-user"></i></div>
			</div>
	    </div>

        <div class="item">
	
			<div class="namebox">
                <p><i class="fa-solid fa-user"></i>이름</p>
            </div>
	
            <!--악기 장르 거주지-->
			<div class="info">
                <div><i class="fa-solid fa-drum"></i></div>

				<div><i class="fa-solid fa-compact-disc"></i>장르</div>

				<div><i class="fa-solid fa-building"></i>거주지</div>
			</div>
	
			<div class="chat">
	
				<div class="sendchat"><i class="fa-regular fa-comment-dots"></i></div>

				<div class="userinfo"><i class="fa-solid fa-circle-user"></i></div>
			</div>
	    </div>
        
        <div class="item">
	
			<div class="namebox">
                <p><i class="fa-solid fa-user"></i>이름</p>
            </div>
	
            <!--악기 장르 거주지-->
			<div class="info">
                <div><i class="fa-solid fa-drum"></i></div>

				<div><i class="fa-solid fa-compact-disc"></i>장르</div>

				<div><i class="fa-solid fa-building"></i>거주지</div>
			</div>
	
			<div class="chat">
	
				<div class="sendchat"><i class="fa-regular fa-comment-dots"></i></div>

				<div class="userinfo"><i class="fa-solid fa-circle-user"></i></div>
	    </div>
	    
	    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script src="${contextPath}/resources/js/memberList.js"></script>    
<script src="${contextPath}/resources/js/infiniteScroll.js"></script>   
</body>
</html>