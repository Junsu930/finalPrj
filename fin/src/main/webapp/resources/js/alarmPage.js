



let modalBandInfo = document.querySelector('.infoP');
let modalFromInviBox;

let alarmWrapper = document.querySelectorAll('alarmWrapper')
for(let i = 0; i< alarmWrapper.length; i++){

    modalBandInfo.addEventListener('click', function(e){
        console.log("asdadsasdads");
        let bandNoVal = e.target.nextElementSibling.value;
        console.log(bandNoVal);
        modalFromInviBox = new Modal({el: document.getElementById('static-modalInfoBand'), bnadNoKey : bandNoVal}).show();

        $.ajax({
            url:"modalBandInfo",
            method:"GET",
            data:{"bandNoKey":bandNoVal},
            dataType:"JSON",
            success: function(data){
                let bandInfoSec = document.querySelector('.bandInfoSec');
                let bandNameInfo = document.createElement('div');
                let h1 = document.createElement('h1');

                let bnadMentInfo = document.createElement('div');
                let p = document.createElement('p');

                bandInfoSec.append(bandNameInfo);
                bandNameInfo.append(h1);
                bandNameInfo.className = "bandNameInfo";
                h1.innerText = data.bandName + "🎵";

                bandInfoSec.append(bnadMentInfo)
                bnadMentInfo.append(p);
                bnadMentInfo.className = "bnadMentInfo";
                p.innerText = data.ment + "! by " + data.leaderNick + "🎶";
            },
            error : function(request, status, error){
                console.log("modalBandInfo AJAX 에러 발생");
                console.log("상태코드 : " + request.status); 
              }
        })
    });
}


function changeText(){
    inviEmpty.innerText = '';
    inviEmpty.innerText = '👋 BACK TO MAIN!'
}

$(document).ready(function(){
    let inviEmpty = document.getElementById('inviEmpty');
    if(inviEmpty == null){
        return false
    }else{
        inviEmpty.addEventListener('mouseover', changeText);
    }
})


