$(function(){
  $("#user_user_image").change(function(e){
    $(".pip").remove();
    $("#user_remove").prop("checked", false);
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
        "<img class=\"user_img_d\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" + "</span>" +
        "<br/><label class=\"rm-btn\" for=\"user_remove\">" + "<i class=\"fa fa-window-close\"></i></label>").insertAfter("#user_user_image");
      $(".rm-btn").click(function(){
        $(".user_img_d").remove();
        $(".rm-btn").hide()
      });
    });
    reader.readAsDataURL(file);
  });
  $(".rm-btn").click(function(){
    $(".user_img_d").remove();
    $(".rm-btn").hide()
  });
});
