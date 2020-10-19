$(function() {
  function addUser(user) {
    let html = `
      <div class="searched-user">
        <p class="searched-user_name">${user.nickname}</p>
        <div class="user-add_btn" data-user-id="${user.id}" data-user-nickname="${user.nickname}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html);
  }
  function addNoUser() {
    let html = `
      <div class="searched-user">
        <p class="searched-user_name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addDeleteUser(name, id) {
    let html = `
    <div class="searched-user added_user" id="${id}">
      <p class="searched-user_name">${name}</p>
      <div class="user-remove_btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $("#added-user_container").append(html);
  }
  function addMember(userId) {
    let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
    $(`#${userId}`).append(html);
  }

  $(".user_search_form-input").on("keyup", function() {
    let input = $(".user_search_form-input").val();
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
          addUser(user);
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

  $(document).on("click", ".user-add_btn", function() {
    const userName = $(this).attr("data-user-nickname");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName, userId);
    addMember(userId);
  });
  $(document).on("click", ".user-remove_btn", function() {
    $(this)
      .parent()
      .remove();
  });
});
