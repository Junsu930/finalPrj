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
        
            let thisDay = info.dateStr;
            let roomNo = $("#hiddenRoomNo").val();


            $.ajax({
            
                url : "/fin/checkBookingTime",
                type : "post",
                data : {"thisDay":thisDay, "roomNo":roomNo},
                dataType : "json",
                success : function(data){
                    

                    let times = $(".times");

                    // 예약된 날에는 bookedtime 설정
                    for(let eachTime of times){
                        eachTime.classList.remove("bookedTime");
                        eachTime.disabled = false;
                        for(let i = 0; i < data.length; i++){
                        
                            if(eachTime.value == data[i]){
                                eachTime.classList.add("bookedTime");
                            
                            }
                        }
                    }

                    let bookedTime = $(".bookedTime");

                    for(let eachBooked of bookedTime){
                        eachBooked.disabled = true;
                    }
                    

                }
            });  
                
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
        
        let pricePerHour = document.getElementById("hiddenPricePerHour").value;
        
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

        $('#totalPrice').html("총 "+ timeList.length * pricePerHour + '원');
    })

}


$("#timeSubmit").click(()=>{

    if($("#sessionNoForBookRoom").val() == null || $("#sessionNoForBookRoom").val() == ""){
        swal.fire({
            title : "로그인 먼저 진행해주세요",
            icon  : "success",
            closeOnClickOutside : false
        }).then(function(){
          toLoginPage();
        });
    }else{
        let loginNo =  $("#sessionNoForBookRoom").val();
        let dayData = $("#schedule").html();
        let timeArr = new Array;
        let onTime = $(".onTime");
        let roomNo = $("#hiddenRoomNo").val();
        for(let eachTime of onTime){
            timeArr.push(eachTime.value);
        }



       $.ajax({
        
        url : "/fin/pracRoomBooking",
        type : "post",
        data : {"loginNo" : loginNo, "dayData": dayData, "timeArr" : timeArr, "roomNo" :roomNo},
        success : function(data){
            console.log(data);
            if(data>0){

                Swal.fire({icon: 'info',
                title: '예약이 완료되었습니다.',
                }).then(function(){
                    location.reload();
                })
            }
        }
       })
     
    }

});

function toLoginPage(){
	location.href="/fin/login?ref="+document.location.href;
};
