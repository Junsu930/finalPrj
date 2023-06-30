/* 지역 선택 버튼 JS */
$('#selectBtn').on("click",()=>{

	if($('#selectTypeListUl').hasClass("disappearList")){
		
		$('#bi').toggleClass( "bi-caret-up");
		$('#selectTypeListUl').removeClass("disappearList");
	}else{

		$('#bi').toggleClass( "bi-caret-up");
		$('#selectTypeListUl').addClass("disappearList");
	}
});


$(document).click(e=>{

	if(!$(e.target).parent().hasClass('selectBtn') && !$(e.target).hasClass('selectBtn')
		&& !$(e.target).parent().hasClass('selectTypeListUl')){
		if(!$('#selectTypeListUl').hasClass("disappearList")){
			
			$('#bi').toggleClass( "bi-caret-up");
			$('#selectTypeListUl').addClass("disappearList");
		}
	}
})

let seliArr = $('#selectTypeListUl > li');

for(let eachLi of seliArr){
	$(eachLi).click(()=>{
		$('#selectTextSpan').html($(eachLi).html());
        $("#selectType").val($(eachLi).html());
        $('#selectTypeListUl').addClass("disappearList");
        $('#bi').toggleClass( "bi-caret-up");
	});
}

$("#s-btn").click(function(){
    if($("#bandBoardSearch").val() == null || $("#bandBoardSearch").val() ==""){
        swal.fire("검색어를 입력해주세요");
    }else{
        $("#searcingMyBoardForm").submit();
    }
    
});


function enterCheck(){

    if($("#bandBoardSearch").val() == null || $("#bandBoardSearch").val() ==""){
        swal.fire("검색어를 입력해주세요");
        return false;
    }else{
        return true;
    }
}

