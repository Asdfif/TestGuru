document.addEventListener('turbolinks:load', function() {
  var line = document.querySelector('.progress-bar')

  if (line) {
    const currentQuestionNumber = line.dataset.currentQuestionNumber
    const maxQuestions = line.dataset.testQuestionsCount

    progressBar(currentQuestionNumber, maxQuestions, line)
  }
})  

function progressBar(currentWigth, maxWigth, line) {
  const width_progress_bar = currentWigth / maxWigth * 100
  line.style.width = width_progress_bar + '%'
}
