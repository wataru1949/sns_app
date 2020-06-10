json.user_name @chat.user.nickname
json.user_image @chat.user.user_image_url
json.body @chat.body
json.image @chat.chat_image_url
json.created_at @chat.created_at.strftime("%Y/%m/%d %H:%M")
json.group_id @chat.group.id
json.id @chat.id