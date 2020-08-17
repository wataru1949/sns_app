users = User.offset(1)
categories = Category.find(1,4,8,9,13,15,20,23,25,26,29,30,31)

message1 = %w(一緒に みんなで 楽しく 気軽に まったり たまには 本気で)
message2 = %w(しませんか？ やりましょう！ 楽しもう！ どうですか に打ち込みたい ！！)

addresses = %w{
  1:旭川 6:山形 9:足利
  11:和光 12:袖ヶ浦 13:八王子
  14:茅ヶ崎 23:豊田 26:亀岡
  28:明石 34:府中 40:北九州
  43:阿蘇 47:那覇
}

place1 = %w(三角 丸井 隅田)
place2 = %w(公園 小学校 運動場)

group_names = %w(クラブ 倶楽部 愛好会 同好会 部 フレンズ)

3.times do |n|
  gn = group_names.sample
  c = categories[n]
  g = Group.create!(
    group_name: (c.value + gn),
    content: (message1.sample + c.value + message2.sample + "<br>" + "メンバー募集してます！"),
    category_id: "#{c.id}"
  )
  g.create_group_address!(
    prefecture_id: 13,
    city: "新宿区",
    place: (place1.sample + place2.sample)
  )
  g.group_users.create!(
    user_id: 1
  )
  2.times do |m|
    g.group_pictures.create!(
      group_image: open("#{Rails.root}/db/fixtures/group_images/group_img#{n + 1}_#{m + 1}.jpg"),
    )
  end
  users.sample(9).each do |u|
    g.group_users.create!(
      user_id: "#{u.id}"
    )
  end
end

15.times do |n|
  c = categories.sample
  ads = addresses.sample.split(":")
  gn = group_names.sample
  g = Group.create!(
    group_name: (ads[1] + c.value + gn),
    content: (message1.sample + c.value + message2.sample),
    category_id: "#{c.id}"
  )
  g.create_group_address!(
    prefecture_id: ads[0],
    city: ads[1],
    place: (place1.sample + place2.sample)
  )
end