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
	 <link rel="stylesheet"href="${contextPath}/resources/css/boradMain.css"></script>
 
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
    <title>중고거래상세페이지</title>
   </head>
   <body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="boardContainer">
    <h1>전체 게시판</h1>
    <div class="naviBar">
      <ul>
        <li><a href="#" class="total">전체</a></li>
        <li><a href="#">공지</a></li>
        <li><a href="#">인기게시판</a></li>
        <li><a href="#">일반게시판</a></li>
      </ul>
   </div>
<div>

</div>
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
          <th  a href="#" class="title">게시물 제목 1</td>
          <td><span class="tagNotice">공지사항</span></td>
          <th class="ninkName">작성자1</td>
          <th class="views">10</td>
          <th class="heart">5</td>
        </tr>
        <tr>
            <th class="boardNumber">공지</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="boardDetail" class="title">게시물 제목 2</a></td>
          <td><span class="tagHot">인기게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
          <td><span class="tagBasic">일반게시판</span></td>
          <th class="ninkName">작성자2</td>
          <th class="views">5</td>
          <th class="heart">3</td>
        </tr>
        <tr>
            <th class="boardNumber">2</td>
          <th  a href="#" class="title">게시물 제목 2</td>
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
  <button class="write"><a href="boardWrite">글쓰기</a></button>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>