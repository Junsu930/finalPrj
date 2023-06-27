<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myBandWrite.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/44f3dd3f25.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="myBandWritecontainer">
    <form action="${contextPath}/writeBandBoard" method="POST">
    	<div class="writeMainP">글쓰기</div>
    	<!-- 제목 기입 영역 -->
    	<div class="titleAreaDivForBandBoard">
    		<div>제목</div>
    		<input type="text" id="titleInputForBandBoard" name="titleInputForBandBoard">
    	</div>
    	<input type="hidden" value="${bandNo}" name="hiddenBandNo">
      <textarea name="text" id="editor"></textarea>
    <p class="sendBtnForBandBoardP"><button type="submit" id="sendBtnForBandBoard">전송</button></p>
    </form>
</div>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/myBandWrite.js"></script>
<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>