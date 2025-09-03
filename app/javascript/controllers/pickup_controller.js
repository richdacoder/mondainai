import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pickup"
export default class extends Controller {
  static targets = ["message"]

  confirm(event) {
    event.PreventDefault()

    const dateInput = this.element.querySelector("input[name='request[pickup_date]']")

    if (dateInput && dateInput.value) {
      this.messageTarget.textContent = `✅ You have selected ${dateInput.value} for pickup.`
    } else {
      this.messageTarget.textContent = "⚠️ Please select a pickup date first."
    }
   }

  connect() {
  }
}
