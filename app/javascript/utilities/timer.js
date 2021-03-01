document.addEventListener('turbolinks:load', function() {
  
  const timer_control = document.querySelector('.timer')
  const passed_time_control = document.querySelector('.passed_time')


  if (timer_control) {
    const timer = parseFloat(timer_control.dataset.testTimer)
    const start = new Date(parseFloat(timer_control.dataset.startTime))
    time_left(start, timer)
  }

  function time_left(start_time, test_timer) {
    let t_left = test_timer - parseInt((new Date() - start_time)/1000)
    if (t_left <= 0) {
      document.getElementsByTagName('input').commit.click()
    }
    document.getElementById('count').innerHTML = t_left
    setTimeout(time_left, 1000, start_time, test_timer)
  }

  if (passed_time_control) {
    const timer = parseFloat(passed_time_control.dataset.testTimer)    
    const start = new Date(parseFloat(passed_time_control.dataset.startTime))
    time_spent(start, timer)
  }

  function time_spent(start_time, test_timer) {
    let t_left = parseInt((new Date() - start_time)/1000)
    document.getElementById('time').innerHTML = t_left
    let time_left_control = document.getElementById('time_left')
    if (time_left_control) {
      time_left_control.innerHTML = test_timer - t_left
    }
  }
})