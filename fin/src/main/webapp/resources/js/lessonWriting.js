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

$("#writingBtn").click(()=>{
    if(document.getElementById("img1").files[0] == undefined){
        swal.fire("사진을 필수로 등록해주세요");
    }else if($("#lessonNamePlace").val() == null || $("#lessonNamePlace").val() == ""){
        swal.fire("이름을 입력해주세요");
    }else if($("#lessonLocationPlace").val()== null || $("#lessonLocationPlace").val()== ""){
        swal.fire("지역을 입력해주세요");    
    }else if($("#lessonSocialPlace").val()== null || $("#lessonSocialPlace").val()== ""){
        swal.fire("소셜미디어을 입력해주세요");
    }else if($("#lessonMottoPlace").val()== null || $("#lessonMottoPlace").val()== ""){
        swal.fire("좌우명을 입력해주세요");        
    }else if($("#lessonDetailExplain").val() == null ||$("#lessonDetailExplain").val() == "" ){
        swal.fire("상세 내용을 입력해주세요");
    }else if($('input[name="genre"]:checked').length < 1){
        swal.fire("장르를 선택해주세요");
    }else if($('input[name="lesson"]:checked').length< 1){
        swal.fire("악기를 선택해주세요");
    }else{

        console.log($("#lessonWriteForm"));
        $("#lessonWriteForm").submit();
    }

});





