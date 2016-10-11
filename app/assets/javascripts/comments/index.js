$(document).ready(function() {
  setTimeout(updateComments, 10000);
  function updateComments() {
    $.ajax({
      url: '/comments', 
      success: function(data) {
        $('#comments').html(data);
      },
      complete: function() {
        setTimeout(updateComments, 10000);
      }
    });
  };
});
