const labelLesson = document.querySelector('.labelLesson');
const labelLocation = document.querySelector('.labelLocation');
const listBox = document.querySelector('.listBox');
const locationListBox = document.querySelector('.locationListBox');
const bi = document.getElementById('bi');
const bi2 = document.getElementById('bi2');

// filter lesson
function selctLesson() {
    if((listBox.style.display == "none") || (listBox.style.display == "") ) {
        listBox.classList.toggle("listBoxAdd");
        bi.classList.toggle( "bi-caret-up");
    } else {
        listBox.classList.toggle("listBoxAdd");
        bi.classList.toggle( "bi-caret-up");
    }
}

// filtr location
function selectLocation(){
    if((locationListBox.style.display == "none") || (locationListBox.style.display == "") ) {
        locationListBox.classList.toggle("listBoxAdd");
        bi2.classList.toggle( "bi-caret-up");
    } else {
        locationListBox.classList.toggle("listBoxAdd");
        bi2.classList.toggle( "bi-caret-up");
    }
}


// filter 온클릭 이벤트