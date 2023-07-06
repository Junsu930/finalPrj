
  function check() {
    var boardTag1 = document.querySelector('input[name="boardTag"][value="1"]');
    var boardTag2 = document.querySelector('input[name="boardTag"][value="2"]');
    var boardTitle = document.querySelector('input[name="boardTitle"]');
    var boardContent = document.querySelector('textarea[name="boardContent"]');
    
    if (!boardTag1.checked && !boardTag2.checked) {
      alert("태그 중 하나를 선택해주세요.");
      return false;
    }
    
    if (boardTitle.value.trim() === "") {
      alert("제목을 입력해주세요.");
      return false;
    }
    
	if(CKEDITOR.instances.content.getData() =='' 
        || CKEDITOR.instances.content.getData().length ==0){
    alert("내용을 입력해주세요.");
    $("#content").focus();
    return false;
    }
    
    return true;
  }

