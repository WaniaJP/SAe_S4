

window.addEventListener("load", init);

function init(){
  var myInput = document.getElementById("mdp");
  var letter = document.getElementById("letter");
  var capital = document.getElementById("capital");
  var number = document.getElementById("number");
  var length = document.getElementById("length");

  var password = document.getElementById("mdp2")
  

  myInput.addEventListener("focusin",function() {
    document.getElementById("message").style.display = "block";
  })

  myInput.addEventListener("focusout",function() {
    document.getElementById("message").style.display = "none";
  })

  password.addEventListener("focusout",function() {
        const mdp = document.getElementById("mdp2")
        if(myInput.value == password.value){
            document.getElementById("msgPassword").style.display = "none";
        }
        else{
            document.getElementById("msgPassword").style.display = "block";
        }
  })

  myInput.addEventListener("input",function() {
    // Validate lowercase letters
    var lowerCaseLetters = /[a-z]/g;
    if(myInput.value.match(lowerCaseLetters)) {
      letter.classList.remove("invalid");
      letter.classList.add("valid");
    } else {
      letter.classList.remove("valid");
      letter.classList.add("invalid");
  }

    // Validate capital letters
    var upperCaseLetters = /[A-Z]/g;
    if(myInput.value.match(upperCaseLetters)) {
      capital.classList.remove("invalid");
      capital.classList.add("valid");
    } else {
      capital.classList.remove("valid");
      capital.classList.add("invalid");
    }

    // Validate numbers
    var numbers = /[0-9]/g;
    if(myInput.value.match(numbers)) {
      number.classList.remove("invalid");
      number.classList.add("valid");
    } else {
      number.classList.remove("valid");
      number.classList.add("invalid");
    }

    // Validate length
    if(myInput.value.length >= 8) {
      length.classList.remove("invalid");
      length.classList.add("valid");
    } else {
      length.classList.remove("valid");
      length.classList.add("invalid");
    }
  });
}

function myFunction() {
      var p = document.getElementById("password")

      if (p.type === "password") {
        p.type = "text";
      } else {
        p.type = "password";
      }

    

    if (p3.type === "password") {
            p3.type = "text";
          } else {
            p3.type = "password";
          }

    
  } 

  function myClick() {
    var p2 = document.getElementById("mdp")
    var p3 = document.getElementById("mdp2")
    if (p2.type === "password") {
            p2.type = "text";
            p3.type = "text"
          } else {
            p2.type = "password";
            p3.type = "password"
          }
  }

function change(){
    const form1 = document.getElementById("form1")
    const form2 = document.getElementById("form2")
    
    if(form2.style.display == "none"){
        form2.style.display = "block"
        form1.style.display = "none"
    }
    else{
        form2.style.display = "none"
        form1.style.display = "block"
    }

}


function submit(e){
    let msg = document.getElementById("msg")
    if(!e.traget.checked){
        e.stopPropagation();
        msg.textContent = "Vous devez accepter nos conditions !"
        msg.style.color = "red"
    }
}