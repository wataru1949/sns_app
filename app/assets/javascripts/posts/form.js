$(function(){
  $("#post_post_image").change(function(e){
    $(".pip").remove();
    $("#post_remove").prop("checked", false);
    if (".rm-btn") {
      $(".rm-btn").remove();
    }
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      $(this.form).find(":file").val("");
      return false;
    }
    reader.onload = (function(e) {
      var file = e.target;
      $("<span class=\"pip\">" +
        "<img class=\"post_img\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" + "</span>" +
        "<br/><label class=\"rm-btn\" for=\"post_remove\">" + "<i class=\"fa fa-window-close\"></i></label>").insertAfter("#post_post_image");
      $(".rm-btn").click(function(){
        $(".post_img").remove();
        $(".rm-btn").hide()
        // $("#post_post_image").val("");
      });
    });
    reader.readAsDataURL(file);
  });
  $(".rm-btn").click(function(){
    $(".post_img").remove();
    $(".rm-btn").hide()
  });
});