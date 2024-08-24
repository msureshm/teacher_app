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
