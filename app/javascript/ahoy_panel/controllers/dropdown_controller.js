import { Controller } from '@hotwired/stimulus'
import { leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['items']

  connect() {
    document.body.addEventListener('click', (e) => {
      if (!this.element.contains(e.target)) {
        leave(this.itemsTarget)
      }
    })
  }

  open() {
    toggle(this.itemsTarget)
  }
}
