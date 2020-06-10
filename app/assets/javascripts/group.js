$(function(){
  var openBtns = $(".member-btn");
  function modalSwitch(){
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = openBtns.index(this);
    $(".member_modal").removeClass("show").eq(index).addClass("show");
    $(".close-btn").click(function(){
      $(".member_modal").removeClass("show")();
    });
  }
  openBtns.click(modalSwitch);
});




  $(".member-btn").click(function(){
    $(".member_modal").fadeIn();
  });
  
