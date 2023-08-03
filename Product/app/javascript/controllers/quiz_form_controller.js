import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.selectedOption = null;
    this.refreshOptions();
  }

  selectOption(event) {
    this.selectedOption = event.target.value;
    this.refreshOptions();
  }

  refreshOptions() {
    const options = this.element.querySelectorAll(".option-radio");
    options.forEach((option) => {
      option.checked = option.value === this.selectedOption;
    });
  }
}
