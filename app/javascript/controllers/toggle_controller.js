import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["label"]
  changeText(event) {
  // If the checkbox is checked, change the label text to items held
  // else, if the checkbox is unchecked, then change the label text to hold item
  if (event.currentTarget.checked) {
    this.labelTarget.innerText = "Items Held"
  } else {
    this.labelTarget.innerText = "Hold Item"
  }
  }
  connect() {
    console.log("hello")
  }
}
