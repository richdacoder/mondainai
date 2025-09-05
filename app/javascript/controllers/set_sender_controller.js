import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-sender"
export default class extends Controller {
  static values = {
    userId: Number
  }
  static targets = ["container", "bubble", "me", "otherPerson"]
  connect() {
    console.log(this.userIdValue);

    if (this.userIdValue === Number(document.body.dataset.currentUserId)){
      this.bubbleTarget.classList.add("chat-current-user")
      this.containerTarget.classList.add("justify-content-end")
      this.meTarget.classList.remove("d-none")
    } else {
      this.bubbleTarget.classList.add("chat-other-user")
      this.containerTarget.classList.add("justify-content-start")
      this.otherPersonTarget.classList.remove("d-none")
    }
  }
}
