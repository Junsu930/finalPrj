<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messageBoxPage</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/messageBoxPage.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>



    <c:choose>
        <c:when test="${!empty msgList}">
                <div class="msgBox">
                    <ul class="msgBoxUl">
                        <c:forEach items="${msgList}" var="msgList">
                            <li>${msgList.sendUserNickName} 보낸 사람</li>
                            <li>${msgList.receiverNickName} 받는 사람</li>
                            <li>${msgList.msgContent} 내용</li>
                        </c:forEach>
                    </ul>
                </div>
        </c:when>
        <c:otherwise>
            <div class="msgBox">
                <h1>메세지가 비었습니다!</h1>
            </div>
        </c:otherwise>
    </c:choose>


    <div>
        <input type="text" id="receiverNickName" placeholder="받는 사람 닉네임">
        <input type="text" id="msgInput" placeholder="메세지 내용"> 
        <button type="button" onclick="sendMsg()">쪽지 보내기</button>
    </div>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src = "${contextPath}/resources/js/messageBoxPage.js"></script>
</body>
</html>