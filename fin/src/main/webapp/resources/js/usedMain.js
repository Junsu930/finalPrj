
/* 지역 선택 버튼 JS */
$('#regionBtn').on("click",()=>{

	if($('#regionListUl').hasClass("disappearList")){
		
		$('#bi').toggleClass( "bi-caret-up");
		$('#regionListUl').removeClass("disappearList");
	}else{

		$('#bi').toggleClass( "bi-caret-up");
		$('#regionListUl').addClass("disappearList");
	}
});

// 글자수 자르기 
const shortenWords = (str, length) => {
	let result = '';
	if (str.length > length) {
	  result = str.substr(0, length - 2) + '...';
	} else {
	  result = str;
	}
	return result;
  };




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





let boxCardList;
let boxCardListLength;
let $lastBox;
let loginUserNo = document.getElementById("usedPageHiddenUserNo").value;

if(loginUserNo != null && loginUserNo != ""){
	document.getElementById("usedWriteBtn").style.display="flex";
}

$(document).ready(()=>{
    $.ajax({
      url : "/fin/usedRoomScroll",
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
		
		  // 가장 외부          
          const $newBox = document.createElement("div");
          $newBox.className = "thingBox";
          $newBox.onclick = function(){location.href='/fin/usedDetail?usedBoard=' + boxCardList[i].usedBoardNo};
          
          // thingPicture
          let thingPicture = document.createElement("div");
		  thingPicture.className = "thingPicture";
		  let thingImg = document.createElement("img");
		  thingImg.className ="usedPicture";
		  thingImg.src= '/fin' + boxCardList[i].imgSrc;

		  thingPicture.append(thingImg);

		  let thingSecondBox = document.createElement("div");
		  thingSecondBox.className="thingsecondbox";
		  let thingsSecondTop = document.createElement("div");
		  thingsSecondTop.className="thingssecondTop";
		  let saleOfsoldout = document.createElement("div");
		  saleOfsoldout.className="SaleOrSoldout";
		  let thingTitle = document.createElement("div");
		  thingTitle.className="thingTitle";

		  let status = (boxCardList[i].boardState == 'Y') ? '판매중':  '판매완료';
		  saleOfsoldout.innerHTML=  status
		  thingTitle.innerHTML= shortenWords(boxCardList[i].boardTitle, 30);

		  thingsSecondTop.append(saleOfsoldout);
		  thingsSecondTop.append(thingTitle);


		  let thingSecondBottomBox = document.createElement("div");
		  thingSecondBottomBox.className="thingsecondBottomBox";
		  let thingsecondBottom = document.createElement("div");
		  thingsecondBottom.className="thingsecondBottom";
		  let sellerName = document.createElement("div");
		  sellerName.className="sellerName";
		  sellerName.innerHTML = boxCardList[i].userNick + " · " + boxCardList[i].region;
		  thingsecondBottom.append(sellerName);

		  let priceTag = document.createElement("div");
		  priceTag.className="price";
		  priceTag.innerHTML= boxCardList[i].price+"원";
		  thingSecondBottomBox.append(thingsecondBottom);
		  thingSecondBottomBox.append(priceTag);


		  thingSecondBox.append(thingsSecondTop);
		  thingSecondBox.append(thingSecondBottomBox);
    
          $newBox.append(thingPicture);
          $newBox.append(thingSecondBox);
      
          document.querySelector(".thingBoxWrap").appendChild($newBox);
        }
        $lastBox = document.querySelector(".thingBox:last-child");
        
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
      			  // 가장 외부          
				  const $newBox = document.createElement("div");
				  $newBox.className = "thingBox";
		
				  $newBox.onclick = function(){location.href='/fin/usedDetail?usedBoard=' + boxCardList[i].usedBoardNo};
				  
				  // thingPicture
				  let thingPicture = document.createElement("div");
				  thingPicture.className = "thingPicture";
				  let thingImg = document.createElement("img");
				  thingImg.className ="usedPicture";
				  thingImg.src= '/fin' +boxCardList[i].imgSrc;
		
				  thingPicture.append(thingImg);
		
				  let thingSecondBox = document.createElement("div");
				  thingSecondBox.className="thingsecondbox";
				  let thingsSecondTop = document.createElement("div");
				  thingsSecondTop.className="thingssecondTop";
				  let saleOfsoldout = document.createElement("div");
				  saleOfsoldout.className="SaleOrSoldout";
				  let thingTitle = document.createElement("div");
				  thingTitle.className="thingTitle";
		
				  let status = (boxCardList[i].boardState == 'Y') ? '판매중':  '판매완료';
				  saleOfsoldout.innerHTML=  status
				  thingTitle.innerHTML= shortenWords(boxCardList[i].boardTitle, 30);
		
				  thingsSecondTop.append(saleOfsoldout);
				  thingsSecondTop.append(thingTitle);
		
		
				  let thingSecondBottomBox = document.createElement("div");
				  thingSecondBottomBox.className="thingsecondBottomBox";
				  let thingsecondBottom = document.createElement("div");
				  thingsecondBottom.className="thingsecondBottom";
				  let sellerName = document.createElement("div");
				  sellerName.className="sellerName";
				  sellerName.innerHTML = boxCardList[i].userNick + " · " + boxCardList[i].region;
				  thingsecondBottom.append(sellerName);
		
				  let priceTag = document.createElement("div");
				  priceTag.className="price";
				  priceTag.innerHTML= boxCardList[i].price+"원";
				  thingSecondBottomBox.append(thingsecondBottom);
				  thingSecondBottomBox.append(priceTag);
		
		
				  thingSecondBox.append(thingsSecondTop);
				  thingSecondBox.append(thingSecondBottomBox);
			
				  $newBox.append(thingPicture);
				  $newBox.append(thingSecondBox);
			  
				  document.querySelector(".thingBoxWrap").appendChild($newBox);
				  count ++;
                }
				$lastBox = document.querySelector(".thingBox:last-child");
  
                  obsever.unobserve($lastBox);
				  $lastBox = document.querySelector(".thingBox:last-child");
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
    url : "/fin/usedSearchingRoomScroll",
    type : "get",
    data : {"region": region, "searchingText": searchingText},
    dataType : "json",
    success : function(data){

      document.querySelector(".thingBoxWrap").innerHTML ="";
      console.log(data);
      boxCardList = data;
      boxCardListLength = boxCardList.length; 
      // 모든 박스 카드 길이

      let countNum = boxCardListLength < 5 ? boxCardListLength : 5
      // 모든 박스 카드 길이가 5보다 작으면 박스카드길이인 couontNum은 박스카드 길이고, 아니면 countNum은 5이다.
      
      // 최초 5개의 박스를 가져온다
      for (let i = 0; i < countNum; i++) {            
		// 가장 외부          
		const $newBox = document.createElement("div");
		$newBox.className = "thingBox";

		$newBox.onclick = function(){location.href='/fin/usedDetail?usedBoard=' + boxCardList[i].usedBoardNo};
		
		// thingPicture
		let thingPicture = document.createElement("div");
		thingPicture.className = "thingPicture";
		let thingImg = document.createElement("img");
		thingImg.className ="usedPicture";
		thingImg.src= '/fin' + boxCardList[i].imgSrc;

		thingPicture.append(thingImg);

		let thingSecondBox = document.createElement("div");
		thingSecondBox.className="thingsecondbox";
		let thingsSecondTop = document.createElement("div");
		thingsSecondTop.className="thingssecondTop";
		let saleOfsoldout = document.createElement("div");
		saleOfsoldout.className="SaleOrSoldout";
		let thingTitle = document.createElement("div");
		thingTitle.className="thingTitle";

		let status = (boxCardList[i].boardState == 'Y') ? '판매중':  '판매완료';
		saleOfsoldout.innerHTML=  status
		thingTitle.innerHTML= shortenWords(boxCardList[i].boardTitle, 30);

		thingsSecondTop.append(saleOfsoldout);
		thingsSecondTop.append(thingTitle);


		let thingSecondBottomBox = document.createElement("div");
		thingSecondBottomBox.className="thingsecondBottomBox";
		let thingsecondBottom = document.createElement("div");
		thingsecondBottom.className="thingsecondBottom";
		let sellerName = document.createElement("div");
		sellerName.className="sellerName";
		sellerName.innerHTML = boxCardList[i].userNick + " · " + boxCardList[i].region;
		thingsecondBottom.append(sellerName);

		let priceTag = document.createElement("div");
		priceTag.className="price";
		priceTag.innerHTML= boxCardList[i].price+"원";
		thingSecondBottomBox.append(thingsecondBottom);
		thingSecondBottomBox.append(priceTag);


		thingSecondBox.append(thingsSecondTop);
		thingSecondBox.append(thingSecondBottomBox);
  
		$newBox.append(thingPicture);
		$newBox.append(thingSecondBox);
	
		document.querySelector(".thingBoxWrap").appendChild($newBox);
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
				
				// 가장 외부          
				const $newBox = document.createElement("div");
				$newBox.className = "thingBox";
		
				$newBox.onclick = function(){location.href='/fin/usedDetail?usedBoard=' + boxCardList[i].usedBoardNo};
				
				// thingPicture
				let thingPicture = document.createElement("div");
				thingPicture.className = "thingPicture";
				let thingImg = document.createElement("img");
				thingImg.className ="usedPicture";
				thingImg.src= '/fin' +  boxCardList[i].imgSrc;
		
				thingPicture.append(thingImg);
		
				let thingSecondBox = document.createElement("div");
				thingSecondBox.className="thingsecondbox";
				let thingsSecondTop = document.createElement("div");
				thingsSecondTop.className="thingssecondTop";
				let saleOfsoldout = document.createElement("div");
				saleOfsoldout.className="SaleOrSoldout";
				let thingTitle = document.createElement("div");
				thingTitle.className="thingTitle";
		
				let status = (boxCardList[i].boardState == 'Y') ? '판매중':  '판매완료';
				saleOfsoldout.innerHTML=  status
				thingTitle.innerHTML= shortenWords(boxCardList[i].boardTitle, 30);
		
				thingsSecondTop.append(saleOfsoldout);
				thingsSecondTop.append(thingTitle);
		
		
				let thingSecondBottomBox = document.createElement("div");
				thingSecondBottomBox.className="thingsecondBottomBox";
				let thingsecondBottom = document.createElement("div");
				thingsecondBottom.className="thingsecondBottom";
				let sellerName = document.createElement("div");
				sellerName.className="sellerName";
				sellerName.innerHTML = boxCardList[i].userNick + " · " + boxCardList[i].region;
				thingsecondBottom.append(sellerName);
		
				let priceTag = document.createElement("div");
				priceTag.className="price";
				priceTag.innerHTML= boxCardList[i].price+"원";
				thingSecondBottomBox.append(thingsecondBottom);
				thingSecondBottomBox.append(priceTag);
		
		
				thingSecondBox.append(thingsSecondTop);
				thingSecondBox.append(thingSecondBottomBox);
			
				$newBox.append(thingPicture);
				$newBox.append(thingSecondBox);
			
				document.querySelector(".thingBoxWrap").appendChild($newBox);

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


// 공백 검증
function spaceCheck(){

  if($("#room-search").val() == "" || $("#room-search").val() == null){
    swal.fire("검색어를 입력해주세요");
    return false;
  }else{
    return true;
  }

}

