let count = 5;
let $lastBox = document.querySelector(".box-card:last-child");

const obsever = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting && count < 100) {
        for (let i = 0; i < 10; i++) {
          const $newBox = document.createElement("div");
          $newBox.className = "box-card";
		  let div1 = document.createElement("div");
		  let div2 = document.createElement("div");
		  let div3 = document.createElement("div");
		  let div4 = document.createElement("div");
		  let div5 = document.createElement("div");
		  let div6 = document.createElement("div");
		  let div7 = document.createElement("div");
		  
		  let p1 = document.createElement("p");
		
		  div3.id="detail-part"

		  p1.innerHTML = "으아아";
		  div2.append(p1);

		  div4.append(div6);
		  div4.append(div7);
			

		  div3.append(div4);
		  div3.append(div5);


		  $newBox.append(div1);
		  $newBox.append(div2);
		  $newBox.append(div3);
	  
          document.querySelector(".main-card-sec").appendChild($newBox);
		  count ++;
        }
        obsever.unobserve($lastBox);
        $lastBox = document.querySelector(".box-card:last-child");
        obsever.observe($lastBox);
      }
    });
  },
  {
    threshold: 0,
  }
);

obsever.observe($lastBox);

// 로고 애니메이션
const titleLogo = document.querySelectorAll("#titleLogo path");

for(let i = 0; i<titleLogo.length; i++){
	console.log(`Letter ${i} is ${titleLogo[i].getTotalLength()}`);
}

$('#regionBtn').on("click",()=>{

	if($('#regionListUl').hasClass("disappearList")){
		
		$('#bi').toggleClass( "bi-caret-up");
		$('#regionListUl').removeClass("disappearList");
	}else{

		$('#bi').toggleClass( "bi-caret-up");
		$('#regionListUl').addClass("disappearList");
	}


});

$(document).click(e=>{

	if(!$(e.target).parent().hasClass('regionBtn') && !$(e.target).hasClass('regionBtn')
		&& !$(e.target).parent().hasClass('reginListUl')){
		if(!$('#regionListUl').hasClass("disappearList")){
			
			$('#bi').toggleClass( "bi-caret-up");
			$('#regionListUl').addClass("disappearList");
		}
	}

})

let liArr = $('#regionListUl > li');

for(let eachLi of liArr){
	$(eachLi).click(()=>{
		$('#regionTextSpan').html($(eachLi).html());
	})
}




// 프로필 보기 모달

$('#toModalDiv').click(()=>{
  let userId = $("#hiddenUserNo").val();

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
          $("#modalMainTitle").html(data.userName + "님의 프로필");
          $("#modalInName").html(data.userName);
          $("#modalInEmail").html(data.userEmail);
          $("#modalInInst").html(data.inst);
          $("#modalInGenre").html(data.genreFavor);
          $("#modalInRegion").html(data.region);
          $("#modalInExp").html(data.yoe);
          $("#modalInMent").html(data.introMent);

      },
      error: function(err){
          console.log(err);
      }
  })

});


// 회원 임시 설정하기
$("#first-user").click(()=>{
    $("#beingUserInput").val("1");
});

$("#second-user").click(()=>{
  $("#beingUserInput").val("2");
});

$("#third-user").click(()=>{
  $("#beingUserInput").val("3");
});