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
    <link rel="stylesheet" href="${contextPath}/resources/css/findingLoder.css">
    
    <script src="https://kit.fontawesome.com/cbcad42a26.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

    <title>findingLoder</title>
</head>
<body>
	<div class=loderbox>
	<div class="loadingio-spinner-magnify-khdk4exhsp9"><div class="ldio-nnkfhwc621">
		<div><div><div></div><div></div></div></div>
		</div></div>
		<p id="search">searching your member....</p>
	</div>
	


	<script>
	setTimeout(function() {
		window.location.href ="memberList";
	}, 3000);
	</script>
</body>
</html>