const searchingForm = document.getElementById('searchingForm');


searchingForm.onsubmit = function(){
    const fixedHeight = document.querySelector('.navBar').clientHeight;

    const genderInput = document.querySelectorAll('input[name="gender"]:checked').length;
    let genderLocation = document.querySelector("#genderP").offsetTop;

    const instLength = document.querySelectorAll('input[name="inst"]:checked').length;
    let positionLocation = document.querySelector("#positionP").offsetTop;

    const genreLength = document.querySelectorAll('input[name="genre"]:checked').length;
    let genreLocation = document.querySelector('#genreP').offsetTop;

    const regionLength = document.querySelectorAll('input[name="region"]:checked').length;
    let regionLocation = document.querySelector('#locationP').offsetTop;

  
    

    if(genderInput == 0){
        alert("GENDER 항목이 비었습니다!");
        window.scrollTo({top:genderLocation - fixedHeight, behavior:'smooth'});
        return false;
    }else if(instLength == 0){
        alert("POSITION 항목이 비었습니다!");
        window.scrollTo({top:positionLocation - fixedHeight, behavior:'smooth'});
        return false;
    }else if(genreLength == 0){
        alert("GENRE 항목이 비었습니다!");
        window.scrollTo({top:genreLocation - fixedHeight, behavior:'smooth'});
        return false;
    }else if( regionLength == 0){
        alert("REGION 항목이 비었습니다!");
        window.scrollTo({top:regionLocation - fixedHeight, behavior:'smooth'});
        return false;
    }


    // break;를 하면 form이 submit이 되면서 에러가 난다. 그래서 return false로 에러가 나는것을 방지
    // const inputLength = document.querySelectorAll('input[type="radio"]:checked').length;
    // switch(inputLength){
    //     case 0 : alert("전 항목이 비었습니다!");
    //     return false; 
    //     case 1 : alert("3개의 항목이 비었습니다!");
    //     return false;
    //     case 2 : alert("2개의 항목이 비었습니다!");
    //     return false;
    //     case 3 : alert("1개의 항목이 비었습니다!");
    //     return false;
    //     case 4 : location.href = "findingLoder.jsp"
    //     default:
    //         break;
    // }
}