const msnry = new Masonry(document.getElementById("container"), {
    itemSelector: ".item",
    columnWidth: ".item",
    gutter: ".gutterSizer",
    percentPosition: !0
});

infiniteScroll({
    container: "#container",
    item: ".item",
    next: ".next",
    prev: ".prev",
    prevLoader: ".prevLoader",
    pushHistory: true,
    nextCallback: (newElement) => {
        msnry.appended(newElement)
    },
    prevCallback: (newElement) => {
        msnry.prepended(newElement)
    },
    onLoadFinish: () => {
        msnry.layout()
    }
}),

window.addEventListener("load", () => {
    msnry.layout()
})






const loader = document.querySelector('.loadingio-spinner-magnify-khdk4exhsp9');
const html = document.querySelector('html');

html.style.overflow = 'hidden'; //로딩 중 스크롤 방지

window.addEventListener('load', ()=>{

     setTimeout(() => { //  <-* 로딩속도를 구현하기 위한 코드로 실제 적용시 제거
    
      	loader.style.opacity = '0';
		html.style.overflow = 'auto'; //스크롤 방지 해제
      	
        setTimeout(() => {
      		loader.style.display = 'none';
  		}, 400);
        
  }, 5000); // <-* 로딩속도 구현

})



$(window).load(function() {
    $('.loadingio-spinner-magnify-khdk4exhsp9').hide();
});

