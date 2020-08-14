$(function() {
  function addCategory(category) {
    let html = `
      <div class="category-tag" data-value="${category.value}">
        <p>${category.value}</p>
      </div>
    `;
    $("#category-search-result").append(html);
    $(".category-tag").on("click", function() {
      let val = $(this).attr("data-value");
      $("#category-search").val(val);
    });
  }

  $("#category-search").on("keyup", function() {
    let input = $("#category-search").val();
    $.ajax({
      type: "GET",
      url: "/categories",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(categories) {
      $("#category-search-result").empty();
      if (categories.length !== 0) {
        categories.forEach(function(category) {
          addCategory(category);
        });
      } else {
        return false;
      }
    })
    .fail(function() {
      alert("通信エラーです。カレゴリーが表示できません。");
    });
  });
});