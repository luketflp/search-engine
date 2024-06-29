import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  search(e) {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
      this.saveSearch(e.target.value);
    }, 500)
  }

  saveSearch(searchedValue) {
    fetch('searchs/create', {
      method: "POST",
      body: {
        query: searchedValue
      }
    })
    .then(response => response.json())
    .then(data => {
      console.log("Success:", data);
      // Optionally, handle the response data here
    })
    .catch(error => {
      console.error("Error:", error);
    });
  }
}
