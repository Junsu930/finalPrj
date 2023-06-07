<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/findingMember.css">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
    
    <script src="${contextPath}/resources/js/modal.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>

    <title>findingMember</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <br>
    <br>


    <button class="js-static-modal-toggle btn btn-primary" type="button">현경이</button>
    <div id="static-modal" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
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
						 <input type="radio" id="R&B" name="genre"><label for="R&B">R&B</label>
						 <input type="radio" id="jazz" name="genre"><label for="jazz">JAZZ</label>
						 <input type="radio" id="metal" name="genre"><label for="metal">METAL</label>
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
					<div class="location">
						<p class="cate">Location</p>
						<input type="radio" id="seoul" name="location"><label for="seoul">서울</label>
						<input type="radio" id="gyeonggi" name="location"><label for="gyeonggi">경기도</label>
						<input type="radio" id="incheon" name="location"><label for="incheon">인천</label>
						<input type="radio" id="daejeon" name="location"><label for="daejeon">대전</label>
						<input type="radio" id="daegu" name="location"><label for="daegu">대구</label>
						<input type="radio" id="busan" name="location"><label for="busan">부산</label>
						<input type="radio" id="ulsan" name="location"><label for="ulsan">울산</label>
						<input type="radio" id="sejong" name="location"><label for="sejong">세종</label>
						<input type="radio" id="gwangju" name="location"><label for="gwangju">광주</label>
						<input type="radio" id="N-chungcheong" name="location"><label for="N-chungcheong">충청북도</label>
						<input type="radio" id="S-chungcheong" name="location"><label for="S-chungcheong">충청남도</label>
						<input type="radio" id="N-gyeongsang" name="location"><label for="N-gyeongsang">경상북도</label>
						<input type="radio" id="S-gyeongsang" name="location"><label for="S-gyeongsang">경상남도</label>
						<input type="radio" id="gangwon" name="location"><label for="gangwon">강원도</label>
						<input type="radio" id="N-jeolla" name="location"><label for="N-jeolla">전라북도</label>
						<input type="radio" id="S-jeolla" name="location"><label for="S-jeolla">전라남도</label>
						<input type="radio" id="jeju" name="location"><label for="jeju">제주도</label>
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

<script src="${contextPath}/resources/js/findingMember.js"></script>    
</body>
</html>