document.getElementById("faq-img").addEventListener("click", function(){
	
	let faqWindow = document.getElementById("faqBox");

	
	if(faqWindow.style.width == '0px' || faqWindow.style.width == 0 ){
		faqWindow.style.width = '500px';
		faqWindow.style.height = '500px';
		
		if(document.getElementById("chatBody").style.display !='none' || document.getElementById("chatBody").style.display != 0){
			document.getElementById("chatBody").style.display = 'none';
		}
		
		
	}else{
		faqWindow.style.width = '0';
		faqWindow.style.height = '0';
	}

});

let qList = document.querySelectorAll(".Q-lists > li");

// 반복해서 불러온 질문들 
let reqQ = document.getElementById("reqQ");

for(let each of qList){
    each.addEventListener("click", e=>{
		
		for(let eachColor of qList){
			eachColor.style.backgroundColor = 'var(--background-color)';
		}
		e.target.style.backgroundColor = 'var(--accent-color)';
		// 배경 색을 바꿔준다.



		let imgDiv1 = document.createElement("div");
		imgDiv1.className = "faqQuestion";
		let imgDiv2 = document.createElement("div");
		imgDiv2.className = "faqDuck";
		let imgTag = document.createElement("img");
		imgTag.src= './resources/images/guitarduckelec.png';

		imgDiv2.append(imgTag);
		imgDiv1.append(imgDiv2);

		let drDuck = imgDiv1;

        if(each.value == "1"){
			let div1 = document.createElement("div");
			div1.className = 'faqQuestion';

			let div2 = document.createElement("div");
			div2.className = 'answerBox';

			div2.innerHTML = '밴드 아카이브는 종합 밴드 커뮤니티입니다.<br>일반적인 게시판 이용은 물론<br>밴드 멤버 검색과 연습실 예약<br>' +
						 '중고 물품 거래 또한 이용 가능합니다.'; 

			div1.append(div2);
			document.getElementById("faqBox").append(drDuck);
			document.getElementById("faqBox").append(div1);
			document.getElementById("faqBox").append(reqQ);

			$("#faqBox").scrollTop($("#faqBox")[0].scrollHeight);
			
		}
    })

}


