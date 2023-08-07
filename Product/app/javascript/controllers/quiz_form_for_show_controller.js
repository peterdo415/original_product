import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quiz-form-for-show"
export default class extends Controller {
  static targets = ["optionCheckbox"];

  selectOption(event) {
    const selectedCheckbox = event.currentTarget;
    this.optionCheckboxTargets.forEach((checkbox) => {
      if (checkbox !== selectedCheckbox) {
        checkbox.checked = false;
      }
    });
  }
}
