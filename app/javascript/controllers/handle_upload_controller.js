import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener('change', function() {
    var files = this.files;
      if (files.length > 2) {
        alert('Please select only two files.');
        this.value = '';
      }
    });
  }
}
