import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  left(e) {
    Turbo.visit(e.target.dataset.url)
  }

  right(e) {
    Turbo.visit(e.target.dataset.url)
  }
}
