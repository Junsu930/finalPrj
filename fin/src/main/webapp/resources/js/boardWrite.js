
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
    
    if (boardContent.value.trim() === "") {
      alert("내용을 입력해주세요.");
      return false;
    }
    
    return true;
  }

