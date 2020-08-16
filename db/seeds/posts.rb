users = User.all
categories = Category.find(1,4,8,9,13,15,20,23,25,26,29,30,31)

message1 = %w(一緒に みんなで 楽しく 気軽に まったり たまには 本気で)
message2 = %w(しませんか？ やりましょう！ 楽しもう！ ！参加者募集 どうですか に打ち込みたい ！！)

addresses = %w{
  1:旭川市 6:山形市 9:足利市
  11:和光市 12:袖ヶ浦市 13:八王子市
  14:茅ヶ崎市 23:豊田市 26:亀岡市
  28:明石市 34:府中市 40:北九州市
  43:阿蘇市 47:那覇市
}

place1 = %w(三角 丸井 隅田)
place2 = %w(公園 小学校 運動場)

comments = %w(行きたい！ 楽しそう！ 興味あります！ 参加したいです 途中まででも平気ですか？ 未経験ですがやってみたいです 友達誘って行きます！ 車で行けますか？ 次回もあれば参加します)

30.times do |n|
  a = (1..4).to_a.sample
  u = users.sample
  c = categories.sample
  d = (40 - n)
  s_time = Time.parse("09:00:00")
  e_time = Time.parse("12:00:00")
  ads = addresses.sample.split(":")

  p = Post.create!(
    title: (message1.sample + c.value + message2.sample),
    detail: (message1.sample + c.value + message2.sample),
    accept_id: "#{a}",
    event_date: Date.today.advance(days: d),
    start_time: s_time.advance(hours: a),
    end_time: e_time.advance(hours: a),
    post_image: open("#{Rails.root}/db/fixtures/post_images/post_img#{c.id}.jpg"),
    user_id: "#{u.id}",
    category_id: "#{c.id}"
  )
  p.create_post_address!(
    prefecture_id: ads[0],
    city: ads[1],
    place: (place1.sample + place2.sample)
  )
  5.times do |m|
    u = users.sample
    p.comments.create!(
      comment: comments.sample,
      user_id: "#{u.id}"
    )
  end
end