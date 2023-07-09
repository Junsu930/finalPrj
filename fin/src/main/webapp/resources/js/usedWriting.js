$('#usedTitlePlace').keyup(function(e){
    
    let cont = $(this).val();

    if(cont.length == 0 || cont == ''){
        $('#usedTitleInputTextLength').text('0/40');
    }else{
        $('#usedTitleInputTextLength').text(cont.length + '/40');
    }
})


$('#usedDetailExplain').keyup(e=>{

    let textCont = $(e.target).val();

    if(textCont.length == 0 || textCont == ''){
        $('#detailExplainTextAmount').html('0 / 4000');
    }else{
        $('#detailExplainTextAmount').html(textCont.length+' / 4000');
    }

    if(textCont.length > 4000) {
        $(e.target).val($(e.target).val().substring(0, 4000));
        $('#detailExplainTextAmount').html('4000 / 4000');
    }

});

let preview1 = document.getElementById("imageInsertPic1");
let preview2 = document.getElementById("imageInsertPic2");
let preview3 = document.getElementById("imageInsertPic3");

// 파일이 선택 되었을 때의 동작
document.getElementById("img1").addEventListener("change", function(){

    if(this.files[0] != undefined){// 파일이 선택 되었을 때
        const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
        reader.readAsDataURL(this.files[0]);
        // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

        reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
            // e.tartget == redaer
            // e.target.result == 읽어들인 이미지의 URL
            // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
            preview1.setAttribute("src", e.target.result);
        }
    }  
});

// 파일이 선택 되었을 때의 동작
document.getElementById("img2").addEventListener("change", function(){

    if(this.files[0] != undefined){ // 파일이 선택 되었을 때
        const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
        reader.readAsDataURL(this.files[0]);
        // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

        reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
            // e.tartget == redaer
            // e.target.result == 읽어들인 이미지의 URL
            // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
            preview2.setAttribute("src", e.target.result);
        }
    }
});

// 파일이 선택 되었을 때의 동작
document.getElementById("img3").addEventListener("change", function(){

    if(this.files[0] != undefined){ // 파일이 선택 되었을 때
        const reader = new FileReader(); // 선택된 파일을 읽을 객체 생성
        reader.readAsDataURL(this.files[0]);
        // 지정된 파일을 읽음 -> result에 저장(URL 포함) -> URL을 이용해서 이미지 볼 수 있음

        reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
            // e.tartget == redaer
            // e.target.result == 읽어들인 이미지의 URL
            // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그
            preview3.setAttribute("src", e.target.result);
        }
    }
});

$("#usedBoardInsertBtn").click(()=>{
    if(document.getElementById("img1").files[0] == undefined){
        swal.fire("사진을 필수로 등록해주세요");
    }else if($("#usedTitlePlace").val() == null || $("#usedTitlePlace").val() == ""){
        swal.fire("제목을 입력해주세요");
    }else if($("#usedProductName").val()== null || $("#usedProductName").val()== ""){
        swal.fire("상품명을 입력해주세요");
    }else if($('input[name="region"]:checked').length < 1){
        swal.fire("지역을 반드시 체크해주세요");
    }else if($('input[name="status"]:checked').length< 1){
        swal.fire("상품 상태를 선택해주세요");
    }else if($("#priceInput").val() == null || $("#priceInput").val() == ""){
        swal.fire("가격을 입력해주세요");
    }else if($("#usedDetailExplain").val() == null ||$("#usedDetailExplain").val() == "" ){
        swal.fire("상세 내용을 입력해주세요");
    }else{

        console.log($("#usedWriteForm"));
        $("#usedWriteForm").submit();
    }

});


$("#usedBoardUpdateBtn").click(()=>{
    
    if($("#usedTitlePlace").val() == null || $("#usedTitlePlace").val() == ""){
        swal.fire("제목을 입력해주세요");
    }else if($("#usedProductName").val()== null || $("#usedProductName").val()== ""){
        swal.fire("상품명을 입력해주세요");
    }else if($('input[name="region"]:checked').length < 1){
        swal.fire("지역을 반드시 체크해주세요");
    }else if($('input[name="status"]:checked').length< 1){
        swal.fire("상품 상태를 선택해주세요");
    }else if($("#priceInput").val() == null || $("#priceInput").val() == ""){
        swal.fire("가격을 입력해주세요");
    }else if($("#usedDetailExplain").val() == null ||$("#usedDetailExplain").val() == "" ){
        swal.fire("상세 내용을 입력해주세요");
    }else{

        console.log($("#usedWriteForm"));
        $("#usedWriteForm").submit();
    }


});


// 이미지 파일 삭제 담기
let xImages = new Array();
// 삭제할 이미지 담을 변수

function xUsedImage(xLevel){

    if(!xImages.includes(xLevel)){

        xImages.push(xLevel);
    }

    document.getElementById("xImages").value = xImages;

    if(xLevel == 1){

        document.getElementById("imageInsertPic2").src = "/fin/resources/images/imageinsert.png";
        document.getElementById("img2").value = "";
    }

    if(xLevel == 2){

        document.getElementById("imageInsertPic3").src = "/fin/resources/images/imageinsert.png";
        document.getElementById("img3").value = "";
    }

    console.log(document.getElementById("xImages").value);

};

let justX = document.getElementsByClassName("usedJustXBtn");

for(let eachX of justX){
    eachX.addEventListener("click", function(){
        
        this.previousElementSibling.src="/fin/resources/images/imageinsert.png";
        this.parentNode.nextElementSibling.value = "";

    });
}