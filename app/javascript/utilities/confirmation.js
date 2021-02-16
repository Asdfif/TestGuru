document.addEventListener('turbolinks:load', function() {
  console.log('Hello from confirmation.js')

  var field = document.querySelector('.confirmation')

  if (field) {
    field.addEventListener('input', checkPasswordMatch)
  }
})

function checkPasswordMatch() {
  var confirmPassword = document.getElementById("user_password_confirmation")
  var password = document.getElementById("user_password")

  console.log('CHECKING PASSWORD')
  if (confirmPassword.value != "") {
    if (confirmPassword.value != password.value) {
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
