import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const checkboxes = document.querySelectorAll('input[id*=color]')
    reset()

    function reset () {
      uncheck();
      checkboxes[0].checked = true
      checkboxes[0].classList.add('glow')
    }

    function uncheck () {
      checkboxes.forEach(checkbox => {
        checkbox.classList.remove('glow')
        checkbox.checked = false
      })
    }

    checkboxes.forEach(checkbox => {
      checkbox.addEventListener('click', (box) => {
        if(box.target.checked) {
          uncheck()
          box.target.checked = true
          box.target.classList.add('glow')
        } else {
          box.target.checked = true
        }
      })
    })
  }
}
