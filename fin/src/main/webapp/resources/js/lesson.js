const labelLesson = document.querySelector('.labelLesson');
const labelLocation = document.querySelector('.labelLocation');
const listBox = document.querySelector('.listBox');
const locationListBox = document.querySelector('.locationListBox');
const bi = document.getElementById('bi');
const bi2 = document.getElementById('bi2');


const lessonBtn = document.getElementById('lessonBtn');
const lessonBtnTitle = document.getElementById('lessonBtnTitle');
const liArr = document.getElementById('lessonId').children; // lessonId(ul) > li


// 필터 클릭 하고 목록 클릭 시, 목록 타이틀로 필터 버튼 타이틀이 바뀜
for(let eachLi of liArr){
    eachLi.addEventListener("click", ()=>{
        console.log("click");
        lessonBtnTitle.innerText = eachLi.innerText;
        selctLesson(); // 버튼 클릭하고 버튼 다시 닫히는 함수
    })
}

const locBtn = document.getElementById('locBtn');
const locBtnTitle = document.getElementById('locBtnTitle');
const liArr2 = document.getElementById('locId').children; // locId(ul) > li

// 필터 클릭 하고 목록 클릭 시, 목록 타이틀로 필터 버튼 타이틀이 바뀜
for(let eachLi2 of liArr2){
    eachLi2.addEventListener('click', () =>{
        locBtnTitle.innerText = eachLi2.innerText;
        selectLocation(); // 버튼 클릭하고 버튼 다시 닫히는 함수
    })
}

// 외부영역 클릭시 닫기 하기 위한 요소

let listBoxOpen = false;
let listLocationBoxOpen = false;


const returnValue = function(){
    const listbox = false;
    const listloc = false;
    return{"listbox" : listbox, "listloc" : listloc}; // key  : value
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
        
    }
}); // window.click 끝 





