$(function(){
  $("#post_post_image").change(function(e){
    $(".pip").remove();
    $("#post_remove").prop("checked", false);
    if ("#post_rm") {
      $("#post_rm").remove();
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
        "<br/><label id=\"post_rm\" class=\"rm-btn\" for=\"post_remove\">" + "<i class=\"fa fa-window-close\"></i></label>").insertAfter("#post_post_image");
      $("#post_rm").click(function(){
        $(".post_img").remove();
        $("#post_rm").hide()
        // $("#post_post_image").val("");
      });
    });
    reader.readAsDataURL(file);
  });
  $("#post_rm").click(function(){
    $(".post_img").remove();
    $("#post_rm").hide()
  });
});