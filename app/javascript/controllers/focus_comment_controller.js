import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.setAttribute('data-action', 'click->focus-comment#click')
  }
  click(){
    const commentForm = document.getElementById('comment_form')
    commentForm.form[0].form[1].focus()
  }
}
