var dice = {
  sides: 6,
  roll: function () {
    var randomNumber = Math.floor(Math.random() * this.sides) + 1;
     return randomNumber;
  }
}
// var img1 = document.getElementById('dice-1.png');
// var img2 = document.getElementById('dice-2.png');
// var img3 = document.getElementById('dice-3.png');
// var img4 = document.getElementById('dice-4.png');
// var img5 = document.getElementById('dice-5.png');
// var img6 = document.getElementById('dice-6.png');

// var imgArr = [img1,img2,img3,img4,img5,img6];
// imgArr[0].style.display = "none";
// imgArr[1].style.display = "none";
// imgArr[2].style.display = "none";
// imgArr[3].style.display = "none";
// imgArr[4].style.display = "none";
// imgArr[5].style.display = "none";

// if(dice ==1 ){
//    imgArr[0].style.display = "block";

// }

// else if(dice == 2){

//   imgArr[1].style.display = "block";

// }

// else if(dice == 3){

//   imgArr[2].style.display = "block";

// }

// else if(dice == 4){

//   imgArr[3].style.display = "block";

// }

// else if(dice == 5){

//   imgArr[4].style.display = "block";

// }

// else {

//   imgArr[5].style.display = "block";

// }

// }
// );


//Prints dice roll to the page

function randomNumber(number) {
  var placeholder = document.getElementById('placeholder');
  placeholder.innerHTML = number;
}

var button = document.getElementById('button');
if (button) {
  button.onclick = function() {
    var result = dice.roll();
    randomNumber(result);
  }
};

// if result === 1 console.log <id="dice_one">
// if result === 2 console.log <id="dice_two">
// if result === 3 console.log <id="dice_three">
// if result === 4 console.log <id="dice_four">
// if result === 5 console.log <id="dice_five">
// if result === 6 console.log <id="dice_six">

export { dice }
;
