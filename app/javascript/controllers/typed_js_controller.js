import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Change your life", "Learn something new today."],
      typeSpeed: 50,
      loop: true
    })
  }
}
