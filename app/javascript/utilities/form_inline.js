document.addEventListener('turbolinks:load', function() {

  const formInLine = document.querySelector('.form-inline-link')

  if (formInLine) {

    let links = document.querySelectorAll('.form-inline-link')

    links.forEach(function(link) {
      link.addEventListener('click', formInLineLinkHandler )
    })

    const errors = document.querySelector('.resource-errors')

    if (errors) {
      const resourceId = errors.dataset.resourceId

      formInLineHandler(resourceId)
    }
  }
})

function formInLineLinkHandler(event) {
  event.preventDefault()

  const testId = this.dataset.testId

  formInLineHandler(testId)
}

function formInLineHandler(testId){

  const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  const $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  const $formInLine = $('.form-inline[data-test-id="' + testId + '"]')

  $formInLine.toggle()
  $testTitle.toggle()

  if ($formInLine.is(':visible')) {  
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
