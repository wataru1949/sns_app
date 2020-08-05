$(function() {  
// 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <label class="img-btn" 
                    for="group_group_pictures_attributes_${index}_group_image">
                    <i class="fa fa-image icon"></i>
                    </label>
                    <input class="js-file hidden" type="file"
                    name="group[group_pictures_attributes][${index}][group_image]"
                    id="group_group_pictures_attributes_${index}_group_image">
                    <span class="js-remove">
                    <i class="fa fa-window-close"></i>
                    </span>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="file_column">
                    <img data-index="${index}" src="${url}" , class="group_img">
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $(".js-file_group:last").data("index");
  fileIndex.splice(0, lastIndex);

  $(".hidden-destroy").hide();
  $("#image-box").on("change", ".js-file", function(e) {
    const targetIndex = $(this).parent().data("index");
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute("src", blobUrl);
    } else {  // 新規画像追加の処理
      $("#previews").append(buildImg(targetIndex, blobUrl));
      const num = $(".js-file").length;
      // fileIndexの先頭の数字を使ってinputを作る
      if (num < 3) {
        $("#image-box").append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
        $(".js-file_group").height(240);
        $(".js-file_group:last").height(50);
      } else {
        $(".js-file_group").height(240);
      } 
      // lst = $("img.group_img").length;
      // console.log(lst);
    }
  });
  // let lst = $("img.group_img").length;
  // console.log(lst);
  // :not(:last)
  
  $("#image-box").on("click", ".js-remove", function() {
    if ($("img.group_img").length < 3 && $(this).parent().data("index") != $(".js-file_group:last").data("index")) {
      const targetIndex = $(this).parent().data("index");
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop("checked", true);
      $(this).parent().remove();
      $(`.file_column[data-index="${targetIndex}"]`).remove();
      $(`img[data-index="${targetIndex}"]`).remove();
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $("#image-box").append(buildFileField(fileIndex[0]));
    } else if ($("img.group_img").length == 3) {
      const targetIndex = $(this).parent().data("index");
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop("checked", true);
      $(this).parent().remove();
      $(`.file_column[data-index="${targetIndex}"]`).remove();
      $(`img[data-index="${targetIndex}"]`).remove();
      $("#image-box").append(buildFileField(fileIndex[0]));
        fileIndex.shift();
        // 末尾の数に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    $(".js-file_group").height(240);
    $(".js-file_group:last").height(50);
    // lst = $("img.group_img").length;
    // console.log(lst);
  });
});