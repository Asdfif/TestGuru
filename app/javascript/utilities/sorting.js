document.addEventListener('turbolinks:load', function() {
  
  const control = document.querySelector('.sort-by-title')

  if (control) { 
    const table = document.querySelector('.table')
    control.addEventListener('click', function() {
      sortRowsByTitle(table)
    })
  }
})

function sortRowsByTitle(table) {

  if (document.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    
    sortedRows('asc', table)
    
    document.querySelector('.octicon-arrow-up').classList.remove('hide')
    document.querySelector('.octicon-arrow-down').classList.add('hide')
  
  } else {
    
    sortedRows('desc', table)
    
    document.querySelector('.octicon-arrow-up').classList.add('hide')
    document.querySelector('.octicon-arrow-down').classList.remove('hide')
  }
}

function sortedRows(asc_or_desc, table) {

  const sortedRows = Array.from(table.rows)
    .slice(1)
    switch (asc_or_desc) {
      case "asc" :
        sortedRows.sort((rowA, rowB) => (rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1))
        break
      case "desc" :
        sortedRows.sort((rowA, rowB) => (rowA.cells[0].innerHTML < rowB.cells[0].innerHTML ? 1 : -1))
        break
    }
  
  table.tBodies[0].append(...sortedRows)
}
