<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${contextPath}/resources/css/lookProfile.css">
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
	
	a:hover {
    	color: revert;
	}
	
	a{
		color: revert;
	}
</style>
<!-- 모달 파트 -->
<div class="modal" tabindex="-1" id="exampleModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalMainTitle"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
 		<div class="mainProfile">
 			<!-- 프로필 이미지  -->
 			<div>
 				<div id="imgProfileRoundBox">
 					<img id="imgProfileImage" class="imgProfileImage" src="${contextPath}/resources/images/profileImage/user.png">
 				</div>
 			</div>
 			<!-- 닉네임과 이메일 -->
 			<div>
 				<div id="modalInName"></div>
 				<div id="modalInEmail"></div>
 			</div>
 		</div>
 		<!-- 프로필 아이콘 -->
 		<div class="profileIcons">
 			<!-- 악기 -->
 			<div class="eachIconDiv">
 				<div>
 					<i class="fa-solid fa-guitar"></i>Instrument
 				</div>
 				<div id="modalInInst">
	 				
 				</div>
 			</div>
 			<!-- 장르 -->
 			 <div class="eachIconDiv">
 				<div>
					<i class="fa-solid fa-music"></i>Genre
 				</div>
	 			<div id="modalInGenre">
	 				
	 			</div>
 			</div>

 			<!-- 지역 -->
 			 <div class="eachIconDiv">
 				<div>
 					<i class="fa-solid fa-house"></i>Address
 				</div>
	 			<div id="modalInRegion">
	 				
	 			</div>
 			</div>
 			<!-- 성별 -->
 			 <div class="eachIconDiv">
 				<div>
 					<i class="fa-solid fa-venus-mars"></i>Gender
 				</div>
	 			<div id="modalInExp">
	 				
	 			</div>
 			</div> 		
 		</div>
 		<!-- 소개 멘트 -->
 		<div class="introMentInput">
 			<div class="mentBox" id="modalInMent"></div>
 		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" id="testBtn">채팅하기</button>
      </div>
    </div>
  </div>
</div>
<!--프로필 보기 로딩을 위한 코드 -->
<div class="wrap-loading display-none">
	<div><img src="${contextPath}/resources/images/loadingimg.gif" /></div>
</div>   

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
// 프로필 보기 모달
let profileModalOn = $(".bi-person-circle");

console.log(profileModalOn);

for(let eachModal of profileModalOn){
  $(eachModal).click((e)=>{
    
    let userId = $(e.target).prev().val();
    
    $.ajax({
        type: 'post',
        url: '/fin/dbTest',
        async: true,
        data:{'userNo' : userId},
        dataType: 'JSON',
        beforeSend:function(){
          $('.wrap-loading').removeClass('display-none');
          $('.modal-content').css("display", 'none');
        },complete:function(){
          $('.wrap-loading').addClass('display-none');
          $('.modal-content').css("display", 'flex');
        },
        success: function(data){   
			console.log(data);
            $("#modalMainTitle").html(data.userName + "님의 프로필");
            $("#modalInName").html(data.userName);
            $("#modalInEmail").html(data.userEmail);
            $("#modalInInst").html(data.inst);
            $("#modalInGenre").html(data.genreFavor);
            $("#modalInRegion").html(data.region);
			if(data.gender == 'M'){
				$("#modalInExp").html("남자");
			}else{
				$("#modalInExp").html("여자");
			}
            $("#modalInMent").html(data.introMent);

			if(data.profileImage != null){
				$("#imgProfileImage").src(data.profileImage);
			}

    
        },
        error: function(err){
            console.log(err);
        }
    })
  });
}

</script>