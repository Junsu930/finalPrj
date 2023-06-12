let calendar;
let today = new Date();
let toWeeks = new Date();
let weeks =  new Date(toWeeks.setDate(toWeeks.getDate() + 7));
let tt = today.toISOString().split('T')[0];
let tw = weeks.toISOString().split('T')[0];
const schedule = document.getElementById("schedule");
const timeline = document.getElementById("timeline");
const timesClass = document.getElementsByClassName("times");
let greenList = new Array();

	document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById('calendar');
    
    calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면 (기본 설정: 달)
        locale: 'ko', // 한국어 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        height: '500px', // calendar 높이 설정
        width: '500px',
        dateClick: function(info) {
        
        greenList = document.getElementsByClassName("greenDay");


        for(let i = 0; i<greenList.length; i++){
            if(greenList[i].classList.contains('greenDay')){

                greenList[i].classList.remove('greenDay');
            }else{

            }
        }
        

        const diffMSec = today.getTime() - info.date.getTime();
        const diffDate = diffMSec / (24 * 60 * 60 * 1000);

        if(diffDate<1 && diffDate >-6){

            $(info.dayEl).addClass('greenDay');
 
            schedule.innerHTML=info.dateStr;


            timeline.style.display = 'flex';
            for(let each of timesClass){
                if(each.classList.contains("onTime")) each.classList.remove("onTime");
            }


        }
        

        },
        events: [
            {
                start: tt,
                end: tw,
                overlap: false,
                display: 'background'
            }
        ]

	});

    
	calendar.render();
});




const times = document.getElementsByClassName("times");
const submitBtn = $('#timeSubmit');


for(let time of times){
    time.addEventListener("click", function(){
        
        
        
        if(!this.classList.contains("onTime")){
            this.classList.add("onTime");
        }else{
            this.classList.remove("onTime");
        }

        
        if(document.getElementsByClassName("onTime").length == 0){
            submitBtn.css('display', 'none');
            $('#roomDetailPhoto').css('display', 'none');
            $('#picto').css('display','none');
            $('.price-tag').css('display','none');
        }else{
            submitBtn.css('display', 'block');
            $('#roomDetailPhoto').css('display', 'flex');
            $('#picto').css('display','flex');
            $('.price-tag').css('display','flex');
        }


        let timeList = document.getElementsByClassName("onTime");
        
        $('#hoursOfUse').html(timeList.length + " 시간");

        $('#totalPrice').html("총 "+ timeList.length * 3000 + '원');
    })

}

