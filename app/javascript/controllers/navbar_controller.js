import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const dropdownMenu = document.querySelectorAll('[nav-element]');
    const mainDropdown = document.getElementById('nav')
    const toggleDropdown = function (element) {
      element.classList.add("show");
    };

    dropdownMenu.forEach(dropdown => {
      dropdown.addEventListener("mouseenter", function () {
      var dropdownValue = this.attributes[0].value;
      var child = document.querySelector(`#nav #\\3${dropdownValue}`);
      if(!mainDropdown.classList.contains("show")) {
        toggleDropdown(mainDropdown);
        toggleDropdown(child);
      } else if(!child.classList.contains("show")) {
        document.querySelector('#nav .show').classList.remove("show");
        toggleDropdown(child);
      }
    })});

    window.addEventListener("mouseover", function (e) {
      const body = document.getElementsByTagName('body')[0];
      e.stopPropagation();
      if (e.target == body && document.querySelector('#nav .show')) {
        mainDropdown.classList.remove("show");
        document.querySelector('#nav .show').classList.remove("show");
      }
    });
  }
}
