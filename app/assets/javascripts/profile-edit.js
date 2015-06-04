$(document).ready(function () {
  $(".second-form").hide();
  $(".third-form").hide();
  $(".fourth-form").hide();
  $(".fifth-form").hide();
  $(".next-2").hide();
  $(".next-3").hide();
  $(".next-4").hide();
  $(".submit").hide();

  $(".next-1").click(function () {
    $(".first-form").slideUp();
    $(".second-form").show();
    $(this).hide();
    $(".next-2").show();
  });

  $(".next-2").click(function () {
    $(".second-form").slideUp();
    $(".third-form").show();
    $(this).hide();
    $(".next-3").show();
  });

  $(".next-3").click(function () {
    $(".third-form").slideUp();
    $(".fourth-form").show();
    $(this).hide();
    $(".next-4").show();
  });

  $(".next-4").click(function () {
    $(".fourth-form").slideUp();
    $(".fifth-form").show();
    $(this).hide();
    $(".submit").show();
  });

});
