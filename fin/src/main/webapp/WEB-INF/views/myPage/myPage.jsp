<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPage.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPagebootStrap.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPageModal.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src = "${contextPath}/resources/js/myPageModal.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/profile/lookProfile.jsp"/>
    
    <section class="myPageWrapper">
        <section class="myPageInfo">
            <div>
                <span>개다리방방</span>
	               <input type="hidden" value="1" id="hiddenUserNo">
	               <div id="toModalDiv" data-bs-toggle="modal" data-bs-target="#exampleModal">
	                	<ion-icon name="person-circle" id="profileIcon"></ion-icon>
	               </div>
            </div>

            <div class="imgBox">
                <img src="" alt="이미지">
                <form action="">
                    <i class="bi bi-camera-fill"></i>
                </form>
            </div>

            <div>
                <div>
                    <p>My Band</p><button class="btnDisplay">Create</button>
                </div>
            </div>
            
            <div class="ulBox">
                <div class="firstUlBox">
                    <ul>
                        <li>Band</li>
                        <li>Leader</li>
                        <li>Member</li>
                    </ul>
                </div>

                <div class="secondUlBox">
                    <ul>
                        <li><i class="fa-solid fa-headphones-simple"></i>러시아워</li>
                        <li><i class="fa-solid fa-crown"></i>개다리방방</li>
                        <li><i class="fa-solid fa-user-astronaut"></i>초파초</li>
                        <li><i class="fa-solid fa-user-astronaut"></i>길에반스</li>
                        <li><i class="fa-solid fa-user-astronaut"></i>이현경</li>
                        <li><i class="fa-solid fa-user-astronaut"></i>기타못참</li>
                        <li><i class="fa-solid fa-user-astronaut"></i>빌스릴</li>
                    </ul>
                </div>
            </div>
        </section>

        
        
        <section class="myPageList">

            <div class="titleBox">
                <p>My Page</p>
            </div>

            <div class="firstSecWrapper">
                <div class="myPageFirstBox">
                    <ul>
                        <li class="js-static-modal-toggleInfo"><i class="bi bi-person-bounding-box"></i></li>
                        <li class="js-static-modal-toggleBand"><i class="bi bi-people-fill"></i></li>
                        <li class="js-static-modal-togglefindMember"><i class="bi bi-search"></i></li>
                        <li class="js-static-modal-toggleBoard"><i class="bi bi-clipboard"></i></li>
                        <li class="js-static-modal-toggleReply"><i class="bi bi-chat"></i></li>
                        <li class="js-static-modal-toggleBlock"><i class="bi bi-eye-slash"></i></li>
                        
                    </ul>
                </div>

                <div class="myPageSecBox">
                    <p class="js-static-modal-toggleInfoP">회원 정보 수정</p>
                    <p class="js-static-modal-toggleBandP">나의 밴드</p>
                    <p><a href="findingMember" class="findMember">밴드찾기</a></p>
                    <p class="js-static-modal-toggleBoardP">내가 작성한 게시글</p>
                    <p class="js-static-modal-toggleReplyP">내가 작성한 댓글</p>
                    <p class="js-static-modal-toggleBlockP">차단 회원 목록</p>
                </div>
            </div>
        </section>
    </section>


    <!-- block Modal -->
    <div class="container">
        <!-- <button class=" js-static-modal-toggle btn btn-primary " type="button">test</button> -->
        <div id="static-modalBlock" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">

            <form action="">
                <section class="modalBlockWrapper">
                    <div class="modalBlockTitleBox">
                        <p>차단 회원 목록</p>
                    </div>
                    <hr>
                    <div class="modalBlockContentBox">


                        <table class="modalBlockTable">
                            <tr>
                                <td><img src="" alt="">메탈스레기</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">이진영</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">이현경입니다</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">김준수지구</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">김준수입니다</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">임정우입니다</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">김민성</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>

                            <tr>
                                <td><img src="" alt="">민성김입니다</td>
                                <td class="btnBlockTd"><button>차단해제</button></td>
                            </tr>


                        </table>

                    </div>
                </section>
            </form>
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
    </div>

    <!-- reply Modal -->
    <div class="container">
        <!-- <button class=" js-static-modal-toggle btn btn-primary " type="button">test</button> -->
        <div id="static-modalReply" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">

                <section class="modalReplyWrapper">
                    <div class="modalReplyTitle">
                        <p>내가 작성한 댓글</p>
                    </div>

                    <hr>

                    <div class="modalReplyContent">
                        <table>
                            <tr>
                                <td>
                                    <a href="#"><p class="replyContent">얼립시스가 어디까지 적용이 된느지 한 번 볼까</p></a>
                                </td>
                                <td>
                                    <p>10일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#"><p class="replyContent">이현경 천재</p></a>
                                </td>
                                <td>
                                    <p>2일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#"><p class="replyContent">이현경 천재23123</p></a>
                                </td>
                                <td>
                                    <p>7일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#"><p class="replyContent">이현경 천재ㅁ이아어</p></a>
                                </td>
                                <td>
                                    <p>3일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#"><p class="replyContent">이현경 천재ㅁㄴㅇㅁㄴㅇ</p></a>
                                </td>
                                <td>
                                    <p>1일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#"><p class="replyContent">이현경 천재asdasdasdasd</p></a>
                                </td>
                                <td>
                                    <p>3일전</p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
    </div>

    <!-- board Modal -->

    <div class="container">
        <!-- <button class=" js-static-modal-toggleBoard btn btn-primary " type="button">test</button> -->
        <div id="static-modalBoard" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">

                <section class="modalBoardWrapper">

                    <div class="modalBoardTitleBox">
                        <p>내가 작성한 게시글</p>
                    </div>

                    <hr>

                    <div class="modalBoardContent">

                        <table class="modalBoardTable">
                            <tr>
                                <td>
                                    <p>일반게시판</p>
                                </td>
                                <td>
                                    <a href="#">
                                        <p>이건 일반게시글이야아아아 (2)</p>
                                    </a>
                                </td>
                                <td>
                                    <p>10일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p>일반게시판</p>
                                </td>
                                <td>
                                    <a href="#">
                                        <p>이건 일반게시글 제목야아아아 (3)</p>
                                    </a>
                                </td>

                                <td>
                                    <p>10일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p>일반게시판</p>
                                </td>
                                <td>
                                    <a href="#">
                                        <p>이건 일반게시글 제목야아아아 (7)</p>
                                    </a>
                                </td>

                                <td>
                                    <p>10일전</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p>일반게시판</p>
                                </td>
                                <td>
                                    <a href="#">
                                        <p>이건 일반게시글 제목야아아아 (5)</p>
                                    </a>
                                </td>

                                <td>
                                    <p>10일전</p>
                                </td>
                            </tr>



                        </table>
                    </div>


                </section>

                
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
    </div>

    <!-- band Modal -->

    <div class="container">
        <!-- <button class=" js-static-modal-toggleBand btn btn-primary " type="button">test</button> -->
        <div id="static-modalBand" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">

            <form action="">
                <section class="modalBandWrapper">
                    <div class="modalBandTitleBox">
                        <p>밴드 관리</p>
                    </div>

                    <hr>

                    <div class="modalBandTableBox">
                        <table>
                            <tr>
                                <td>
                                    <p class="tdTitle">밴드관리</p>
                                </td>

                                <td>
                                    <p>러시아워</p> 
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="tdTitle">리더</p>
                                </td>

                                <td>
                                    <p>이현경</p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="tdTitle" id="tdMember">멤버</p>
                                </td>
                            </tr>

                        </table>
                    </div>

           
                    <div class="modalBandContentBox">
                        
                        <table>
                            <tr>
                                <td>
                                    <p class="modalContentP">초파초</p>
                                </td>

                                <td>
                                    <p><button>멤버추방</button></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="modalContentP">기타못침21</p>
                                </td>

                                <td>
                                    <p><button>멤버추방</button></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="modalContentP">길에반스</p>
                                </td>

                                <td>
                                    <p><button>멤버추방</button></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="modalContentP">빌스링</p>
                                </td>

                                <td>
                                    <p><button>멤버추방</button></p>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="modalContentP">메탈리카촉</p>
                                </td>

                                <td>
                                    <p><button>멤버추방</button></p>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <hr>

                    <div class="bandDestroyBtnBox">
                        <button>밴드해체</button>
                    </div>
                </section>
            </form>

                
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
              </div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
    </div>


          <!-- info modal -->

    <div class="container">
    <!-- <button class=" js-static-modal-toggleInfo btn btn-primary " type="button">test</button> -->
    <div id="static-modalInfo" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
        <div class="modal-dialog infoModal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>

            <div class="modal-body">
            
            <section class="modalInfoWrapper">
                <div class="modalInfoTitleBox">
                    <p>회원 정보 수정</p>
                </div>
                <form action="">
                    <div class="modalImgBox">
                        <img src="" alt="프사">
                        <i class="bi bi-camera-fill"></i>
                    </div>

                    <div class="modalInputBox">
                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="mail"></ion-icon>
                            </span>
                            <input type="email" required>
                            <label>EMAIL</label>
                        </div>
                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="lock-closed"></ion-icon>
                            </span>
                            <input type="password" required>
                            <label>PASSOWORD</label>
                        </div>

                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="person"></ion-icon>
                            </span>
                            <input type="text" required>
                            <label>NICKNAME</label>
                        </div>
                        

                        <div class="arrowBox">
                            <label for="">나의 포지션</label>
                            <i class="bi bi-caret-down" id="show"></i>
                        </div>
                    </div>

                    <div class="checkWrapper">
                        <p id="positionP" class="disPlayNone">POSITION</p>
                        <div class="positionBox disPlayNone">
                            <table class="positionTable">
                                <tr>
                                    <td>
                                        <input type="checkbox" id="GUITAR" name="GUITAR" value="GUITAR">
                                        <label for="GUITAR">GUITAR</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="BASS" name="BASS" value="BASS">
                                        <label for="BASS">BASS</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" id="DRUM" name="DRUM" value="DRUM">
                                        <label for="DRUM">DRUM</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="checkbox" id="VOCAL" name="VOCAL" value="VOCAL">
                                        <label for="VOCAL">VOCAL</label>
                                    </td>

                                    <td>
                                        <input type="checkbox" id="KEYBOARD" name="KEYBOARD" value="KEYBOARD">
                                        <label for="KEYBOARD">KEYBOARD</label>
                                    </td>

                                    <td>
                                        <input type="checkbox" id="HORN" name="HORN" value="HORN">
                                        <label for="HORN">HORN</label>
                                    </td>
                                </tr>
                            </table>

                            
                        </div>

                        <p id="genreP" class="disPlayNone">GENRE</p>
                        <div class="genreBox disPlayNone">
                            
                            <table class="genreTable">
                                <tr>
                                    <td>
                                        <input type="radio" id="ELECTRONIC" name="genre" value="ELECTRONIC">
                                        <label for="ELECTRONIC">ELECTRONIC</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="ROCK" name="genre" value="ROCK">
                                        <label for="ROCK">ROCK</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="FOLK" name="genre" value="FOLK">
                                        <label for="FOLK">FOLK</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="POP" name="genre" value="POP">
                                        <label for="POP">POP</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="R&B" name="genre" value="R&B">
                                        <label for="R&B">R&B</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="JAZZ" name="genre" value="JAZZ">
                                        <label for="JAZZ">JAZZ</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="METAL" name="genre" value="METAL">
                                        <label for="METAL">METAL</label>
                                    </td>
                                </tr>
                            </table>
                            
                        </div>

                        <p id="locationP" class="disPlayNone">LOCATION</p>
                        <div class="locationBox disPlayNone">
                            
                            <table class="locationTable">
                                <tr>
                                    <td>
                                        <input type="radio" id="seoul" name="location" value="seoul">
                                        <label for="seoul">서울</label>
                                    </td>
                                    <td>
                                        <input type="radio" id="gyeonggi" name="location" value="gyeonggi">
                                        <label for="gyeonggi">경기도</label>
                                    </td>
                                    
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="incheon" name="location" value="incheon">
                                        <label for="incheon">인천</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="daejeon" name="location" value="daejeon">
                                        <label for="daejeon">대전</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="daegu" name="location" value="daegu">
                                        <label for="daegu">대구</label>
                                    </td>
                                    <td>
                                        <input type="radio" id="busan" name="location" value="busan">
                                        <label for="busan">부산</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="ulsan" name="location" value="ulsan">
                                        <label for="ulsan">울산</label>
                                    </td>
                                    <td>
                                        <input type="radio" id="sejong" name="location" value="sejong">
                                        <label for="sejong">세종</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="gwangju" name="location" value="gwangju">
                                        <label for="gwangju">광주</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="gangwon" name="location" value="gangwon">
                                        <label for="gangwon">강원도</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="N-chungcheong" name="location" value="N-chungcheong">
                                        <label for="N-chungcheong">충청북도</label>
                                    </td>
                                    <td>
                                        <input type="radio" id="S-chungcheong" name="location" value="S-chungcheong">
                                        <label for="S-chungcheong">충청남도</label>
                                    </td>
                                    
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="N-gyeongsang" name="location" value="N-gyeongsang">
                                        <label for="N-gyeongsang">경상북도</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="S-gyeongsang" name="location" value="S-gyeongsang">
                                        <label for="S-gyeongsang">경상남도</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="N-jeolla" name="location" value="N-jeolla">
                                        <label for="N-jeolla">전라북도</label>
                                    </td>

                                    <td>
                                        <input type="radio" id="S-jeolla" name="location" value="S-jeolla">
                                        <label for="S-jeolla">전라남도</label>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="radio" id="jeju" name="location" value="jeju">
                                        <label for="jeju">제주도</label>
                                    </td>
                                </tr>
                            </table>
                        
                        </div>
                    </div>
                
                    <div class="infoModifyBtn">
                        <button>수정하기</button>
                    </div>
                </form>
            </section>

            
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    </div>
    
    
    <!-- 멤버 찾기 모달 -->
	<div id="static-modalfindMember" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
          </div>
          <div class="modal-body">
            
            <section class="title">
		<br>
		<br>
				<p id="tt">Find your band companion</p>
			   
				<section class="mainContent">
				
					<!--성별-->
					<div class="gender">
						 <p class="cate">Gender</p>
						 <input type="radio" id="male" name="gender"><label for="male">남자</label>
						 <input type="radio" id="female" name="gender"><label for="female">여자</label>
					</div>
		
					<br>
					<hr class="hr">
				  
	
					<!--장르-->
					<div class="genre">
						 <p class="cate">Genre</p>
						 <input type="radio" id="electronic" name="genre"><label for="electronic">ELECTRONIC</label>
						 <input type="radio" id="rock" name="genre"><label for="rock">ROCK</label>
						 <input type="radio" id="folk" name="genre"><label for="folk">FOLK</label>
						 <input type="radio" id="pop" name="genre"><label for="pop">POP</label>
						 <input type="radio" id="jazz" name="genre"><label for="jazz">JAZZ</label>
						 <input type="radio" id="metal" name="genre"><label for="metal">METAL</label>
						 <input type="radio" id="R&B" name="genre"><label for="R&B">R&B</label>
					</div>
	
					<br>
					<hr class="hr">
	
					<!--포지션-->
					<div class="position">
						<p class="cate">Position</p>
						<input type="checkbox" id="guitar" name="position"><label for="guitar">Guitar</label>
						<input type="checkbox" id="bass" name="position"><label for="bass">Bass</label>
						<input type="checkbox" id="drum" name="position"><label for="drum">Drum</label>
						<input type="checkbox" id="vocal" name="position"><label for="vocal">Vocal</label>
						<input type="checkbox" id="keyboard" name="position"><label for="keyboard">Keyboard</label>
						<input type="checkbox" id="brass/horn" name="position"><label for="brass/horn">Brass/Horn</label>
					</div>
					<br>
					<hr class="hr">
					<!--지역-->
					<div class="locationjw">
						<p class="cate">Location</p>
						<input type="radio" id="seoul2" name="locationjw"><label for="seoul">서울</label>
						<input type="radio" id="gyeonggi2" name="locationjw"><label for="gyeonggi">경기도</label>
						<input type="radio" id="incheon2" name="locationjw"><label for="incheon">인천</label>
						<input type="radio" id="daejeon2" name="locationjw"><label for="daejeon">대전</label>
						<input type="radio" id="daegu2" name="locationjw"><label for="daegu">대구</label>
						<input type="radio" id="busan2" name="locationjw"><label for="busan">부산</label>
						<input type="radio" id="ulsan2" name="locationjw"><label for="ulsan">울산</label>
						<input type="radio" id="sejong2" name="locationjw"><label for="sejong">세종</label>
						<input type="radio" id="gwangju2" name="location"><label for="gwangju">광주</label>
						<input type="radio" id="N-chungcheong2" name="locationjw"><label for="N-chungcheong">충청북도</label>
						<input type="radio" id="S-chungcheong2" name="locationjw"><label for="S-chungcheong">충청남도</label>
						<input type="radio" id="N-gyeongsang2" name="locationjw"><label for="N-gyeongsang">경상북도</label>
						<input type="radio" id="S-gyeongsang2" name="locationjw"><label for="S-gyeongsang">경상남도</label>
						<input type="radio" id="gangwon2" name="locationjw"><label for="gangwon">강원도</label>
						<input type="radio" id="N-jeolla2" name="locationjw"><label for="N-jeolla">전라북도</label>
						<input type="radio" id="S-jeolla2" name="locationjw"><label for="S-jeolla">전라남도</label>
						<input type="radio" id="jeju2" name="locationjw"><label for="jeju">제주도</label>
					<br>
					</div>
	
					<hr class="hr">
					<br>
					<br>                     
				   
	
					<button id="find"><a href="memberList">숨은 나의 멤버 찾기</a></button>
					<br>
					<br>
					<br>
					<br>
		
				</section>
			</section>
	
            
            
          </div><!-- modal body -->
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
 	</div><!-- static modal -->





    
    
    
    
    
   
    
    
    
    
    

 

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src = "${contextPath}/resources/js/myPage.js"></script>
</body>
</html>