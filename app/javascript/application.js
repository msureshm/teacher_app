// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.getElementById("openModal").onclick = function() {
  document.getElementById("myModal").style.display = "block";
};

window.onclick = function(event) {
  if (event.target == document.getElementById("myModal")) {
      document.getElementById("myModal").style.display = "none";
  }
};

document.addEventListener('DOMContentLoaded', () => {
  // Function to toggle the dropdown menu
  function toggleDropdown(event) {
      const dropdown = event.currentTarget.parentElement;
      dropdown.classList.toggle('show');
  }

  // Function to close all dropdowns except the one that was clicked
  function closeAllDropdowns(event) {
      const dropdowns = document.querySelectorAll('.dropdown');
      dropdowns.forEach(dropdown => {
          if (!dropdown.contains(event.target)) {
              dropdown.classList.remove('show');
          }
      });
  }

  // Attach event listeners to each dropdown button
  const dropdownButtons = document.querySelectorAll('.dropdown-button');
  dropdownButtons.forEach(button => {
      button.addEventListener('click', toggleDropdown);
  });

  // Close dropdowns if clicking outside
  window.addEventListener('click', closeAllDropdowns);
});
