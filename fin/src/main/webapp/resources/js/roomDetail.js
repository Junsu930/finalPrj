let calendar;
let today = new Date();
let toWeeks = new Date();
let weeks =  new Date(toWeeks.setDate(toWeeks.getDate() + 7));
let tt = today.toISOString().split('T')[0];
let tw = weeks.toISOString().split('T')[0];
const schedule = document.getElementById("schedule");
const timeline = document.getElementById("timeline");
const timesClass = document.getElementsByClassName("times");


console.log(tt +  "\n" +tw);

	document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById('calendar');
    
    calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면 (기본 설정: 달)
        locale: 'ko', // 한국어 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        height: '500px', // calendar 높이 설정
        dateClick: function(info) {

        const diffMSec = today.getTime() - info.date.getTime();
        const diffDate = diffMSec / (24 * 60 * 60 * 1000);
        
        if(diffDate<1 && diffDate >-6){
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

for(let time of times){
    time.addEventListener("click", function(){
        if(!this.classList.contains("onTime")){
            this.classList.add("onTime");
        }else{
            this.classList.remove("onTime");
        }
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