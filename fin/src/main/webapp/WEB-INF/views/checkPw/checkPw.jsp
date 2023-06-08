<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkPw</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/checkPw.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

</head>
<body>


    <jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <section class="checkPwSection">
        <h2>CHECK FOR YOUR PASSWORD</h2>
        <form action="#">
            <div class="wrapperCheck">
                <p>Band Archive</p>
                <div class="inputBoxCheck">  <!--input-box-->
                    <span class="iconCheck">
                        <ion-icon name="lock-closed" id="iconCheck"></ion-icon>
                    </span>
                    <input type="password" required>
                    <label id="labelCheck">PASSWORD</label>
                </div>
        
                <button type="submit" id="checkBtn">SUBMIT</button>
            </div>
        </form>
    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src = "${contextPath}/resources/js/checkPw.js"></script>
</body>
</html>