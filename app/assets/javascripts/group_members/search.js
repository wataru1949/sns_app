$(function() {
  function addUser(user, groupId) {
    if (user.image) {
      let html = `
        <div class="list_area_sell">
          <div class="list_area_sell_left">
            <img alt="ユーザー画像" class="user_img" src="${user.image}">
          </div>
          <div class="list_area_sell_right">
            <div class="list_area_sell_right_name">${user.nickname}</div>
            <div class="list_area_sell_right_btn">
              <a class="link-btn btn" data-confirm="${user.nickname}さんを招待しますか？" rel="nofollow" data-method="post" href="/groups/${groupId}/members/${user.id}">招待</a>
            </div>
          </div>
        </div>
      `;
      $("#user-search-result").append(html);
    } else {
      let html = `
        <div class="list_area_sell">
          <div class="list_area_sell_left">
            <img alt="ユーザー画像" class="user_img" src="/assets/picture/user-2517433_640.png">
          </div>
          <div class="list_area_sell_right">
            <div class="list_area_sell_right_name">${user.nickname}</div>
            <div class="list_area_sell_right_btn">
              <a class="link-btn btn" data-confirm="${user.nickname}さんを招待しますか？" rel="nofollow" data-method="post" href="/groups/${groupId}/members/${user.id}">招待</a>
            </div>
          </div>
        </div>
      `;
      $("#user-search-result").append(html);
    };
  };
  function addNoUser() {
    let html = `
      <div class="searched-user">
        <p class="searched-user_name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }
  $(".user_search_form-btn").on("click", function() {
    let input = $("#user_search_form-input").val();
    let groupId = $(this).attr("data-group-id");
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user) {
          addUser(user, groupId);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoUser();
      }
    })
    .fail(function() {
      alert("通信エラーです。ユーザーが表示できません。");
    });
  });
});
