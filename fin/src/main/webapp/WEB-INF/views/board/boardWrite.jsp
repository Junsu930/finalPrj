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
 
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
    <title>중고거래상세페이지</title>
   </head>
   <body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
       <form>
  <div class="container">
    <h1>글쓰기</h1>
    <div class="tagsBox">
    <div class="tagsTitle">글머리</div>
    <div class="tagsBoxDetail">
      <div class="tagNotice"><button>공지사항</button></div>
      <div class="tagBasic"><button>일반게시판</button></div>
      <div class="tagHot"><button>인기게시판</button></div>
    </div>
    </div>
    
    <div class="boardTitle">제목</div>
   <div>
    <input type="text" class="title-input">
    </div>
    <div class="border"></div>
    <div class="boardContent">내용</div>
    <textarea class="content-input"></textarea>
    <div class="submit-button">
      <button>작성</button>
 
    </div>
  </div>
</form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>