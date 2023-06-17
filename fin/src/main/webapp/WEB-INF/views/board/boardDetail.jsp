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
      <p class="tagsss">공지사항</p>
      <h1 class="BoardDetailTitle">밴드아카이브 이용 안내 </h1>
    </div>
    <div class="info">
      <div class="left">
        <span class="nickname">이갈치</span>
        <div class="viewsBox">
        <i class="fa-solid fa-eye"></i>
        <span class="DetailViews">111</span>
        </div>
        
        <div class="heartBox">
        <i class="fa-solid fa-heart"></i>
        <span class="hearts">111</span>
        </div>
        <span class="date">20.05.05</span>
      </div>
      <div class="right">
        <button class="edit">수정</button>
        <button class="delete">삭제</button>
      </div>
    </div>
    
    <div class="content">
      <p>공모명: [국방난제해결 아이디어 공모전] 해군 함정 기동 시 소음의 획기적 감소 방안
        분야: 기획/ 아이디어/ 공학/ 기타
        주최사: 정부/공공기관
        <br>
        
        주제: 해군 함정 기동 시 획기적인 수중 소음 감소
        <br>
        활동내용: 적군 잠수함이 우리 해군 함정을 포착하기 어렵도록 함정 기동 시 적의 탐지를 회피할 수 있는 방안을 마련해주세요.
        <br>
        과제 배경 : 북한이 주요 비대칭 전략으로 운영 중인 잠수함은 전시에 아군 함정에 가장 위협이 되는 전력.
        <br>
        
        
        
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