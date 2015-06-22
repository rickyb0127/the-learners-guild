$(document).ready(function () {
  $("tr[data-link]").hover(function () {
    $(this).toggleClass("message-highlight")
  });

  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  });

  // $(".submit-btn").click(function(e) {
  //   e.preventDefault();
  //   $(".submit-field").submit();
  // });

  $(".submit-field").click(function() {
    $('.submit-btn').click();
  });
});
