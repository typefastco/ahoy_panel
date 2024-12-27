import { Controller } from '@hotwired/stimulus'
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['button', 'mobileMenu', 'closedIcon', 'openedIcon']

  toggle(e) {
    toggle(this.mobileMenuTarget);

    if (this.buttonTarget.dataset.open === 'false') {
      this.closedIconTarget.classList.add('hidden')
      this.openedIconTarget.classList.remove('hidden')
      this.buttonTarget.dataset.open = 'true'
    } else {
      this.closedIconTarget.classList.remove('hidden')
      this.openedIconTarget.classList.add('hidden')
      this.buttonTarget.dataset.open = 'false'
    }
  }
}
