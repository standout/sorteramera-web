$(function() {
  $('.change-request ul li').click(function() {
    $(this).toggleClass('selected-request');
  });

  // Send change request
  $('.change-request form').submit(function() {
    var values = $(this).serialize();
    parent = $(this).parent();

    // Send form data
    $.ajax({
      type: "POST",
      url:  $(this).attr('action'),
      data: values,
      dataType: "JSON",
      success: function() {               // If successful remove box from view
        parent.animate({
          opacity: 0,
          height: "toggle",
          paddingBottom: "toggle",
          marginBottom: 0
        }), 300, function() {
          $(this).remove()
        };
      },
      error: function() {                 // If unsuccessful alert user
        alert("Couldn't send request")
      }
    });

    return false
  });
});
