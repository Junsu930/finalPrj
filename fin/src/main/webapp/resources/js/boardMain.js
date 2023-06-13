

$('.blockBoxOpen').click(function(e)
{
    var sWidth = window.innerWidth;
    var sHeight = window.innerHeight;

    var oWidth = $('#blockModal').width();
    var oHeight = $('#blockModal').height();

    // 레이어가 나타날 위치를 셋팅한다.
    var divLeft = e.pageX; // e.pageX는 문서를 기준으로 한 마우스 위치입니다.
    var divTop = e.pageY; // e.pageY는 문서를 기준으로 한 마우스 위치입니다.

    // 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
    if( divLeft + oWidth > sWidth ) divLeft -= (oWidth + 20); // 마우스와 레이어 사이의 간격을 고려합니다.
    if( divTop + oHeight > sHeight ) divTop -= (oHeight + 20); // 마우스와 레이어 사이의 간격을 고려합니다.

    // 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
    if( divLeft < 0 ) divLeft = 0;
    if( divTop < 0 ) divTop = 0;

    $('#blockModal').css({
        "top": divTop,
        "left": divLeft,
        "position": "absolute"
    }).show();
});


// 외부영역 클릭 시 팝업 닫기
$(document).mouseup(function (e){
  var movewrap = $("#blockModal");
  if (movewrap.has(e.target).length === 0) {
    movewrap.hide();
  }
});