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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	 <link rel="stylesheet"href="${contextPath}/resources/css/boardDetail.css"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"/>
   <link rel="stylesheet" href="${contextPath}/resources/css/global.css">

   <script src="${contextPath}/resources/js/modal.min.js"></script>
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
   
    <title>BOARDDETAIL</title>
   </head>
   <body>

     <c:if test="${not empty includeHeader and includeHeader}">
     
 <jsp:include page="/WEB-INF/views/common/header.jsp"/> 
  </c:if>

<div class="DetailContainer">
    <div class="title-container">
   <c:choose>
            <c:when test="${board.boardTag==1}">
              
      <p class="tagsss">질문</p>
      
      
      		</c:when>
	  <c:otherwise>
      		
      <p class="tagsss">잡담</p>
      </c:otherwise> 
    
 
      	
   </c:choose>
   
   
   
       
      <h1 class="BoardDetailTitle">${board.boardTitle}</h1> 
    </div>
    <div class="info">
      <div class="left">
        <span class="nickname">${board.userNo}</span>
        <div class="viewsBox">
        <i class="fa-solid fa-eye"></i>
        <span class="DetailViews">${board.readCount}</span>
        </div>
        
        <div class="heartBox">
        <i class="fa-solid fa-heart"></i>
        <span class="hearts">${board.boardLike}</span>
        </div>
        <span class="date">${board.createDate}</span>
      </div>
      <div class="right">
        <button class="edit">수정</button>
        <button class="delete">삭제</button>
      </div>
    </div>
    
    <div class="content">
      <p>${board.boardContent}
        </p>
    </div>
    <div class="comments">
        <div class="commentBoxBox">
      <div class="commentBox">
        <i class="fa-regular fa-comments"></i>
        <span class="comment">11<span class="comment_s">개</span></span>
     
    </div>
   
    <div class="commentBox2">
    	<svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-6 h-6">
            <path  d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
        </svg>
        <span class="commentHeartss">like</span>
    </div>
    </div>
        <button class="report">신고</button>
  

    </div>
    <div class="divider"></div>
    <div class="author">
      
      <div class="author-info">
        <p class="commentNickName">이갈치</p>
        <span class="author-name">작성자</span>
        <span class="author-date">22.05.00</span>
      </div>
      <div class="right">
        <button class="edit">수정</button>
        <button class="reply">답글</button>
      </div>
    </div>
    <div class="author-comment">
      <p>안녕하세요 이갈치입니다 잘부탁드립니다 하하</p>
    </div>


    <div class="author">
      
        <div class="author-info">
          <p class="commentNickName">이갈치</p>
         
          <span class="author-date">22.05.00</span>
        </div>
        <div class="right">
          <button class="edit">수정</button>
          <button class="reply">답글</button>
        </div>
      </div>
      <div class="author-comment">
        <p>안녕하세요 이갈치입니다 잘부탁드립니다 하하</p>
      </div>


      <div class="author-reply">
      
        <div class="author-info">
          <p class="commentNickName">이갈치</p>
          <span class="author-name">작성자</span>
          <span class="author-date">22.05.00</span>
        </div>
        <div class="right-reply">
          <button class="replyDelete">삭제</button>
         
        
        </div>
      </div>
      <div class="author-comment-reply">
        <p>안녕하세요 이갈치입니다 잘부탁드립니다 하하</p>
      </div>

    <!-- <div class="comment-input">        
        <div class="inputDetail">
      <textarea type="text"  placeholder=" 댓글을 남겨보세요" class="inputWi"></textarea>
    </div>
      <button class="submit">글쓰기</button>
    </div>
  </div> -->
  
  


</div>
<jsp:include page="/WEB-INF/views/board/boardMain.jsp"/> 


<script src = "${contextPath}/resources/js/boardDetail.js"></script>
</body>
</html>