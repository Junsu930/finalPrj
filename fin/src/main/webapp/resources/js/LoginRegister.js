let password = document.getElementById('password');
let eye = document.getElementById('eye');
    
function showAndHide(){
    if(password.type === 'password'){
        password.setAttribute('type', 'text');
        eye.classList.toggle('bi-eye-slash-fill');
    }else{
        password.setAttribute('type', 'password');
        eye.classList.toggle('bi-eye-slash-fill');
    }
}


const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');




registerLink.addEventListener('click', ()=> {
    wrapper.classList.add('active');
});

loginLink.addEventListener('click', ()=> {
    wrapper.classList.remove('active');
});


let showBusiness = document.getElementById('showBusiness');
let busniessBox = document.querySelector('.busniessBox');

showBusiness.addEventListener('click', () =>{
    busniessBox.classList.toggle('busniessBox');
});