// 필터 x 무한스크롤
$(document).ready(() =>{
    console.log("ready");
    $.ajax({
        url: "lessonScroll",
        type: "GET",
        dataType: "JSON",
        success: function(data){

            
            
            lessonList = data;

            

            lessonListLength = lessonList.length;
            let countNum = lessonListLength < 4 ? lessonListLength: 4; // 조건식 ? 참 : 거짓;

            if(lessonListLength == 0){
                
                let emptyDiv = document.createElement("div");
                secondSec.append(emptyDiv);
                emptyDiv.className= "emptyDiv";
                emptyDiv.innerHTML = "<h1>NO DATA!</h1>";
               
            }else{

                
                for(let i = 0; i < countNum; i++){

                  

                    const input = document.createElement("input");
                    secondSec.append(input);

                    input.type = "hidden";
                    input.value = lessonList[i].lessonNo;
                    
                    const imgWrap = document.createElement("div");
                    imgWrap.className ="imgCotentWrap";
                    imgWrap.onclick = function(){location.href='/fin/lessonDetail?lessonNo=' + lessonList[i].lessonNo}
                    
                    //imgWrap에 들어갈 div 만들기
                    let div1 = document.createElement("div");
                    let div2 = document.createElement("div");
                    
                    imgWrap.append(div1);
                    imgWrap.append(div2);
                    secondSec.append(imgWrap);
                    div1.className = "imgBox";
                    let lessonImg = document.createElement('img');
                    lessonImg.src = '/fin' + lessonList[i].imgSrc;
                    div1.append(lessonImg);
                    // div1.innerHTML = '<img src="" alt="">';

                    // let imgBoxImg = document.querySelector('.imgBox > img');
                    // imgBoxImg[i].src = 

                    div2.className = "contentBox";
                    div2.innerHTML 
                    = "<p id='scrollOver'>"
                    + lessonList[i].motto 
                    +" </p><p>" 
                    + lessonList[i].region 
                    + " / " + lessonList[i].inst + "</p> <span>" 
                    + lessonList[i].writingDate 
                    + "</span><p>by.&nbsp" 
                    + lessonList[i].userNick 
                    + "</p>";

                    secondSec.appendChild(imgWrap);
                }
                observerBox = document.querySelector('.imgCotentWrap:last-child');

                let count = 4;

                const observer = new IntersectionObserver(
                    (entries) =>{
                        entries.forEach((entry) =>{
                            if(entry.isIntersecting && count < lessonListLength){
                                let toCount;

                                if(count + 4 <= lessonListLength){
                                    toCount = count + 4;
                                }else{
                                    toCount = lessonListLength;
                                }
                                for (let i = count; i < toCount; i++){

                                   

                                    const input = document.createElement("input");
                                    secondSec.append(input);

                                    input.type = "hidden";
                                    input.value = lessonList[i].lessonNo;
                                    
                                    const imgWrap = document.createElement("div");
                                    imgWrap.className ="imgCotentWrap";
                                    imgWrap.onclick = function(){location.href='/fin/lessonDetail?lessonNo=' + lessonList[i].lessonNo}
                                    
                                    //imgWrap에 들어갈 div 만들기
                                    let div1 = document.createElement("div");
                                    let div2 = document.createElement("div");
                                    
                                    imgWrap.append(div1);
                                    imgWrap.append(div2);
                                    secondSec.append(imgWrap);
                                    div1.className = "imgBox";
                                    let lessonImg = document.createElement('img');
                                    lessonImg.src = '/fin' + lessonList[i].imgSrc;
                                    div1.append(lessonImg);

                                    // div1.innerHTML = '<img src="" alt="">';

                                    // let imgBoxImg = document.querySelector('.imgBox > img');
                                    // imgBoxImg[i].src = '/fin' + lessonList[i].imgSrc;

                                    div2.className = "contentBox";
                                    div2.innerHTML 
                                    = "<p id='scrollOver'>"
                                    + lessonList[i].motto 
                                    +" </p><p>" 
                                    + lessonList[i].region 
                                    + " / " + lessonList[i].inst + "</p> <span>" 
                                    + lessonList[i].writingDate 
                                    + "</span><p>by.&nbsp" 
                                    + lessonList[i].userNick 
                                    + "</p>";
                                    
                                    count ++;
                                }
                                let observerBox = document.querySelector('.imgCotentWrap:last-child');

                                observer.unobserve(observerBox);
                                observerBox = document.querySelector('.imgCotentWrap:last-child');
                                observer.observe(observerBox);
                            }
                        });
                    },
                    {
                        threshold: 0.5,
                    }
                    
                );
                if(observerBox!=null){
                    observer.observe(observerBox);
                  }
            } // else 끝
        },
        error: function(request, status, error){
            console.log("lessonScroll AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    });
});



// 필터 함수
function filterFunc(){

    let lessonBtnTitleText = document.getElementById('lessonBtnTitle').innerText // 레슨 필터 innerText
    let locBtnTitleText = document.getElementById('locBtnTitle').innerText
    

    $.ajax({
        url : "filterLesson",
        type: "GET",
        data: {"lessonBtnTitleText":lessonBtnTitleText, "locBtnTitleText": locBtnTitleText},
        dataType: "JSON",
        success: function(data){
            
            secondSec.innerHTML = '';

           
            
            lessonList = data;
    
            console.log(lessonList.length);
    
            lessonListLength = lessonList.length;
            let countNum = lessonListLength < 4 ? lessonListLength: 4; // 조건식 ? 참 : 거짓;
    
            if(lessonListLength == 0){
                
    
                let emptyDiv = document.createElement("div");
                secondSec.append(emptyDiv);
                emptyDiv.className= "emptyDiv";
                emptyDiv.innerHTML = "<h1>NO DATA!</h1>";
               
            }else{
    
                
                for(let i = 0; i < countNum; i++){
    
                    
    
                    const input = document.createElement("input");
                    secondSec.append(input);
    
                    input.type = "hidden";
                    input.value = lessonList[i].lessonNo;
                    
                    const imgWrap = document.createElement("div");
                    imgWrap.className ="imgCotentWrap";
                    imgWrap.onclick = function(){location.href='/fin/lessonDetail?lessonNo=' + lessonList[i].lessonNo}
                    
                    //imgWrap에 들어갈 div 만들기
                    let div1 = document.createElement("div");
                    let div2 = document.createElement("div");
                    
                    imgWrap.append(div1);
                    imgWrap.append(div2);
                    secondSec.append(imgWrap);
                    div1.className = "imgBox";

                    let lessonImg = document.createElement('img');
                    lessonImg.src = '/fin' + lessonList[i].imgSrc;
                    div1.append(lessonImg);

                    // div1.innerHTML = '<img src="" alt="">';

                    // let imgBoxImg = document.querySelector('.imgBox > img');
                    // imgBoxImg[i].src = '/fin' + lessonList[i].imgSrc;
    
                    div2.className = "contentBox";
                    div2.innerHTML 
                    = "<p id='scrollOver'>"
                    + lessonList[i].motto 
                    +" </p><p>" 
                    + lessonList[i].region 
                    + " / " + lessonList[i].inst + "</p> <span>" 
                    + lessonList[i].writingDate 
                    + "</span><p>by.&nbsp" 
                    + lessonList[i].userNick 
                    + "</p>";
    
                    secondSec.appendChild(imgWrap);
                }
                observerBox = document.querySelector('.imgCotentWrap:last-child');
    
                let count = 4;
    
                const observer = new IntersectionObserver(
                    (entries) =>{
                        entries.forEach((entry) =>{
                            if(entry.isIntersecting && count < lessonListLength){
                                let toCount;
    
                                if(count + 4 <= lessonListLength){
                                    toCount = count + 4;
                                }else{
                                    toCount = lessonListLength;
                                }
                                for (let i = count; i < toCount; i++){
    
                                    
                                    
                                    
    
                                    const input = document.createElement("input");
                                    secondSec.append(input);
    
                                    input.type = "hidden";
                                    input.value = lessonList[i].lessonNo;
                                    
                                    const imgWrap = document.createElement("div");
                                    imgWrap.className ="imgCotentWrap";
                                    imgWrap.onclick = function(){location.href='/fin/lessonDetail?lessonNo=' + lessonList[i].lessonNo}
                                    
                                    //imgWrap에 들어갈 div 만들기
                                    let div1 = document.createElement("div");
                                    let div2 = document.createElement("div");
                                    
                                    imgWrap.append(div1);
                                    imgWrap.append(div2);
                                    secondSec.append(imgWrap);
                                    div1.className = "imgBox";
                                    let lessonImg = document.createElement('img');
                                    lessonImg.src = '/fin' + lessonList[i].imgSrc;
                                    div1.append(lessonImg);


                                    // div1.innerHTML = '<img src="" alt="">';

                                    // let imgBoxImg = document.querySelector('.imgBox > img');
                                    // imgBoxImg[i].src = '/fin' + lessonList[i].imgSrc;
    
                                    div2.className = "contentBox";
                                    div2.innerHTML 
                                    = "<p id='scrollOver'>"
                                    + lessonList[i].motto 
                                    +" </p><p>" 
                                    + lessonList[i].region 
                                    + " / " + lessonList[i].inst + "</p> <span>" 
                                    + lessonList[i].writingDate 
                                    + "</span><p>by.&nbsp" 
                                    + lessonList[i].userNick 
                                    + "</p>";
                                    
                                    count ++;
                                }
                                let observerBox = document.querySelector('.imgCotentWrap:last-child');
    
                                observer.unobserve(observerBox);
                                observerBox = document.querySelector('.imgCotentWrap:last-child');
                                observer.observe(observerBox);
                            }
                        });
                    },
                    {
                        threshold: 0.5,
                    }
                    
                );
                if(observerBox!=null){
                    observer.observe(observerBox);
                  }
            } // else 끝
        },
        error: function(request, status, error){
            console.log("filterLesson AJAX 에러 발생");
            console.log("상태코드 : " + request.status); // 404, 500
        }
    
    });
}




// 대상 span 요소를 가져오기
let targetSpan = document.getElementById("lessonBtnTitle");
let targetSpan2 = document.getElementById('locBtnTitle');

let spanObserver = new MutationObserver(filterFunc);
let spanObserver2 = new MutationObserver(filterFunc);
// MutationObserver 생성자를 사용하여 새로운 변화를 감지
// let spanObserver = new MutationObserver(function(mutations) {
//   // 변화가 감지되면 실행되는 콜백 함수
//   mutations.forEach(function(mutation) {
//     // span 요소의 innerText가 변경
//     console.log("새로운 값:", mutation.target.innerText);
//     // span이 변경됐으니, 해당 함수 실행
    
//   });
// });

// let spanObserver2 = new MutationObserver(function(mutations) {
   
//     mutations.forEach(function(mutation) {
      
//       console.log("새로운 값:", mutation.target.innerText);
//       filterFunc();
//     });
// });

// MutationObserver를 설정하여 span 요소의 텍스트 변경을 감지
// MutationObserver는 단일요소만 관측 가능
spanObserver.observe(targetSpan, { subtree: true, characterData: true, childList: true });
spanObserver2.observe(targetSpan2, { subtree: true, characterData: true, childList: true });





