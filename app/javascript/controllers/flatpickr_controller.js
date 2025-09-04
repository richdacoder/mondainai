import { Controller } from "@hotwired/stimulus"

import flatpickr from "flatpickr"


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static values = {
    inline: true,
    minDate: String,
    maxDate: String
  }

  connect() {
    this.picker = flatpickr(this.element, {
    inline: this.inlineValue,
    minDate: this.minDateValue,
    maxDate: this.maxDateValue
    })
  }
}
