$(function(){
  $(".member_modal").hide();
  var openBtns = $(".member-btn");
  function modalSwitch(){
    const index = openBtns.index(this);
    $(".member_modal").hide().eq(index).show();
  }
  openBtns.click(modalSwitch);
  $(".close-btn").on("click", function() {
    $(".member_modal").hide();
  });
});
