let calendar;
let today = new Date();
let toWeeks = new Date();
let weeks =  new Date(toWeeks.setDate(toWeeks.getDate() + 7));
let tt = today.toISOString().split('T')[0];
let tw = weeks.toISOString().split('T')[0];


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
            console.log(info.dateStr);
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
