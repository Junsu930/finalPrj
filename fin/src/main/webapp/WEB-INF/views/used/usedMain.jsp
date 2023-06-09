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
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
	 <link rel="stylesheet"href="${contextPath}/resources/css/usedMain.css"></script>
 
    <script src="https://kit.fontawesome.com/555e979a9d.js" crossorigin="anonymous"></script>   
    <title>중고거래페이지</title>
   </head>
   <body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="main" >
    
<!-- 세션 분류 -->

		<div class="usedSvgBox">
	        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1205 768">
	            <g id="usedBack">
	              <path class="usedPath" d="m392.5,359.5c-11.5,3.23-20.48,5.58-26,7-13.48,3.46-20.02,4.88-25,11-1.33,1.63-5.06,6.22-4,11,1.3,5.87,9.08,8.66,16,11,23.5,7.96,40,12,40,12,33.14,8.12,25.55,9.05,42,12,0,0,11.5,2.06,26,10,5.77,3.16,6.99,4.56,7,6,.03,3.97-10.65,7.37-32,14-45.48,14.12-22.91,6.68-29,9-2.77,1.06-7.47,2.91-8,2-.53-.91,3.3-4.16,9-9,4.76-4.04,7.45-5.96,11-10,1.87-2.13,4.6-5.24,4-6-.78-.99-7.06,2.19-12,6-2.89,2.23-3.05,2.93-8,7-6.03,4.96-7.76,5.55-9,5-1.29-.57-2.08-2.4-2-4,.12-2.53,2.37-3.92,10-10,4.27-3.4,5.91-4.83,6-7,.07-1.56-.66-3.54-2-4-1.83-.63-3.76,1.93-9,7,0,0-4.14,4-12,10-2.46,1.87-5.21,3.86-9,4-.82.03-3.55.13-4-1-.4-1.02,1.26-2.48,9-9,3.29-2.77,5.99-5.04,8-9,.77-1.52,1.65-3.24,1-4-1.33-1.56-8.33,1.89-13,5-5.36,3.57-5.95,5.54-11,8-1.11.54-7.62,3.7-9,2-1.33-1.64,2.44-7.38,6-11,2.87-2.92,4.69-3.53,11-9,2.81-2.43,4.21-3.66,4-4-.56-.92-11.63,3.39-22,10-2.77,1.76-6.36,4.25-12,6-.84.26-8.25,2.53-9,1-.8-1.62,6.18-6.97,11-10,4.74-2.98,7.72-3.91,13-8,2.84-2.2,5.39-4.17,5-5-.76-1.6-12.5,1.19-23,6-6.28,2.88-10.24,5.61-18,7-1.11.2-8.47,1.52-9,0-.77-2.22,13.54-9.29,17-11,10.54-5.21,16.24-6.62,16-8-.3-1.7-9.35-1.89-17-1-7.12.83-8.05,2.01-27,8-5.72,1.81-12.73,3.95-21,9-5.82,3.56-7.05,5.37-7,7,.08,2.61,3.49,4.72,14,9,10.06,4.1,16.73,6.16,22,8,8.77,3.06,16.94,5.92,25,11,10.32,6.5,16.26,14.02,21,20,4.38,5.54,14.01,17.96,19,37,3.37,12.85,3.28,23.59,3,29-.13,2.58,1.62,10.14-2,15-.55.74-1.81,2.38-4,3,0,0-3,.85-6-1-1.26-.77-3.42-3.24-3-16,.17-5.18.62-7.9,2-20,.97-8.5.76-7.27,1-9,1.86-13.34,2.93-21.01,8-27,5.27-6.24,12.6-7.96,17-9,12.56-2.96,23,1.21,30,4,4.83,1.93,11.49,4.66,18,11,6.41,6.24,9.2,12.6,12,19,5.06,11.55,6.25,21.38,7,28,1,8.81.63,14.82,0,25-.87,14.2-2.64,19.1-6,23-1.6,1.85-4.93,5.71-8,5-6.18-1.43-6.7-20.27-7-31-.35-12.5-.6-21.84,3-34,3.08-10.4,6.67-22.49,18-31,9.42-7.07,19.66-8.26,26-9,3.25-.38,13.01-1.26,25,2,6.08,1.65,15.89,4.32,24,12,9.78,9.26,11.81,20.82,15,39,.77,4.37,1.18,15.25,2,37,.39,10.25.7,21.66-4,35-1.64,4.65-3.6,10.07-6,10-5.64-.16-8.75-30.5-9-33-1.16-11.77-2.56-27.27,2-47,4.18-18.09,7.51-32.52,20-44,15.44-14.2,36-15.73,53-17,9.65-.72,19.48-.73,29,1,3.35.61,5.22,1.15,7,0,6.23-4.02-2.36-19.96,5-33,3.19-5.65,9-9,9-9,.91-.59,2.87-1.8,6-3,9.27-3.57,16.48-4.04,28-5,6.99-.58-12.05.83,19-2,21.66-1.98,31.15-2.69,46-4,22.3-1.97,20.93-2.14,33-3,10.03-.71,19.02-.81,37-1,14.14-.15,19.14.04,25,3,7.93,4,12.03,10.41,15,15,6.34,9.81,7.89,19.54,11,39,0,0,1.52,9.51,2,23,.4,11.19-.23,17.02-4,22-1.37,1.81-4.1,5.41-7,5-7.01-.99-8.81-24.52-9-27-.49-6.4-.26-11.72,2-29,4.62-35.26,7.26-40.53,11-45,2.01-2.4,8.77-10.5,19-12,2.41-.35,4.61-.23,9,0,8.89.48,11.83,2,19,2,7.96,0,9.25-.31,10-1,2.42-2.2,1.7-5.84,1-14-.05-.59-1.16-13.7-1-24,.18-11.9,1.96-13.74,0-17-4.33-7.19-17.85-6.37-25-6-22.31,1.17-44.67.35-67,1-19.82.58-23.26-.03-42,1-11.76.65-12.27.99-29,2-16.75,1.01-18.86.82-40,2-4.26.24-15.5.88-30,2-11.51.89-18.49,1.58-27,3-5.81.97-12.61-.75-15,3-1.06,1.67-.58,3.13-1,7,0,0-.63,5.1-3,11-4.08,10.12-45.2,7.37-68,6-33.58-2.01-30.93-1.22-55-3-26.48-1.96-40.06-3-57-6-10.65-1.88-15.91-3.28-32-6,0,0-10.32-1.87-34-5-12.41-1.64-16.71-2.01-17-1-.55,1.93,14.07,7.64,15,8,9.31,3.61,21.38,7.14,46,10,7.42.86,28.1,3.08,41,8,0,0,5.42,2.07,11,7,3.47,3.07,6.6,5.84,6,9-.55,2.87-4.05,5.37-7,5-3.9-.49-5.87-5.89-7-9-3.33-9.14-4.78-25.71,5-40,9.73-14.22,25.1-18.21,32-20,4.49-1.17,7.94-1.53,14-2,30.39-2.38,45-2,45-2,21.22.55,44.81.04,92-1,10.71-.23,1.33-.19,87-6,.79-.05,38.18-2.59,75-12,5.61-1.43,17.32-4.59,30-13,5.09-3.38,13.72-9.23,21-20,5.3-7.85,11.05-16.36,10-28-.89-9.87-6.46-19.79-15-25-4.99-3.04-9.68-3.68-12-4-51.65-7.05-35.51-6.86-51-7-68.65-.63-43.55-1.27-75-1,0,0-23.97.2-68-3-18.39-1.34-29.63-2.6-35-11-7.27-11.39.12-29.86,1-32,1.97-4.77,4.65-8.85,10-17,3.61-5.5,6.62-11.36,10-17,2.47-4.12,3.65-6.03,3-8-1.51-4.59-11.61-4.89-15-5-5.92-.2-7.45.92-16,2-5.06.64-9.7.76-19,1-10.04.26-17.84.06-20,0-15.86-.45-17.36-1.56-23,0-7.48,2.06-12.73,6.19-15,8-5.42,4.34-8.53,8.83-10,11-12.18,17.92-24.76,36.88-32,47-3.52,4.92-8.68,11.28-19,24-7.46,9.2-15.47,19.07-26,31-17.01,19.28-18.12,17.64-31,33-3.36,4.01-9.99,12.09-21,25-1.98,2.32-5.04,3.61-6,7-1.06,3.76.33,8.17,3,11,2.48,2.63,5.61,3.41,9,4,13.22,2.31,21,1,21,1,17.43-2.94,35.37-.73,53-2,3.4-.25,22.27-1.16,60-3,18.5-.9,35-1.6,68-3,70.36-2.98,63.18-2.38,72-3,15.25-1.07,35.17-2.76,64-3,5.87-.05,10.73-.03,14,0"/>
	            </g>
	        </svg>
    	</div>

        <div class="topbox">
<!-- 중고거래게시판표시와 검색바  -->
            <div class="mainTitle">중고거래 게시판</div>
            <div class="searchbox">
                <input type="text" id="searchboxInput" >
                    <button type="button" class="searchInputButton">
                        <i class="fa-solid fa-magnifying-glass" ></i>
                    </button>
            </div>
        </div>
        
        <div class="jb-division-line"></div>
        <!-- 분류선  -->


<div class="thingTotalContainer">
        <div class="thingTotalBox">
        <!-- 중고거래박스들  -->




            <div class="thingBox" onclick="location.href='${contextPath}/usedDetail'">
        <!--중고거래게시물박스 -->
                <div class="thingPicture">
                
              	<img src="${contextPath}/resources/images/guitar.jpg" id="guitarImg"></div>
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
   

        <div class="thingBox">

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
 

    

        <div class="thingBox">

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
   

        <div class="thingBox">

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
 

    

        <div class="thingBox">

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
   

        <div class="thingBox">

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
 

    

        <div class="thingBox">

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

    
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>