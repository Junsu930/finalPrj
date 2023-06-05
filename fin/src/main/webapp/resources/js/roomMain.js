let count = 5;
let $lastBox = document.querySelector(".box-card:last-child");

const obsever = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting && count < 100) {
        for (let i = 0; i < 10; i++) {
          const $newBox = document.createElement("div");
          $newBox.className = "box-card";
		  let div1 = document.createElement("div");
		  let div2 = document.createElement("div");
		  let div3 = document.createElement("div");
		  let div4 = document.createElement("div");
		  let div5 = document.createElement("div");
		  let div6 = document.createElement("div");
		  let div7 = document.createElement("div");
		  
		  let p1 = document.createElement("p");
		
		  div3.id="detail-part"

		  p1.innerHTML = "으아아";
		  div2.append(p1);

		  div4.append(div6);
		  div4.append(div7);
			

		  div3.append(div4);
		  div3.append(div5);


		  $newBox.append(div1);
		  $newBox.append(div2);
		  $newBox.append(div3);
	  
          document.querySelector(".main-card-sec").appendChild($newBox);
		  count ++;
        }
        obsever.unobserve($lastBox);
        $lastBox = document.querySelector(".box-card:last-child");
        obsever.observe($lastBox);
      }
    });
  },
  {
    threshold: 0,
  }
);

obsever.observe($lastBox);

// 로고 애니메이션
const titleLogo = document.querySelectorAll("#titleLogo path");

for(let i = 0; i<titleLogo.length; i++){
	console.log(`Letter ${i} is ${titleLogo[i].getTotalLength()}`);
}

/*********  모달  ***********/
const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
});