<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet"href="${contextPath}/resources/css/transaction/transaction.css"></script>
<script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
 <title>중고거래페이지</title>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="topbox">
        <div>중고거래 게시판</div>
        <div class="searchbox">
            <input type="text" id="searchboxInput" >
            <button type="button" class="searchInputButton"></button>
            <i class="fa-solid fa-magnifying-glass" class="glass"></i>
        </div>
    </div>
    <div class="totalbox">
        <div class="dealbox1"></div>
        <div class="dealbox2"></div>
        <div class="dealbox3"></div>
        <div class="dealbox4"></div>
        </div>
    </div>

</body>
</html>