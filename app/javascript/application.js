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

// Get the dropdown button and content
const dropdownButton = document.querySelector('.dropdown-button');
const dropdown = document.querySelector('.dropdown');

// Toggle the dropdown menu
dropdownButton.addEventListener('click', () => {
    dropdown.classList.toggle('show');
});

// Close the dropdown menu if the user clicks outside of it
window.addEventListener('click', (event) => {
    if (!dropdown.contains(event.target)) {
        dropdown.classList.remove('show');
    }
});
