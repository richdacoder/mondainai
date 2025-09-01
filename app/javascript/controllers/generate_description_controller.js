import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="generate-description"

export default class extends Controller {
  connect() {
  }

  static targets = ["description"]
  generate(event) {
    event.preventDefault()
    // We want to make a request to the back end for the description.
    fetch("/items/generate_description", { method: "POST",
      body: new FormData(this.element),
      headers: {
        'x-csrf-token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      }
    }).then(response => response.json())
    .then((data) => {
      console.log(data)
      this.descriptionTarget.value = data.generatedDescription
    });

    // We need to find the description form and put the description into the description field.
    // const generatedDescription = "item description"
  }
}
