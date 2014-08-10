$(document).ready(function(){
  $( ".stepOne" ).mouseover(function() {
    $(".sectionOne").show().stop().animate({width: "+=100%", opacity: "100"}, 800);
    $(".sectionTwo").hide();
    $(".sectionThree").hide();
    $(".sectionFour").hide();
  });
  $( ".stepOne" ).mouseleave(function() {
    $(".sectionOne").show().stop().animate({width: "0", opacity: "0"}, 800);
    $(".sectionTwo").hide();
    $(".sectionThree").hide();
    $(".sectionFour").hide();
  });
  $( ".stepTwo" ).mouseover(function() {
    $(".sectionTwo").show().stop().animate({width: "+=100%", opacity: "100"}, 800);
    $(".sectionOne").hide();
    $(".sectionThree").hide();
    $(".sectionFour").hide();
  });
  $( ".stepTwo" ).mouseleave(function() {
    $(".sectionTwo").show().stop().animate({width: "0", opacity: "0"}, 800);
    $(".sectionOne").hide();
    $(".sectionThree").hide();
    $(".sectionFour").hide();
  });

  $( ".stepThree" ).mouseover(function() {
    $(".sectionThree").show().stop().animate({width: "+=100%", opacity: "100"}, 800);
    $(".sectionTwo").hide();
    $(".sectionOne").hide();
    $(".sectionFour").hide();
  });
  $( ".stepThree" ).mouseleave(function() {
    $(".sectionThree").show().stop().animate({width: "0", opacity: "0"}, 800);
    $(".sectionTwo").hide();
    $(".sectionOne").hide();
    $(".sectionFour").hide();
  });

  $( ".stepFour" ).mouseover(function() {
    $(".sectionFour").show().stop().animate({width: "+=100%", opacity: "100"}, 800);
    $(".sectionTwo").hide();
    $(".sectionThree").hide();
    $(".sectionOne").hide();
  });
  $( ".stepFour" ).mouseleave(function() {
    $(".sectionFour").show().stop().animate({width: "0", opacity: "0"}, 800);
    $(".sectionTwo").hide();
    $(".sectionThree").hide();
    $(".sectionOne").hide();
  });

});
