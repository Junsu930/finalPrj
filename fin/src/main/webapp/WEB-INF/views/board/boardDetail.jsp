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
 <link rel="stylesheet" href="${contextPath}/resources/css/reply-style.css">
   <script src="${contextPath}/resources/js/modal.min.js"></script>
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
   
  
    <title>BOARDDETAIL</title>
   </head>
   <body>

<%-- request에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>


     <c:if test="${not empty includeHeader and includeHeader}">
     
 <jsp:include page="/WEB-INF/views/common/header.jsp"/> 
  </c:if>
<c:if test="${ !empty message }">
    <script>
        alert("${message}");
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
    </script>
</c:if> 
<div class="DetailContainer">
    <div class="title-container">
   <c:choose>
            <c:when test="${BoardDetail.boardTag==1}">
              
      <p class="tagsss">잡담</p>
      
      
      		</c:when>
	  <c:otherwise>
      		
      <p class="tagsss">질문</p>
      </c:otherwise> 
    
 
      	
   </c:choose>
   
  
   
   
       
      <div class="BoardDetailTitle">${BoardDetail.boardTitle}</div> 
    </div>
    <div class="info">
      <div class="left">
        <span class="nickname">${BoardDetail.userNick}</span>
        <div class="viewsBox">
        <i class="fa-solid fa-eye"></i>
        <span class="DetailViews">${BoardDetail.readCount}</span>
        </div>
        
        <div class="heartBox">
        <i class="fa-solid fa-heart"></i>
        <span class="hearts">${BoardDetail.boardLike}</span>
        </div>
        <span class="date">${BoardDetail.createDate}</span>
      </div>
      <div class="right">
         <c:if test="${loginUser.userNo == BoardDetail.userNo}">
        <button class="edit" onclick="updateBtn()">수정</button>
        <button class="delete" onclick="deleteBtn()">삭제</button>
        </c:if>
      </div>
    </div>
    
    <div class="content" >
      <p>${BoardDetail.boardContent}
        </p>
    </div>
    <div class="comments">
        
        <div class="commentBoxBox">
      <div class="commentBox">
        <i class="fa-regular fa-comments"></i>
        <span class="comment">11<span class="comment_s">개</span></span>
    </div>
    <div class="commentBox2" onclick="commentBox2()">
    <c:choose>
		    <c:when test="${sessionScope.loginUser != null}">
		     <div class="addLike()">
		        <svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-6 h-6">
                <path  d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                </svg>
		     </div>
		    </c:when>
		    <c:otherwise>
		     <a href='${contextPath}/login'>
		     
		        <svg id="heart" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-6 h-6">
                <path  d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z" />
                </svg>		     
		     </a>
		    </c:otherwise>
		   </c:choose>

    </div>
    	 <span id='like_Check' style='margin-left: 3px;'>${BoardDetail.boardLike}</span>
    	 <span style='margin-left: 3px;'>like</span>
    </div>
        <button class="report">신고</button>
    </div>
    <div class="divider"></div>


  <!-- 댓글 -->
        <jsp:include page="/WEB-INF/views/board/reply.jsp"/>
</div>
<jsp:include page="/WEB-INF/views/board/boardMain.jsp"/> 

    <script>
        // 댓글 관련 JS 코드에 필요한 값을 전역 변수로 선언

        // jsp 파일 : html, css, js, el, jstl 사용 가능
        // js  파일 : js

        // 코드 해석 순서  :   EL == JSTL > HTML > JS

        // ** JS 코드에서 EL/JSTL을 작성하게 된다면 반드시 ""를 양쪽에 추가 **

        // 최상위 주소
        const contextPath = "${contextPath}";
        
        // 게시글 번호
        const boardNo = "${BoardDetail.boardNo}"; // "500"

        // 로그인한 회원 번호
        const loginMemberNo = "${loginUser.userNo}";
        // -> 로그인 O  : "10";
        // -> 로그인 X  : "";  (빈문자열)

        
    </script>



<script>


const updateBtn= () => {
	const boardNo = '${BoardDetail.boardNo}';
	  
	location.href = "update?boardNo=" + boardNo ;
}

	
	

const deleteBtn= () => {
	const boardNo = '${BoardDetail.boardNo}';
	   if (!confirm("정말 삭제하시겠습니까?")) {
		   location.href = "/board";
		   
	    } else {
	    	location.href = "delete?boardNo=" + boardNo ;
	   
	    }
	
	
	}
	
	
</script>
<script src = "${contextPath}/resources/js/boardDetail.js"></script>
    <script src="${contextPath}/resources/js/reply.js"></script>

</body>
</html>