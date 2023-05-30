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
    <title>중고거래페이지</title>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="topbox">
        <div>중고거래 게시판</div>
        <div class="searchbox" >
            <input type="text" id="searchboxInput">
            <i class="bi bi-search"></i>
        </div>
    </div>
    <div class="totalbox">
        <div></div>
    </div>

</body>
</html>