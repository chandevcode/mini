// app/javascript/controllers/flash_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    delay: { type: Number, default: 3000 }
  }

  connect() {
    this.timeout = setTimeout(() => {
      this.hide()
    }, this.delayValue)
  }

  hide() {
    // Optional animation class
    this.element.classList.add("opacity-0", "-translate-y-2")

    setTimeout(() => {
      this.element.remove()
    }, 300)
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
