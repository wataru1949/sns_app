json.array! @users do |user|
  json.id user.id
  json.nickname user.nickname
  json.image user.user_image_url
end