



let modalBandInfo = document.querySelector('.js-static-modal-toggleInfoBandP');
let modalFromInviBox;


$(document).ready(function(){
    if(modalBandInfo == null){
        return false
    }else{
        modalBandInfo.addEventListener('click', function(e) {
   
            let bandNoVal = e.target.nextElementSibling.value;
            console.log(bandNoVal + "번 밴드");
            
            // 자꾸 이전에 내용이 중첩돼서 모달에 추가됨
            // 이전에 추가된 내용 삭제
            let bandInfoSec = document.querySelector('.bandInfoSec');
            bandInfoSec.innerHTML = '';
        
            modalFromInviBox = new Modal({el: document.getElementById('static-modalInfoBand'), bnadNoKey: bandNoVal}).show();
            $.ajax({
                url: "modalBandInfo",
                method: "GET",
                data: { "bandNoKey": bandNoVal },
                dataType: "JSON",
                success: function(data) {
                    let bandNameInfo = document.createElement('div');
                    let h1 = document.createElement('h1');
        
                    let bnadMentInfo = document.createElement('div');
                    let p = document.createElement('p');
        
                    bandNameInfo.append(h1);
                    bandNameInfo.className = "bandNameInfo";
                    h1.innerText = data.bandName + "🎵";
        
                    bnadMentInfo.append(p);
                    bnadMentInfo.className = "bnadMentInfo";
                    p.innerText = data.ment +  "! \n\nLeader. " + data.leaderNick + "🎶";
        
                    
                    bandInfoSec.append(bandNameInfo);
                    bandInfoSec.append(bnadMentInfo);
                },
                error: function(request, status, error) {
                    console.log("modalBandInfo AJAX 에러 발생");
                    console.log("상태코드: " + request.status);
                }
            });
        });
    }
})



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


