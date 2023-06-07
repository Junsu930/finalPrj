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

</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <section class="firstSection">
            <div class="explainBox">
                <ul class="explain">

                    <li>
                        <i class="fa-solid fa-guitar"></i>
                        <spam>ROCK, POP</spam>
                    </li>
                    <li>
                        <i class="bi bi-journals"></i>
                        <spam>보컬, GUITAR</spam>
                    </li>
                    <li>
                        <i class="bi bi-house"></i>
                        <spam>서울</spam>
                    </li>
                    <li>
                        <i class="bi bi-instagram"></i>
                        <spam>@guitarDuck</spam>
                    </li>
                    <li>
                        <i class="bi bi-pencil"></i>
                        <span id="profileExpalin"><br>
                            동작구 개인 연습실에서 레슨합니다.
                            1시간 레슨 한달 기준 15만원입니다.
                            한 분 한 분 케어 레슨 들어갑니다.
                            기초과정 가능</span>
                    </li>
                    
                </ul>
            </div>


            <div class="imgWrap">
                <div class="imgBox">
                    <div>
                        이미지
                    </div>
                    <div>
                        <p>
                            이현경
                        </p>
                        <p>
                            나한테 배워라
                        </p>
                    </div>
                    <div class="chatBox">
                        <button ><i class="bi bi-chat-dots"></i></button>
                        <button id="deleteBtn">DELETE</button>
                    </div>
                </div>
            </div>

    </section>



    <section class="secondSection">
            <div>
                <p>이런 강사는 어때요?</p>
            </div>

            <div class="recommendImgBox">
                <div>이미지</div>
                <div>이미지</div>
                <div>이미지</div>
                <div>이미지</div>
            </div>
            

            <div class="recommendName">
                <div>
                    <p>박재범</p>
                    <p>보컬, 드럼</p>
                </div>
                <div>
                    <p>박재범</p>
                    <p>보컬, 드럼</p>
                </div>
                <div>
                    <p>박재범</p>
                    <p>보컬, 드럼</p>
                </div>
                <div>
                    <p>박재범</p>
                    <p>보컬, 드럼</p>
                </div>
            </div>
    </section>
        


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>