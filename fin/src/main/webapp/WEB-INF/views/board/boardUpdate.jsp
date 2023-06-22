<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	 <link rel="stylesheet"href="${contextPath}/resources/css/boardWrite.css"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>
   <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
    <title>WRITE</title>
   </head>
   <body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
       <form action="mody" method="post">
  <div class="container">
    <h1>글쓰기</h1>
    <div class="tagsBox">
    <div class="tagsTitle">글머리</div>
    <div class="tagsBoxDetail">


      <label class="test_obj">
        <input type="radio" class="tagNotice" name="boardTag" value="1">
        <span>공지사항</span>
    </label>
    <label class="test_obj">
      <input type="radio" class="tagBasic" name="boardTag" value="2">
      <span>일반게시판</span>
  </label>
  <label class="test_obj">
    <input type="radio" class="tagHot"  name="boardTag" value="3">
    <span>인기게시판</span>
</label>

    </div>
    </div>
    
    <div class="boardTitle">제목</div>
   <div>
	<input type="hidden" name="userNo" value="${board.userNo}"class="title-input">
	<input type="hidden" name="boardNo" value="${board.boardNo}"class="title-input">
    <input type="text" name="boardTitle" value="${board.boardTitle}" class="title-input">
    </div>
    <div class="border"></div>
    <div class="boardContent">내용</div>
    <textarea id="content" name="boardContent" class="content-input">${board.boardContent}</textarea>
    
    
      <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
			CKEDITOR.replace('content'
			
			);
		</script>
		
		
    <div class="submit-button">
      <button >수정</button>
 
    </div>
  </div>
</form>
<script>

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>