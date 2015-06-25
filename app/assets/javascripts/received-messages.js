$(document).ready(function () {
  $("tr.submit-field").click(function() {
    window.location = $(this).data("link")
  });

  $(".submit-field").click(function() {
    $('.submit-btn').click();
  });
});
