<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonWriting</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/lessonWriting.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
   
    <section class="allSection">
  

	<form method ="post" action="writeLessonForm" id="writeLessonForm" enctype="multipart/form-data">
        <div class ="imgbox">
 			<label for="img1">
	 			<img id="imageInsertPic" src="${contextPath}/resources/images/imageinsert.png">
 			</label>
 			<input type="file" class="inputImage" id="img1" name="images" accept="image/*">
 		</div>

            <!-- input 박스 요소들 -->
            <div class="inputBox">
			
			<!-- 이름 -->
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="Name"></ion-icon>
                    </span>
                    <input id="lessonNamePlace" name="userNick" type="text" maxlength="5" required>
                    <label>NAME</label>
                </div>

                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="lessonLocationPlace" name="userRegion" type="text" maxlength="5" required>
                    <label>LOCATION</label>
                </div>

                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="person"></ion-icon>
                    </span>
                   <input id="lessonSocialPlace" name="userSocial" type="text" maxlength="10" required>
                    <label>SOCIAL MEDIA</label>
                </div>

                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="person"></ion-icon>
                    </span>
                    <input id="lessonMottoPlace" name="userMotto" type="text" maxlength="10" required>
                    <label>MOTTO</label>
                </div>

                <div class="input-box inputBoxText">
                    <span class="icon">
	                        <ion-icon name="person"></ion-icon>
                    </span>
                    <textarea name="userDetailExplain" id="lessonDetailExplain" cols="30" rows="10" required></textarea>
                    <label class="textLabel">TELL YOUR STROY</label>
                </div>

            </div>



	
            <div class="lessonCheckWrapper">

                <div class="genreWrapper">
                    <p id="genreP" class="">GENRE</p>
                    

                    <div class="genreBox">
                        <table class="genreTable">
                            <tr>
                                <td>
                                    <input type="radio" id="ELECTRONIC" name="genre" value="ELECTRONIC">
                                    <label for="ELECTRONIC">ELECTRONIC</label>
                                </td>
                                <td>
                                    <input type="radio" id="AQUSTIC" name="genre" value="AQUSTIC">
                                    <label for="AQUSTIC">AQUSTIC</label>
                                </td>
                                <td>
                                    <input type="radio" id="FOLK" name="genre" value="FOLK">
                                    <label for="FOLK">FOLK</label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="radio" id="BLUES" name="genre" value="BLUES">
                                    <label for="BLUES">BLUES</label>
                                </td>

                                <td>
                                    <input type="radio" id="METAL" name="genre" value="METAL">
                                    <label for="METAL">METAL</label>
                                </td>

                                <td>
                                    <input type="radio" id="JAZZ" name="genre" value="JAZZ">
                                    <label for="JAZZ">JAZZ</label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="radio" id="ROCK" name="genre" value="ROCK">
                                    <label for="ROCK">ROCK</label>
                                </td>

                                <td>
                                    <input type="radio" id="POP" name="genre" value="POP">
                                    <label for="POP">POP</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
 


                <div class="lessonWrapper">
                    <p id="lessonP" class="">LESSON</p>
 
                    <div class="lessonBox">
                        <table class="lessonTable">
                            <tr>
                                <td>
                                    <input type="radio" id="GUITAR" name="inst" value="GUITAR">
                                    <label for="GUITAR">GUITAR</label>
                                </td>
                                <td>
                                    <input type="radio" id="BASS" name="inst" value="BASS">
                                    <label for="BASS">BASS</label>
                                </td>
                                <td>
                                    <input type="radio" id="KEYBOARD" name="inst" value="KEYBOARD">
                                    <label for="KEYBOARD">KEYBOARD</label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="radio" id="VOCAL" name="inst" value="VOCAL">
                                    <label for="VOCAL">VOCAL</label>
                                </td>

                                <td>
                                    <input type="radio" id="SOUND" name="inst" value="SOUND">
                                    <label for="SOUND">SOUND</label>
                                </td>

                                <td>
                                    <input type="radio" id="COMPOSITION" name="inst" value="COMPOSITION">
                                    <label for="COMPOSITION">COMPOSITION</label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <input type="radio" id="DRUM" name="inst" value="DRUM">
                                    <label for="DRUM">DRUM</label>
                                </td>

                                <td>
                                    <input type="radio" id="HORN" name="inst" value="HORN">
                                    <label for="HORN">HORN</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="writingBtnBox">
                <button type="button" id="writingBtn">SUBMIT</button>
            </div>
        </form>
    </section>




    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src = "${contextPath}/resources/js/lessonWriting.js"></script>
</body>
</html>