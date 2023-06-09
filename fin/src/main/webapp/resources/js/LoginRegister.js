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
    busniessBox.classList.toggle('USER');
    setText();
       if (showBusiness.innerText === 'USER') {
        busniessBox.classList.add('visible');
        console.log(busniessBox);
    } else {
        busniessBox.classList.remove('visible');
    }
});


function setText() {
    const $showBusiness = document.getElementById("showBusiness")
    const text = $showBusiness.innerText;
    $showBusiness.innerText = text === "USER" ? "Business" : "USER";
}

    document.querySelector('.js-static-modal-toggle').addEventListener('click', function() {
      new Modal({el: document.getElementById('static-modal')}).show();
    });


("use strict");

const form = document.querySelector("#form__wrap");
const checkAll = document.querySelector(".terms__check__all input");
const checkBoxes = document.querySelectorAll(".input__check input");
const submitButton = document.querySelector("button");

const agreements = {
  termsOfService: false,
  privacyPolicy: false,
  allowPromotions: false
};

form.addEventListener("submit", (e) => e.preventDefault());

checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle("active");
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener("click", (e) => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add("active");
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove("active");
    });
  }
  toggleSubmitButton();
});





	