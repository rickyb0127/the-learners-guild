$(document).ready(function () {
  $(".edit-picture").hide();

  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  });

  $(".edit-picture-link").click(function () {
    $(".edit-picture").show();
  });
});
