document.addEventListener('turbolinks:load', function() {
  
  let control = document.querySelector('.sort-by-title')

  if (control) { 
    let table = document.querySelector('.table')
    control.addEventListener('click', function() {
      sortRowsByTitle(table)
    })
  }
})

function sortRowsByTitle(table) {

  if (document.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    
    var sortedRows = Array.from(table.rows)
      .slice(1)
      .sort((rowA, rowB) => 
        rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1)
    
    table.tBodies[0].append(...sortedRows)
    
    document.querySelector('.octicon-arrow-up').classList.remove('hide')
    document.querySelector('.octicon-arrow-down').classList.add('hide')
  
  } else {
    
    var sortedRows = Array.from(table.rows)
      .slice(1)
      .sort((rowA, rowB) => 
        rowA.cells[0].innerHTML < rowB.cells[0].innerHTML ? 1 : -1)
    
    table.tBodies[0].append(...sortedRows)
    
    document.querySelector('.octicon-arrow-up').classList.add('hide')
    document.querySelector('.octicon-arrow-down').classList.remove('hide')
  }
}
