document.addEventListener('turbolinks:load', function() {
  var field = document.querySelector('.confirmation')

  if (field) {
    const conf = document.getElementById("user_password_confirmation")
    const pass = document.getElementById("user_password")
    const check = document.querySelector('.octicon-check')
    const x = document.querySelector('.octicon-x') 

    field.addEventListener('input', function() { 
      checkPasswordMatch(conf, pass, check, x)
    })
  }
})

function checkPasswordMatch(confirmPassword, password, check_icon, x_icon) {
  switch (confirmPassword.value) {
    case "" :
      check_icon.classList.add('hide')
      x_icon.classList.add('hide')
      break
    case password.value :
      check_icon.classList.remove('hide')
      x_icon.classList.add('hide')
      break
    default :
      check_icon.classList.add('hide')
      x_icon.classList.remove('hide')  
      break
  } 
}