document.getElementById("timeSubmit").addEventListener("click", function(){

    let timetable = new Array();

    let timeList = document.getElementsByClassName("onTime");

    for(let i= 0; i<timeList.length; i++){
        timetable.push(timeList[i].value);
    }

    console.log("날짜 : " + schedule.innerHTML + ", 예약할 시간 : " + timetable);

})
/*
let webSoc; //웹소켓 변수 선언
let socUrl; // 현재 열린 소켓이 있다면 주소
let sockList = new Array; // 열린 소켓을 담을 배열

// 채팅방 연결용 !
$("#oneChat").click(e=>{
    let ipAddr = document.getElementById("ipAddr").value;
    let rN = e.target.value;

    console.log(rN);

    if(webSoc != null){
        socUrl = webSoc.url.split("/chatting/")[1]; // 소켓의 주소값을 가져온다
        if(socUrl != rN){ // 현재 열린 소켓의 주소와  버튼으로 가져온 주소가 같지 않다면 
            if(!sockList.includes(rN)){ // 현재 연 소켓이 없다면
                webSoc = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + rN);
                commonChatAjax(rN);
                // 소켓 연다
                wsOpen(rN);
            }else{
                console.log("이미 열려있다.");
                commonChatAjax(rN);
            }
        }else{
            console.log("이미 열려있다");
            commonChatAjax(rN);
        }

    }else{ // 만약 소켓이 닫혀있다면
        webSoc = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + rN);
        commonChatAjax(rN);
        sockList.push(rN);
        wsOpen(rN);
    }

    
    console.log(webSoc);


    let messageWindow = document.getElementById("chatBody");
	
	if(messageWindow.style.display =='none' || messageWindow.style.display == 0 ){
		messageWindow.style.display = 'flex';

		if(document.getElementById("faqBox").style.width != '0px' || document.getElementById("faqBox").style.width != 0){
			document.getElementById("faqBox").classList.remove('appear');
			document.getElementById("faqBox").classList.add('disappear');
		}
	}
});

$("#twoChat").click(e=>{
    let ipAddr = document.getElementById("ipAddr").value;
    let rN = e.target.value;

    console.log(rN);

    if(webSoc != null){
        socUrl = webSoc.url.split("/chatting/")[1]; // 소켓의 주소값을 가져온다
        if(socUrl != rN){ // 현재 열린 소켓의 주소와  버튼으로 가져온 주소가 같지 않다면 
            if(!sockList.includes(rN)){ // 현재 연 소켓이 없다면
                webSoc = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + rN);
                commonChatAjax(rN);
                // 소켓 연다
                wsOpen(rN);
            }else{
                console.log("이미 열려있다.");
                commonChatAjax(rN);
            }
        }else{
            console.log("이미 열려있다");
            commonChatAjax(rN);
        }

    }else{ // 만약 소켓이 닫혀있다면
        webSoc = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + rN);
        commonChatAjax(rN);
        sockList.push(rN);//쏙 리스트에 넣는다.
        wsOpen(rN);
    }

    
    console.log(webSoc);


    let messageWindow = document.getElementById("chatBody");
	
	if(messageWindow.style.display =='none' || messageWindow.style.display == 0 ){
		messageWindow.style.display = 'flex';

		if(document.getElementById("faqBox").style.width != '0px' || document.getElementById("faqBox").style.width != 0){
			document.getElementById("faqBox").classList.remove('appear');
			document.getElementById("faqBox").classList.add('disappear');
		}
	}
});

$("#threeChat").click(e=>{
    let ipAddr = document.getElementById("ipAddr").value;
    let rN = e.target.value;

    console.log(rN);

    if(webSoc != null){
        socUrl = webSoc.url.split("/chatting/")[1]; // 소켓의 주소값을 가져온다
        if(socUrl != rN){ // 현재 열린 소켓의 주소와  버튼으로 가져온 주소가 같지 않다면 
            if(!sockList.includes(rN)){ // 현재 연 소켓이 없다면
                webSoc = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + rN);
                commonChatAjax(rN);
                // 소켓 연다
                wsOpen(rN);
            }else{
                console.log("이미 열려있다.");
                commonChatAjax(rN);
            }
            
        }else{
            console.log("이미 열려있다");
            commonChatAjax(rN);
        }

    }else{ // 만약 소켓이 닫혀있다면
        webSoc = new WebSocket("ws://" + ipAddr +':8080' + "/fin/chatting/" + rN);
        commonChatAjax(rN);
        sockList.push(rN);
        wsOpen(rN);
    }

    
    console.log(webSoc);


    let messageWindow = document.getElementById("chatBody");
	
	if(messageWindow.style.display =='none' || messageWindow.style.display == 0 ){
		messageWindow.style.display = 'flex';

		if(document.getElementById("faqBox").style.width != '0px' || document.getElementById("faqBox").style.width != 0){
			document.getElementById("faqBox").classList.remove('appear');
			document.getElementById("faqBox").classList.add('disappear');
		}
	}
});


function commonChatAjax(chatRoomNo){
    
    alert("commonChatAjax 실행");

    $.ajax({
        type: 'get',
        url: "/fin/chatRoom/"+chatRoomNo,
        data: {"chatRoomNo" : chatRoomNo},
        success: function(data){  
            document.getElementById("messageBox").innerHTML += chatRoomNo;
        }
    })


}


*/