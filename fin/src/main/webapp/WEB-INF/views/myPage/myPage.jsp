<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
	dl, ol, ul {
	    margin-top: 0;
	    margin-bottom: 0;
	    padding-left: 0;
	}
	body{
		line-height: normal;	
	}
	button, input, optgroup, select, textarea {
	    font-family : revert;
	    font-size: revert;
	    line-height: inherit;
	}

    p{
        margin-bottom: 0;
    }
	
	a:hover {
    color: revert;
	}
</style>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <section class="myPageWrapper">
        <section class="myPageInfo">
            <div>
                <span>${loginUser.userNick}</span>
               <ion-icon name="person-circle" id="profileIcon"></ion-icon>
            </div>

            <div class="imgBox">
                <c:if test="${empty loginUser.profileImg}">
                	<img src="${contextPath}/resources/images/guitarduck.png" id="profile-image">
                </c:if>

                <c:if test="${!empty loginUser.profileImg}">
                     <img src="${contextPath}${loginUser.profileImg}" id="profile-image">
                </c:if>
                
            </div>

            <div>
                <div>
                    <p>My Band</p><button class="btnDisplay">Create</button>
                </div>
            </div>
            

                    <c:choose>
                        <c:when test="${empty bandMem}">
                            <p>밴드가 없습니다</p>
                        </c:when>
                        <c:otherwise>

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
                                <li><i class="fa-solid fa-headphones-simple"></i>${bandMem[0].bandName}</li>
                                 <li><i class="fa-solid fa-crown"></i>${bandMem[0].leaderNick}</li>
        
                                <c:forEach var="bandMem" items="${bandMem}">
                                    <li><i class="fa-solid fa-user-astronaut"></i>${bandMem.userNick}</li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
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
                        <li class="js-static-modal-toggleBand"><i class="bi bi-people"></i></li>
                        <li class="js-static-modal-toggleBoard"><i class="bi bi-clipboard"></i></li>
                        <li class="js-static-modal-toggleReply"><i class="bi bi-chat"></i></li>
                        <li class="js-static-modal-toggleBlock"><i class="bi bi-emoji-angry"></i></li>
                        <li class="js-static-modal-toggleGroup"><i class="bi bi-music-player"></i></li>
                    </ul>
                </div>

                <div class="myPageSecBox">
                    <ul>
                        <li class="js-static-modal-toggleInfoP"><p>회원 정보 수정</p></li>
                        <li class="js-static-modal-toggleBandP"><p>나의 밴드</p></li>
                        <li class="js-static-modal-toggleBoardP"><p>내가 작성한 게시글</p></li>
                        <li class="js-static-modal-toggleReplyP"><p>내가 작성한 댓글</p></li>
                        <li class="js-static-modal-toggleBlockP" name="banList" id="banList"><p>차단 회원 목록</p></li>
                        <li class="js-static-modal-togglegroupP"><p>밴드 생성</p></li>
                    </ul>
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

                <section class="modalBlockWrapper">
                    <div class="modalBlockTitleBox">
                        <p>차단 회원 목록</p>
                    </div>
                    <hr>
                    <div class="modalBlockContentBox">


                        <table class="modalBlockTable">
                            <c:choose>
                                <c:when test="${empty banList}">
                                    <p>차단 회원이 없습니다</p>
                                </c:when>
                                <c:otherwise>
                                	<c:forEach var="banList" items="${banList}">
                                        <form action="fin/ban" method="post">
                    
                                		<tr>
                                            <input type="hidden" value="${banList.bannedUserNo}" id="bannedUserNo" name="bannedUserNo">
                                        	<td id>${banList.bannedUserNick}</td>
                                        	<td class="btnBlockTd"><button>차단해제</button></td>
                                    	</tr>

                                        </form>
                                	</c:forEach>
                                </c:otherwise>

                            </c:choose>
                         
                         
                        </table>

                    </div>
                </section>
            
                
              </div>
              <div class="modal-footer">
               
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
                    	
                    	<c:choose>
                    		<c:when test="${empty rList}">
                    			<tr>
                    				<td>
                    					<p>작성한 댓글이 없습니다</p>
                    				</td>
                    			</tr>
                    		</c:when>
                    		
                    		<c:otherwise>
                    			
                    			<c:forEach var="rList" items="${rList}" end="20">
                    				<tr>
                                		<td>
                                    		<a href="#"><p class="replyContent">${rList.replyContent}</p></a>
                                		</td>
                                		<td>
                                    		<p>${rList.createDate}</p>
                                		</td>
                            		</tr>        
                            		         			
                    			</c:forEach>
                    		
                    		</c:otherwise>
                    	</c:choose>
                                      
                            
                        </table>
                    </div>
                </section>

              </div>
              <div class="modal-footer">
                
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
                        	
                        	<c:choose>
                        		<c:when test="${empty boardList}">
                        			<tr>
                        				<td>
                        					<p>작성 글이 존재하지 않습니다</p>
                        				</td>
                        			</tr>
                        		</c:when>
                        		
                        		<c:otherwise>
                        			<c:forEach var="board" items="${boardList}" end="20">
                        				<tr>
                                			<td>
                                    			<p>일반게시판</p>
                                			</td>
                                			<td>
                                    			<a href="boardDetail?boardNo=${board.boardNo}" >
                                        		<p>${board.boardTitle}</p>
                                    			</a>
                                			</td>
                                			<td>
                                    			<p>${board.createDate}</p>
                                			</td>
                            			</tr>
                        			
                        			</c:forEach>
                        		</c:otherwise>
                        		                                              	
                        	</c:choose>
                        	                          
                        </table>
                    </div>


                </section>
                                               
                
              </div>
              <div class="modal-footer">
                
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

            
                <section class="modalBandWrapper">
                    <div class="modalBandTitleBox">
                        <p>밴드 관리</p>
                    </div>

                    <hr>

                    <div class="modalBandTableBox">
                        <table>
                            <tr>
                                <td>
                                    <p class="tdTitle upTitle">밴드관리</p>
                                </td>

                                <td>
                                    <p class="tdTitle upTitle">${bandMem[0].bandName}</p> 
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <p class="tdTitle upTitle">리더</p>
                                </td>

                                <td>
                                    <p class="tdTitle upTitle">${bandMem[0].leaderNick}</p>
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
                        
                        	<c:forEach var="bandMem" items="${bandMem}">
                        		<form action="fin/exile" method="POST">
                        		
                        		<input type="hidden" value="${bandMem.userNo}" id="exileNo" name="exileNo">
                        		
                        		<tr>
                                	<td>
                                    	<p class="modalContentP">${bandMem.userNick}</p>
                                	</td>
                                	
                                	<c:choose>
                                	                              		                              	
                                		<c:when test="${loginUser.userNo eq bandMem.leaderNo}" >
                                		                                		
                                		
                                			<td>
                                    			<p><button>멤버추방</button></p>
                                			</td>
                                			                               			                                			                               			
                                		</c:when>
                                		
                                		
                                		<c:otherwise>                               		                                		
                                		</c:otherwise> 
                                		                                	                              		                                	
                                	</c:choose>                               	
                            	</tr>      
                            	</form>              	                                    	                                 
                        	</c:forEach>
                            
                        </table>
                    </div>

                    <hr>
                    
                    <c:choose>
                    	<c:when test="${loginUser.userNo eq bandMem[0].leaderNo}">
                    		<div class="bandDestroyBtnBox">
                    			
                    			
                    			<form action="fin/dismiss"  method="GET">
                    			<input type="hidden" value="${bandMem[0].bandNo}" id="bandNo" name="bandNo">
                        			<button id="dismissbtn">밴드해체</button>
                        		</form>
                    		</div>
                    	
                    	</c:when>
                    	
                    	<c:otherwise>
                    
                    
                    	</c:otherwise>
                    </c:choose>
                    

                   
                </section>

                
                
              </div>
              <div class="modal-footer">

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
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
            </div>

            <div class="modal-body">
            
            <section class="modalInfoWrapper">
                <div class="modalInfoTitleBox">
                    <p>회원 정보 수정</p>
                </div>
                <form action="fin/updateInfo" method="POST" enctype="multipart/form-data">
             	
                
                    <div class="modalImgBox">
                        <c:if test="${empty loginUser.profileImg}">
                            <img src="${contextPath}/resources/images/guitarduck.png" id="profile-image">
                        </c:if>

                        <c:if test="${!empty loginUser.profileImg}">
                            <img src="${contextPath}${loginUser.profileImg}" id="profile-image">
                        </c:if>
                        <i class="bi bi-camera-fill" id="fileImg"><input type="file" required name="uploadImage" id="inputimage" accept="image/*"></i>              
                    </div>
                
                    <div class="modalInputBox">
                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="lock-closed"></ion-icon>
                            </span>
                            <input type="password" required id="userPw" name="newPw"> 
                            <label>PASSOWORD</label>
                        </div>

                        <div class="input-box">
                            <span class="icon">
                                <ion-icon name="person"></ion-icon>
                            </span>
                            <input type="text" required id="userNick" name="newNick">
                            <label>NICKNAME</label>
                        </div>
                        
                        <div class="input-box">                          
                            <input type="text" required id="userIntro" name="newIntro">
                            <label>INTRO</label>
                        </div>
                        

                        <div class="arrowBox">
                            <label for="">나의 포지션</label>
                            <i class="bi bi-caret-down" id="show"></i>
                        </div>
                    </div>

                    <div class="checkWrapper">
                    
                    	<p id="genderP" class="disPlayNone">GENDER</p>
                		<div class="genderBox disPlayNone">
                			<table class="genderTable">
								<tr>
									<td>
										<input type="radio" id="MAN" name="gender" value="M">
										<label for="MAN">MAN</label>
									</td>
									<td>
										<input type="radio" id="WOMAN" name="gender" value="W">
										<label for="WOMAN">WOMAN</label>
									</td>
								</tr>
							</table>
                		</div>
                    
                        <p id="positionP" class="disPlayNone">POSITION</p>
                        <div class="positionBox disPlayNone">
                            <table class="positionTable">
								<tr>
									<td>
										<input type="radio" required id="GUITAR" name="inst" value="기타">
										<label for="GUITAR">GUITAR</label>
									</td>
									<td>
										<input type="radio" id="BASS" name="inst" value="배스">
										<label for="BASS">BASS</label>
									</td>
									<td>
										<input type="radio" id="DRUM" name="inst" value="드럼">
										<label for="DRUM">DRUM</label>
									</td>
								</tr>

								<tr>
									<td>
										<input type="radio" id="VOCAL" name="inst" value="보컬">
										<label for="VOCAL">VOCAL</label>
									</td>

									<td>
										<input type="radio" id="KEYBOARD" name="inst" value="키보드">
										<label for="KEYBOARD">KEYBOARD</label>
									</td>

									<td>
										<input type="radio" id="HORN" name="inst" value="혼">
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
								<input type="radio" required id="ELECTRONIC" name="genre" value="일렉트로닉">
								<label for="ELECTRONIC">ELECTRONIC</label>
							</td>

							<td>
								<input type="radio" id="ROCK" name="genre" value="락">
								<label for="ROCK">ROCK</label>
							</td>

							<td>
								<input type="radio" id="FOLK" name="genre" value="포크">
								<label for="FOLK">FOLK</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="POP" name="genre" value="팝">
								<label for="POP">POP</label>
							</td>

							<td>
								<input type="radio" id="R&B" name="genre" value="알앤비">
								<label for="R&B">R&B</label>
							</td>

							<td>
								<input type="radio" id="JAZZ" name="genre" value="재즈">
								<label for="JAZZ">JAZZ</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="METAL" name="genre" value="메탈">
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
								<input type="radio" required id="seoul" name="region" value="서울">
								<label for="seoul">서울</label>
							</td>
							<td>
								<input type="radio" id="gyeonggi" name="region" value="경기도">
								<label for="gyeonggi">경기도</label>
							</td>
							<td>
								<input type="radio" id="incheon" name="region" value="인천">
								<label for="incheon">인천</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="daejeon" name="region" value="대전">
								<label for="daejeon">대전</label>
							</td>

							<td>
								<input type="radio" id="daegu" name="region" value="대구">
								<label for="daegu">대구</label>
							</td>
							<td>
								<input type="radio" id="busan" name="region" value="부산">
								<label for="busan">부산</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="ulsan" name="region" value="울산">
								<label for="ulsan">울산</label>
							</td>
							<td>
								<input type="radio" id="sejong" name="region" value="세종">
								<label for="sejong">세종</label>
							</td>
							<td>
								<input type="radio" id="gwangju" name="region" value="광주">
								<label for="gwangju">광주</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="gangwon" name="region" value="강원도">
								<label for="gangwon">강원도</label>
							</td>
							<td>
								<input type="radio" id="N-chungcheong" name="region" value="충북">
								<label for="N-chungcheong">충북</label>
							</td>
							<td>
								<input type="radio" id="S-chungcheong" name="region" value="충남">
								<label for="S-chungcheong">충남</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="N-gyeongsang" name="region" value="경북">
								<label for="N-gyeongsang">경북</label>
							</td>

							<td>
								<input type="radio" id="S-gyeongsang" name="region" value="경남">
								<label for="S-gyeongsang">경남</label>
							</td>
							<td>
								<input type="radio" id="N-jeolla" name="region" value="전북">
								<label for="N-jeolla">전북</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="S-jeolla" name="region" value="전남">
								<label for="S-jeolla">전남</label>
							</td>
							<td>
								<input type="radio" id="jeju" name="region" value="제주도">
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
                <form action="fin/secession" method="POST" id="secessionout">                     
                <button id="secessionBtn" type="button">탈퇴하기</button>
        		</form>
            </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    </div>
    
     <!-- group create -->
    <div class="container">
        <!-- <button class=" js-static-modal-toggleBoard btn btn-primary " type="button">test</button> -->
        <div id="static-modalGroup" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body">

                   
                   <c:choose>
                   		<c:when test="${!empty bandMem}">
                   			<p id="alreadyBand">밴드가 이미 있습니다</p>
                   		</c:when>
                   		
                   		<c:otherwise>
                   			<section class="groupSection">
                   				<form action="fin/makeBand" class="groupForm" method="GET">
                   				
                   				
                   					<div class="groupTitle">
                            			<h1>그룹 생성</h1>
                        			</div>

                        				<div class="grouInfoBox">
                            				<input type="text" required id="groupName" name="bandName">
                            				<label>GROUP NAME</label>

                            				<input type="text" required id="groupLeaderId" name="genre">
                            				<label>GENRE</label>

                            				<textarea type="text" id="groupInfoText" name="ment"></textarea>
                            				<label>EXPLAIN YOUR GROUP</label>
                        				</div>

                        			<div class="groupBtnBox">
                            			<button id="groupBtn" type="submit">생성하기</button>
                        			</div>
                  		 		</form>
                			</section>                  
                   		</c:otherwise>
                   
                   </c:choose>                                    
                    
              </div>
              <div class="modal-footer"></div>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
    </div>
    
    
    
    
    <script>
      const msg = "${msg}";
      if (msg.trim() !== "") {
        alert(msg);
      } 
        // 왜 자꾸 로그인 창을 들어가도 공백 alert가 뜰까 
        // -> 해결 -> != null로 조건을 주지 말고, 문자열로 체크를 해서 주면 발생하지않음.
        // 빈 문자열인 경우에는 alert를 발생시키지 않음
    </script>
    
    
    

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src = "${contextPath}/resources/js/myPage.js?version=3"></script>
</body>
</html>