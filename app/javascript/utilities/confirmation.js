
document.addEventListener('turbolinks:load', function() {
  console.log('Hello from confirmation.js')

  var field = document.getElementById("txtConfirmPassword")

  if (field) {
    field.addEventListener('input', checkPasswordMatch)
  }
})

function checkPasswordMatch() {
  var confirmPassword = document.getElementById("txtConfirmPassword")
  var password = document.getElementById("txtNewPassword")

  console.log('CHECKING PASSWORD')
  if (confirmPassword.value != "") {
    if (password.value != confirmPassword.value) {
      document.querySelector('.octicon-check').classList.add('hide')
      document.querySelector('.octicon-x').classList.remove('hide')  
    } 
    else {
      document.querySelector('.octicon-check').classList.remove('hide')
      document.querySelector('.octicon-x').classList.add('hide')
    }    
  }
  else {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  }  

}
