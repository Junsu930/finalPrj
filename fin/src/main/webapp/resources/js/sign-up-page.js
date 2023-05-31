function checkSelectAll()  {
    // 전체 체크박스
    const checkboxes 
      = document.querySelectorAll('input[name="check"]');
    // 선택된 체크박스
    const checked 
      = document.querySelectorAll('input[name="check"]:checked');
    // select all 체크박스
    const check_all 
      = document.querySelector('input[name="checkall"]');
    
    if(checkboxes.length === checked.length)  {
    checkall.checked = true;
    }else {
    checkall.checked = false;
    }
  
  }
  
  function check_all(check_all)  {
    const checkboxes 
       = document.getElementsByName('check');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = check_all.checked
    })
  }