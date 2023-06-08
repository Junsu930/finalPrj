const labelLesson = document.querySelector('.labelLesson');
const labelLocation = document.querySelector('.labelLocation');
const listBox = document.querySelector('.listBox');
const locationListBox = document.querySelector('.locationListBox');
const bi = document.getElementById('bi');
const bi2 = document.getElementById('bi2');

// 외부영역 클릭시 닫기 하기 위한 요소

let listBoxOpen = false;
let listLocationBoxOpen = false;


const returnValue = function(){
    const listbox = false;
    const listloc = false;
    return{listbox : listbox, listloc : listloc}; // key  : value
}


const firstSec = document.querySelector('.firstSec');
const filterSec = document.querySelector('.filterSec');
const secondSec = document.querySelector('.secondSec');
const header = document.querySelector('.navBar');

// 외부영역 클릭시 닫기 하기 위한 요소


// filter lesson
function selctLesson() {
    if((listBox.style.display == "none") || (listBox.style.display == "") ) {
        listBox.classList.toggle("listBoxAdd");
        bi.classList.toggle( "bi-caret-up");
        return listBoxOpen = true;
    }
}

// filtr location
function selectLocation(){
    if((locationListBox.style.display == "none") || (locationListBox.style.display == "") ) {
        locationListBox.classList.toggle("listBoxAdd");
        bi2.classList.toggle( "bi-caret-up");
        return listLocationBoxOpen = true;
    }
}


window.addEventListener('click', function(e){
    if(listBoxOpen == true){
        if(e.target == firstSec || e.target == filterSec || e.target == secondSec || e.target == header){
            listBox.classList.remove("listBoxAdd");
            bi.classList.remove("bi-caret-up");
            bi.classList.add( "bi-caret-down");
            return listBoxOpen = false;
            // listBoxOpen == true 이고, 다른 곳 클릭 시, listBoxOpen 을 false로 바꿔줌
        }else{
            // listBoxOpen == true 이지만 다른 곳 클릭 안했을 시, 여기로 넘어옴
            console.log("listBoxOpen is" , listBoxOpen);
        }
    }

    else if(listLocationBoxOpen == true){
        if(e.target == firstSec || e.target == filterSec || e.target == secondSec || e.target == header){
            locationListBox.classList.remove("listBoxAdd");
            bi2.classList.remove("bi-caret-up");
            bi2.classList.add("bi-caret-down");
            return listLocationBoxOpen = false;
        }else{
            // listLocationBoxOpen == true 이지만 다른 곳 클릭 안했을 시, 여기로 넘어옴
            console.log("listLocationBoxOpen is" , listLocationBoxOpen);
        }
    }

    // 둘다 true 일 때 == 둘 다 필터가 열려있을 때, 외부 클릭 시 동시에 닫아야함
    else if(listBoxOpen == true && listLocationBoxOpen == true){

        console.log("listBoxOpen is " ,listBoxOpen, "listLocationBoxOpen is " ,listLocationBoxOpen);
        
        listBox.classList.remove("listBoxAdd");
        bi.classList.remove("bi-caret-up");
        bi.classList.add( "bi-caret-down");

        locationListBox.classList.remove("listBoxAdd");
        bi2.classList.remove("bi-caret-up");
        bi2.classList.add("bi-caret-down");

        let toFalse = returnValue();// 두 개의 값이 다 false를 담은 함수 호출
        listBox = toFalse.listbox;
        listLocationBoxOpen = toFalse.listloc;

    }else{
        // 둘다 false == 닫혀있을 때
        console.log("listBoxOpen is ",listBoxOpen, "listLocationBoxOpen is " ,listLocationBoxOpen);
    }
}); // window.click 끝 


// filter 온클릭 이벤트



