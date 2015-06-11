$(document).ready(function () {
  $(".learn").hide();
  function flashLearn(){
    $(".learn").fadeIn(2000);
    $(".learn").fadeOut(2000);
  }
  setTimeout(flashLearn, 1000);

  $(".meet").hide();
  function flashMeet(){
    $(".meet").fadeIn(2000);
    $(".meet").fadeOut(2000);
  }
  setTimeout(flashMeet, 3000);

  $(".teach").hide();
  function flashTeach(){
    $(".teach").fadeIn(2000);
    $(".teach").fadeOut(2000);
  }
  setTimeout(flashTeach, 5000);

  $(".grow").hide();
  function flashGrow(){
    $(".grow").fadeIn(2000);
    $(".grow").fadeOut(2000);
  }
  setTimeout(flashGrow, 7000);
});
