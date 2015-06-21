$(document).ready(function () {
  $("tr[data-link]").hover(function () {
    $(this).toggleClass("message-highlight")
  });

  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  });
});
