import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-sender"
export default class extends Controller {
  static targets = ["container", "bubble"]
  connect() {
    console.log(this.containerTargets);

    if (localStorage.getItem("currentUserId") === this.element.dataset.senderId){
      this.containerTargets.forEach((container)=>{
        container.classList.add("justify-content-end")
      })
      this.bubbleTarget.classList.add("bg-white")
    } else {
      this.containerTargets.forEach((container)=>{
        container.classList.add("justify-content-start")
      })
      this.bubbleTarget.classList.add("bg-black")
      this.bubbleTarget.classList.add("text-white")

    }
  }
}
