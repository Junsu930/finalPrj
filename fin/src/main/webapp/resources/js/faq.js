document.getElementById("faq-img").addEventListener("click", function(){
	
	let faqWindow = document.getElementById("faqBox");

	
	if(faqWindow.classList.contains("disappear")){

		faqWindow.classList.add("appear");
		faqWindow.classList.remove("disappear");
		
		if(document.getElementById("chatBody").style.display !='none' || document.getElementById("chatBody").style.display != 0){
			document.getElementById("chatBody").style.display = 'none';
		}
		
		
	}else{
		faqWindow.classList.remove("appear");
		faqWindow.classList.add("disappear");
	}

});


// 더 질문하기 div
let moreQuestionDiv = document.createElement("div");
moreQuestionDiv.className = 'questionList';
let moreQuestion = document.createElement("div");
moreQuestion.className = 'moreQuestion';
moreQuestion.innerHTML = '🪶 더 질문하기';

moreQuestionDiv.append(moreQuestion);


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
			div2.innerHTML = '<p class="replayQuestion">🎸 밴드 아카이브는 어떤 사이트인가요?</p>'
			div2.innerHTML += '밴드 아카이브는 종합 밴드 커뮤니티입니다.<br>일반적인 게시판 이용은 물론<br>밴드 멤버 검색과 연습실 예약<br>' +
						 '중고 물품 거래 또한 이용 가능합니다.'; 

			div1.append(div2);
			document.getElementById("faqBox").append(drDuck);
			document.getElementById("faqBox").append(div1);
			document.getElementById("faqBox").append(moreQuestionDiv);

			$("#faqBox").scrollTop($("#faqBox")[0].scrollHeight);
			
		}else if(each.value == "2"){

			let div1 = document.createElement("div");
			div1.className = 'faqQuestion';

			let div2 = document.createElement("div");
			div2.className = 'answerBox';
			div2.innerHTML = '<p class="replayQuestion">🔎 밴드 멤버를 찾고 싶어요</p>'
			div2.innerHTML += '밴드 아카이브는 멤버 찾기 기능을 제공합니다.<br>마이페이지의 밴드 찾기를 이용해보세요<br>간단한 조건을 입력하시고<br>' +
						 '원하시는 멤버를 검색하실 수 있습니다.<br>'+'채팅하기를 통해 이야기를 나누고 밴드를 결성해보세요.'; 

			div1.append(div2);
			document.getElementById("faqBox").append(drDuck);
			document.getElementById("faqBox").append(div1);
			document.getElementById("faqBox").append(moreQuestionDiv);

			$("#faqBox").scrollTop($("#faqBox")[0].scrollHeight);

		}else if(each.value == "3"){
			
			let div1 = document.createElement("div");
			div1.className = 'faqQuestion';

			let div2 = document.createElement("div");
			div2.className = 'answerBox';
			div2.innerHTML = '<p class="replayQuestion">📻 중고 물품 거래는 안전거래인가요?</p>'
			div2.innerHTML += '밴드 아카이브는 중고 거래 게시판 제공만 지원합니다.<br>더치트 및 사기 조회에 힘써주시고<br>직거래 위주로 거래해주세요.<br>' +
						 '밴드 아카이브는 거래 중 발생한 일에 대해서<br>'+'민, 형사적 책임을 지지 않습니다.'; 

			div1.append(div2);
			document.getElementById("faqBox").append(drDuck);
			document.getElementById("faqBox").append(div1);
			document.getElementById("faqBox").append(moreQuestionDiv);

			$("#faqBox").scrollTop($("#faqBox")[0].scrollHeight);
		}else if(each.value == "4"){
						
			let div1 = document.createElement("div");
			div1.className = 'faqQuestion';

			let div2 = document.createElement("div");
			div2.className = 'answerBox';
			div2.innerHTML = '<p class="replayQuestion">🤣 밴드 멤버가 나갔어요</p>'
			div2.innerHTML += '밴드 아카이브의 밴드 리더는 멤버 추방 기능을 제공합니다.<br>나간 멤버는 더 이상 밴드 게시판을 이용하지 못하도록<br>멤버 추방 기능을 이용해보세요.<br>' +
						 '새로운 멤버는 멤버 찾기 기능을 이용해 <br>수월하게 구할 수 있습니다.'; 

			div1.append(div2);
			document.getElementById("faqBox").append(drDuck);
			document.getElementById("faqBox").append(div1);
			document.getElementById("faqBox").append(moreQuestionDiv);

			$("#faqBox").scrollTop($("#faqBox")[0].scrollHeight);

		}else if(each.value == "5"){
			let div1 = document.createElement("div");
			div1.className = 'faqQuestion';

			let div2 = document.createElement("div");
			div2.className = 'answerBox';
			div2.innerHTML = '<p class="replayQuestion">✖️ 연습실 예약 취소는 어떻게 하나요?</p>'
			div2.innerHTML += '마이페이지의 예약 내역에서 취소하기를 누르시면 됩니다.<br>연습실 주인에게 즉시 알림이 가게 되며<br>승인 시 연습실 예약이 취소됩니다.<br>' +
						 '빠른 처리를 위해서는 페이지 내에 기입된 <br>연습실 번호로 전화 문의를 해주시면 됩니다.'; 

			div1.append(div2);
			document.getElementById("faqBox").append(drDuck);
			document.getElementById("faqBox").append(div1);
			document.getElementById("faqBox").append(moreQuestionDiv);

			$("#faqBox").scrollTop($("#faqBox")[0].scrollHeight);
		}
    })

}


// 더 질문하기 클릭 시 동작
moreQuestionDiv.addEventListener("click", ()=>{
	$("#faqBox").append(reqQ);
})