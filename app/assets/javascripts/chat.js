$(function(){
  function buildHtml(chat){
    if (chat.user_image){
      var chatUser = `
        <div class="chat_user">
          <div class="chat_user_img">
            <img alt="ユーザー画像" class="user_img" src=${chat.user_image}>
          </div>
          <div class="chat_user_name">
              ${chat.user_name}
          </div>
        </div>
      `;
    } else {
      var chatUser = `
        <div class="chat_user">
          <div class="chat_user_name">
              ${chat.user_name}
          </div>
        </div>
      `;
    };
    var chatBottom = `
      <div class="chat_body_bottom">
        ${chat.created_at}
        <a rel="nofollow" data-method="delete" href="/groups/${chat.group_id}/chats/${chat.id}" data-confirm="本当に削除しますか？">削除</a>
      </div>
    `;
    if (chat.body && chat.image){
      var html = `
        <div class="chat my-chat">
          ${chatUser}
          <div class="chat_body">
            <p class="chat_body_bubble">
              ${chat.body}
            </p>
            <div class="chat_body_img">
              <img alt="コメント画像", class="chat_body_img", src=${chat.image}>
            </div>
            ${chatBottom}
          </div>
        </div>
        `
      return html;
    } else if (chat.body){
      var html = `
        <div class="chat my-chat">
        ${chatUser}
          <div class="chat_body">
            <p class="chat_body_bubble">
              ${chat.body}
            </p>
            ${chatBottom}
          </div>
        </div>
        `
      return html;
    } else if (chat.image){
      var html = `
        <div class="chat my-chat">
          ${chatUser}
          <div class="chat_body">
            <div class="chat_body_img">
              <img alt="コメント画像", class="chat_body_img", src=${chat.image}>
            </div>
            ${chatBottom}
          </div>
        </div>
        `
      return html;
    }
  }
  $('#new_chat').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'Post',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHtml(data);
      $('.chat-container').append(html);
      $('.main').animate({ scrollTop: $('.main')[0].scrollHeight});
      $('.chat-form')[0].reset();
      $('.submit-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('メッセージを入力してください');
      $('.submit-btn').prop('disabled', false);
    })
  });
});