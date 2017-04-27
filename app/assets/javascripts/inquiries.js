$(document).ready(function () {
  $('[data-toggle="popover"]').popover({
    trigger: 'hover',
  });

  if ($(".chatbox-messages").length > 0) {
    var height = $(".chatbox-messages")[0].scrollHeight;
    $(".chatbox-messages").scrollTop(height);
  }
});

// $(function () {
//   $('[data-toggle="tooltip"]').tooltip()
// })

