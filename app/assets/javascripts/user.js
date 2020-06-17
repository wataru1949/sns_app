$(function(){
  $('.field_image').change(function(e){
    var file = e.target.files[0];
    var reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      $(this.form).find(":file").val("");
      return false;
    }
    reader.onload = (function(file){
      return function(e){
        $(".user_image").attr("src", e.target.result);
        $(".user_image").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});