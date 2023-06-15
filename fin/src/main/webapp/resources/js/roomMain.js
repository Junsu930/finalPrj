
let boxCardList;
let boxCardListLength;
let $lastBox;

$(document).ready(()=>{
    $.ajax({
      url : "/fin/roomScroll",
      type : "get",
      dataType : "json",
      success : function(data){
        console.log(data);
        boxCardList = data;
        boxCardListLength = boxCardList.length; 
        // 모든 박스 카드 길이

        let countNum = boxCardListLength < 5 ? boxCardListLength : 5
        // 모든 박스 카드 길이가 5보다 작으면 박스카드길이인 couontNum은 박스카드 길이고, 아니면 countNum은 5이다.
        
        // 최초 5개의 박스를 가져온다
        for (let i = 0; i < countNum; i++) {            
          const $newBox = document.createElement("div");
          $newBox.className = "box-card";

          $newBox.onclick = function(){location.href='/fin/roomDetail?pracRoomNo=' + boxCardList[i].pracRoomNo};
          
          // 빈 div
          let div1 = document.createElement("div");
          // space-name
          let div2 = document.createElement("div");
          // detail-part
          let div3 = document.createElement("div");
          // detail-part의 첫번째 div
          let div4 = document.createElement("div");
          // detail-part의 두번째 div
          let div5 = document.createElement("div");
          // detail-part의 첫번째 div의 내부 div들
          let div6 = document.createElement("div");
          let div7 = document.createElement("div");
          
          div6.innerHTML = '<i class="fa-solid fa-location-dot"></i>&nbsp;' + boxCardList[i].region;
          div7.innerHTML = '<i class="fa-solid fa-tags" style="margin-top: 2px;"></i>&nbsp;' + boxCardList[i].tag;
          div5.innerHTML = '<i class="fa-solid fa-money-check"></i>'+ boxCardList[i].pricePerHour +'원 / 시간';
          let p1 = document.createElement("p");
          
          div2.className="space-name"
          div3.className="detail-part"

          p1.innerHTML = boxCardList[i].pracRoomName;
          div2.append(p1);

          div4.append(div6);
          div4.append(div7);
          
          

          div3.append(div4);
          div3.append(div5);


          $newBox.append(div1);
          $newBox.append(div2);
          $newBox.append(div3);
      
          document.querySelector(".main-card-sec").appendChild($newBox);
        }
        $lastBox = document.querySelector(".box-card:last-child");
        
        // 현재 카운트넘은 5이다
        let count = 5;
        const obsever = new IntersectionObserver(
          (entries) => {
            entries.forEach((entry) => {
              if (entry.isIntersecting && count < boxCardListLength) {
                // 관찰이 되고 5가 boxcardListLength보다 작을 때 실행
                
                let toCount;
  
                if(count + 5 <= boxCardListLength){
                  toCount = count + 5;
                }else{
                  toCount = boxCardListLength
                }
  
                for (let i = count; i < toCount; i++) {
                  
                  const $newBox = document.createElement("div");
                  $newBox.className = "box-card";
  
                  $newBox.onclick = function(){location.href='/fin/roomDetail?pracRoomNo=' + boxCardList[i].pracRoomNo};
                  
                  // 빈 div
                  let div1 = document.createElement("div");
                  // space-name
                  let div2 = document.createElement("div");
                  // detail-part
                  let div3 = document.createElement("div");
                  // detail-part의 첫번째 div
                  let div4 = document.createElement("div");
                  // detail-part의 두번째 div
                  let div5 = document.createElement("div");
                  // detail-part의 첫번째 div의 내부 div들
                  let div6 = document.createElement("div");
                  let div7 = document.createElement("div");
                  
                  div6.innerHTML = '<i class="fa-solid fa-location-dot"></i>&nbsp;' + boxCardList[i].region;
                  div7.innerHTML = '<i class="fa-solid fa-tags" style="margin-top: 2px;"></i>&nbsp;' + boxCardList[i].tag;
                  div5.innerHTML = '<i class="fa-solid fa-money-check"></i>'+ boxCardList[i].pricePerHour +'원 / 시간';
                  let p1 = document.createElement("p");
                  
                  div2.className="space-name"
                  div3.className="detail-part"
  
                  p1.innerHTML = boxCardList[i].pracRoomName;
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
                let $lastBox = document.querySelector(".box-card:last-child");
  
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
            if($lastBox!=null){
              obsever.observe($lastBox);
            }
        }
      })
    });

$("#room-search").on("change keyup paste", searchingRoomAjax);


function searchingRoomAjax(){
  
  let region = $("#regionTextSpan").html();
  let searchingText = $("#room-search").val();

  $.ajax({
    url : "/fin/searchingRoomScroll",
    type : "get",
    data : {"region": region, "searchingText": searchingText},
    dataType : "json",
    success : function(data){

      $(".main-card-sec").html("");
      console.log(data);
      boxCardList = data;
      boxCardListLength = boxCardList.length; 
      // 모든 박스 카드 길이

      let countNum = boxCardListLength < 5 ? boxCardListLength : 5
      // 모든 박스 카드 길이가 5보다 작으면 박스카드길이인 couontNum은 박스카드 길이고, 아니면 countNum은 5이다.
      
      // 최초 5개의 박스를 가져온다
      for (let i = 0; i < countNum; i++) {            
        const $newBox = document.createElement("div");
        $newBox.className = "box-card";

        $newBox.onclick = function(){location.href='/fin/roomDetail?pracRoomNo=' + boxCardList[i].pracRoomNo};
        
        // 빈 div
        let div1 = document.createElement("div");
        // space-name
        let div2 = document.createElement("div");
        // detail-part
        let div3 = document.createElement("div");
        // detail-part의 첫번째 div
        let div4 = document.createElement("div");
        // detail-part의 두번째 div
        let div5 = document.createElement("div");
        // detail-part의 첫번째 div의 내부 div들
        let div6 = document.createElement("div");
        let div7 = document.createElement("div");
        
        div6.innerHTML = '<i class="fa-solid fa-location-dot"></i>&nbsp;' + boxCardList[i].region;
        div7.innerHTML = '<i class="fa-solid fa-tags" style="margin-top: 2px;"></i>&nbsp;' + boxCardList[i].tag;
        div5.innerHTML = '<i class="fa-solid fa-money-check"></i>'+ boxCardList[i].pricePerHour +'원 / 시간';
        let p1 = document.createElement("p");
        
        div2.className="space-name"
        div3.className="detail-part"

        p1.innerHTML = boxCardList[i].pracRoomName;
        div2.append(p1);

        div4.append(div6);
        div4.append(div7);
        
        

        div3.append(div4);
        div3.append(div5);


        $newBox.append(div1);
        $newBox.append(div2);
        $newBox.append(div3);
    
        document.querySelector(".main-card-sec").appendChild($newBox);
      }
      $lastBox = document.querySelector(".box-card:last-child");
      
      // 현재 카운트넘은 5이다


      let count = 5;
      const obsever = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting && count < boxCardListLength) {
              
              let toCount;

              if(count + 5 <= boxCardListLength){
                toCount = count + 5;
              }else{
                toCount = boxCardListLength;
              }

              for (let i = count; i < toCount; i++) {
                
                const $newBox = document.createElement("div");
                $newBox.className = "box-card";

                $newBox.onclick = function(){location.href='/fin/roomDetail?pracRoomNo=' + boxCardList[i].pracRoomNo};
                
                // 빈 div
                let div1 = document.createElement("div");
                // space-name
                let div2 = document.createElement("div");
                // detail-part
                let div3 = document.createElement("div");
                // detail-part의 첫번째 div
                let div4 = document.createElement("div");
                // detail-part의 두번째 div
                let div5 = document.createElement("div");
                // detail-part의 첫번째 div의 내부 div들
                let div6 = document.createElement("div");
                let div7 = document.createElement("div");
                
                div6.innerHTML = '<i class="fa-solid fa-location-dot"></i>&nbsp;' + boxCardList[i].region;
                div7.innerHTML = '<i class="fa-solid fa-tags" style="margin-top: 2px;"></i>&nbsp;' + boxCardList[i].tag;
                div5.innerHTML = '<i class="fa-solid fa-money-check"></i>'+ boxCardList[i].pricePerHour +'원 / 시간';
                let p1 = document.createElement("p");
                
                div2.className="space-name"
                div3.className="detail-part"

                p1.innerHTML = boxCardList[i].pracRoomName;
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
              let $lastBox = document.querySelector(".box-card:last-child");

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
          if($lastBox!=null){
            obsever.observe($lastBox);
          }
      }
  });
};


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
    $("#regionSelector").val($(eachLi).html());

    searchingRoomAjax();
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


// 공백 검증
function spaceCheck(){

  if($("#room-search").val() == "" || $("#room-search").val() == null){
    swal.fire("검색어를 입력해주세요");
    return false;
  }else{
    return true;
  }

}


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

