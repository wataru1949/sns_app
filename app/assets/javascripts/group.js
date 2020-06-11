$(function(){
  var openBtns = $(".member-btn");
  function modalSwitch(){
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = openBtns.index(this);
    $(".member_modal").removeClass("show").eq(index).addClass("show");
  }
  openBtns.click(modalSwitch);
  function modalClose(){
    $(".member_modal").removeClass("show");
  }
  $(".close-btn").click(modalClose);
});
