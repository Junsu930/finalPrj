let preview = document.getElementById("imageInsertPic");

document.getElementById("img1").addEventListener("change", function(){

    if(this.files[0] != undefined){ // 파일이 선택 되었을 때
        const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
        reader.readAsDataURL(this.files[0]);
        // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

        reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
            // e.tartget == redaer
            // e.target.result == 읽어들인 이미지의 URL
            // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
            preview.setAttribute("src", e.target.result);
        }
    }
});