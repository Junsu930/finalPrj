<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet"href="${contextPath}/resources/css/transaction/transaction.css"></script>
 <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
 <title>중고거래페이지</title>
</head>
<body>

 <div class="main" >
<!-- 세션 분류 -->

     <div class="topbox">
<!-- 중고거래게시판표시와 검색바  -->
         <div class="mainTitle">중고거래 게시판</div>
         <div class="searchbox">
             <input type="text" id="searchboxInput" >
                 <button type="button" class="searchInputButton">
                     <i class="fa-solid fa-magnifying-glass" class="glass"></i>
                 </button>
         </div>
     </div>
     
     <div class="jb-division-line"></div>
     <!-- 분류선  -->



     <div class="thingTotalBox">
     <!-- 중고거래박스들  -->



         <div class="thingBox">
     <!--중고거래게시물박스 -->
             <div class="thingPicture">first</div>
             <div class="thingsecondbox">
                 <div class="thingssecondTop">
                     <div class="SaleOrSoldout">판매중</div>
                     <div class="thingTitle">피아노 팔게요</div>
             </div>

             <div class="thingsecondBottomBox">
                 <div class="thingsecondBottom">
                     <div class="sellerName">이현경</div>
                     <div class="dot"> · </div>
                     <div class="sellerRegion">전라남도</div>
                 </div>
                 <div class="price">20000원</div>
             </div>

             </div>
     </div>


     <div class="thingBox2">

         <div class="thingPicture">first</div>
         <div class="thingsecondbox">
             <div class="thingssecondTop">
                 <div class="SaleOrSoldout">판매중</div>
                 <div class="thingTitle">피아노 팔게요</div>
         </div>

         <div class="thingsecondBottomBox">
             <div class="thingsecondBottom">
                 <div class="sellerName">이현경</div>
                 <div class="dot"> · </div>
                 <div class="sellerRegion">전라남도</div>
             </div>
             <div class="price">20000원</div>
         </div>

         </div>
 </div>


 

     <div class="thingBox1">

         <div class="thingPicture">first</div>
         <div class="thingsecondbox">
             <div class="thingssecondTop">
                 <div class="SaleOrSoldout">판매중</div>
                 <div class="thingTitle">피아노 팔게요</div>
         </div>

         <div class="thingsecondBottomBox">
             <div class="thingsecondBottom">
                 <div class="sellerName">이현경</div>
                 <div class="dot"> · </div>
                 <div class="sellerRegion">전라남도</div>
             </div>
             <div class="price">20000원</div>
         </div>

         </div>
     </div>
</div>



 
</div>


</body>
</html>