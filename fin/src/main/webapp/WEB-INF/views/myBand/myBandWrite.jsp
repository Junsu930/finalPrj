<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
    <form action="${contextPath}/writeBandBoard" method="POST" onsubmit="return vacantCheck()">
	<input type="hidden" value="${updateFlag}" id="updateFlag" name="updateFlag">
	<input type="hidden" value="${updateDetail.boardTitle}" id="hiddenTitle">
	<input type="hidden" value="${boardNo}" id="hiddenBoardNoForUpdateLogic" name="hiddenBoardNoForUpdateLogic">
    	<div class="writeMainP">글쓰기</div>
   		<div class="toggle">
   			<input type="checkbox" id="noticeBoardCheck" name="noticeBoardCheck" id="toggle1" value="1">
   			<label for="noticeBoardCheck">공지글 올리기
   			</label>
   		</div>
    	<!-- 제목 기입 영역 -->
    	<div class="titleAreaDivForBandBoard">
    		<div>제목</div>
    		<input type="text" id="titleInputForBandBoard" name="titleInputForBandBoard">
    	</div>
	     <textarea name="text" id="editor">
	      	<c:if test="${updateFlag eq 'U' }">
	      		${updateDetail.boardContent}
	      	</c:if>
	     </textarea>
	<c:if test="${updateFlag ne 'U' }">
    	<input type="hidden" value="${bandNo}" name="hiddenBandNo">
	    <p class="sendBtnForBandBoardP"><button type="submit" id="sendBtnForBandBoard">글쓰기</button></p>
	</c:if>
	<c:if test="${updateFlag eq 'U' }">
		<input type="hidden" value="${likeCheckForU}" name="likeCheckForU">
	    <p class="sendBtnForBandBoardP"><button type="submit" id="sendBtnForBandBoard">수정</button></p>
	</c:if>
    </form>
</div>
<script>
	if($("#updateFlag").val() == 'U'){
		$("#titleInputForBandBoard").val($("#hiddenTitle").val());
	}

</script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/myBandWrite.js"></script>
<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>