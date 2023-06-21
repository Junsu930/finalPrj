let preview = document.getElementById("imageInsertPic");

document.getElementById("img1").addEventListener("change", function(){

    if(this.files[0] != undefined){ 
        const reader = new FileReader(); 
        reader.readAsDataURL(this.files[0]);
        // 지정된 파일을 읽음 -> result에 저장(URL 포함) 

        reader.onload = function(e){ 
            // e.tartget == redaer
            // e.target.result == 읽어들인 이미지의 URL
            // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
            preview.setAttribute("src", e.target.result);
        }
    }
});




