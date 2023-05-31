<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- 
	
	* http://localhost:8080/comm
	* http://localhost:8080/comm/main 주소로 요청 위임
	-> forward이기 때문에 출력 주소는 http://localhost:8080/comm
 -->
 <!DOCTYPE html>
<html lang="en">
<head>
    <title>Loader</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${contextPath}/resources/css/loader.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <script src="https://unpkg.com/typeit@8.7.1/dist/index.umd.js"></script>
</head>
<body>
    <h1 id="title">Hello!</h1>
    <!-- <div class="loader"></div> -->
    <script>
		window.onload = function(){
			new TypeIt("#title")
            .pause(350)
            .delete(7, { delay: 250})
            .type("Band Archive")
            .go();
		}

        setTimeout(function() {
			window.location.href ="main";
		}, 4000);

    </script>
</body>
</html>
 
 

