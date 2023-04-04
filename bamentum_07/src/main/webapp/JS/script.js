// Load more content when the user scrolls to the bottom of the page
window.addEventListener('scroll', function() {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
      loadMore();
    }
  });
  
  // Load more content using AJAX
function loadMore() {
    // Generate new content
    var newContent = '<p>Additional content</p><img src="./img/image/banner2.png">';
  
    // Append the new content to the #content div
    document.getElementById("content").innerHTML += newContent;
  }
