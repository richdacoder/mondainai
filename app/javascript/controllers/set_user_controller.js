import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-user"
export default class extends Controller {
  connect() {
    if (this.element.dataset.currentUserId){
      localStorage.setItem("currentUserId", this.element.dataset.currentUserId )
    }
  }
}
