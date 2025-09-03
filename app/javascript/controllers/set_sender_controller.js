import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-sender"
export default class extends Controller {
  static targets = ["container", "bubble"]
  connect() {
    console.log(this.containerTargets);

    if (localStorage.getItem("currentUserId") === this.element.dataset.senderId){
      this.bubbleTarget.classList.add("chat-current-user")
    } else {
      this.bubbleTarget.classList.add("chat-other-user")
    }
  }
}
