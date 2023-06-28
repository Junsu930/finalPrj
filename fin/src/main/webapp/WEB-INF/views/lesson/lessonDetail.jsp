<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonDeatil</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/lessonDetail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script>
    $(function() {
    $('#recommendImgBox').slick({
      slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
      infinite : true, 	//무한 반복 옵션	 
      slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
      dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,			// 자동 스크롤 사용 여부
      autoplaySpeed : 2500, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,		// 세로 방향 슬라이드 옵션
      prevArrow :	"<button type='button' class='btn'>&#10094</button>",// 이전 화살표 모양 설정
      nextArrow :	"<button type='button' class='btn'>&#10095</button>", // 다음 화살표 모양 설정
      dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
      draggable : true, 	//드래그 가능 여부 
      
      responsive: [ // 반응형 웹 구현 옵션
        {  
          breakpoint: 960, //화면 사이즈 960px
          settings: {
            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
            slidesToShow: 3 
          } 
        },
        { 
          breakpoint: 768, //화면 사이즈 768px
          settings: {	
            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
            slidesToShow: 2 
          } 
        },
        {
          breakpoint : 500,
          settings: {
            slidesToShow: 1
          }
        }
      ]
    });
  })
    
</script>

</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <section class="firstSection">

      
            <div class="explainBox">
              
              
                <ul class="explain">

                    <li>
                        <i class="fa-solid fa-guitar"></i>
                        <span>${lesson.inst}</span>
                    </li>
                    <li>
                        <i class="bi bi-journals"></i>
                        <span>${lesson.genre}</span>
                    </li>
                    <li>
                        <i class="bi bi-house"></i>
                        <span>${lesson.region}</span>
                    </li>
                    <li>
                        <i class="bi bi-instagram"></i>
                        <span>@ ${lesson.socialSite}</span>
                    </li>
                    <li>
                        <i class="bi bi-pencil"></i>
                        <span id="profileExpalin"><br>
                            ${lesson.detailment}</span>
                    </li>
                    
                </ul>
            </div>


            <div class="imgWrap">
                <div class="imgBox">
                    <div class="imgFirstBox">
                        <img src="${contextPath}${lessonImg.imageRename}" alt="">
                    </div>
                    <div class="explainBox">
                        <p>
                            ${lesson.userNick}
                        </p>
                        <p>
                            ${lesson.motto}
                        </p>
                    </div>
                    <div class="chatBox">
                        <c:if test="${sessionScope.loginUser.userNo ne lesson.userNo}">
                          <button ><i class="bi bi-chat-dots"></i></button>
                        </c:if>
                        
                        
                        <c:if test="${sessionScope.loginUser.userNo eq lesson.userNo}">
                          <button id="deleteBtn" type="button" onclick="deleteLesson(hiddenLessonNo)">
                            <i class="bi bi-trash"></i>
                          </button>
                          <input type="hidden" value="${lesson.lessonNo}" id="hiddenLessonNo" name="hiddenLessonNo">
                          <input type="hidden" value="${lesson.userNo}">
                        </c:if>

                        <button id="kakaotalk-sharing-btn" href="javascript:;">
                          <i class="bi bi-share"></i>
                        </button>
                    </div>
                </div>
            </div>
    </section>
    
    
    
    
    
    <section class="secondSection">
      <div>
          <p>다른 분들은 어때요?</p>
      </div>

      <div class="recommendImgBox" id="recommendImgBox">
          <c:if test="${!empty lessonList}">
            <c:forEach var="lessonList" items="${lessonList}">
              <div style="cursor: pointer;" onclick="location.href='/fin/lessonDetail?lessonNo=${lessonList.lessonNo}'">
                <img src="/fin${lessonList.imgSrc}" class="recommendImg">
                <p>${lessonList.userNick}</p>
                <p>${lessonList.genre}</p>
                <p>${lessonList.inst}</p>
              </div>
            </c:forEach>
          </c:if>
      </div>
    </section>
    
    
    
    
    



    
    
    
    
 
  
  
  


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="${contextPath}/resources/js/lessonDetail.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>