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
	 <link rel="stylesheet"href="${contextPath}/resources/css/boardDetail.css"></script>
 
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
    <title>중고거래상세페이지</title>
   </head>
   <body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <div class="container">
    <div class="title-container">
      <p class="tagsss">공지사항</p>
      <h1 class="title">밴드아카이브 이용 안내 </h1>
    </div>
    <div class="info">
      <div class="left">
        <span class="nickname">이갈치</span>
        <div class="viewsBox">
        <i class="fa-solid fa-eye"></i>
        <span class="views">111</span>
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
        
        주제: 해군 함정 기동 시 획기적인 수중 소음 감소
        
        활동내용: 적군 잠수함이 우리 해군 함정을 포착하기 어렵도록 함정 기동 시 적의 탐지를 회피할 수 있는 방안을 마련해주세요.
        
        과제 배경 : 북한이 주요 비대칭 전략으로 운영 중인 잠수함은 전시에 아군 함정에 가장 위협이 되는 전력.
        
        
        
        
        </p>
    </div>
    <div class="comments">
        <div class="commentBoxBox">
      <div class="commentBox">
        <i class="fa-regular fa-comments"></i>
        <span class="comment">11<span class="comment_s">개</span></span>
     
    </div>
    <div class="commentBox2">
       
        <i class="fa-regular fa-heart" style="color: #fe0b0b;"></i>
        <span class="commentHeartss">좋아요</span>
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
        <p class="and">｜</p>
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
          <p class="and">｜</p>
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

    <div class="comment-input">
        <div class="inputDetail">
      <textarea type="text"  placeholder=" 댓글을 남겨보세요" class="inputWi"></textarea>
    </div>
      <button class="submit">글쓰기</button>
    </div>
  </div>
  <div class="boardContainer">
  
    <nav>
      <ul>
        <li><a href="#" class="total">전체</a></li>
        <li><a href="#">공지</a></li>
        <li><a href="#">인기게시판</a></li>
        <li><a href="#">일반게시판</a></li>
      </ul>
    </nav>

    <table>
      <thead>
        <tr>
          <th class="boardNumber">번호</th>
          <th class="title">제목</th>
          <th></th>
          <th class="ninkName"><i class="fa-solid fa-user"></i></th>
          <th class="views"><i class="fa-solid fa-eye"></i></th>
          <th class="heart"><i class="fa-solid fa-heart"></i></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th class="boardNumber">공지</td>
          <th class="title">게시물 제목 1</td>
          <td><span class="tagNotice">공지사항</span></td>
          <th class="ninkName">작성자1</td>
          <th class="views">10</td>
          <th class="heart">5</td>
        </tr>
        <tr>
            <th class="boardNumber">공지</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagHot">인기게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        
      </tbody>
    </table>
    <div class="pagination-search">
        <div class="pagination">
            <a href="#"><span>1</span></a>
            <a href="#" class="active"><span>2</span></a>
          </div>
        <div class="search-box">
          <select id="nav-select">
            <option value="all">전체</option>
            <option value="notice">공지</option>
            <option value="popular">인기게시판</option>
            <option value="general">일반게시판</option>
          </select>
          <input type="text" placeholder="글 검색">
          <button type="button">검색</button>
      </div>
    </div>
  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>