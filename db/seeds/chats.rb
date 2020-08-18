groups = Group.find(1,2,3)

bodies = %w(
  途中から参加します 途中で抜けます！ 何時からですか？ 何時までですか？ 
  来週の予定はどうなってますか？ 次回は何日ですか？ 行きます！ 行けません。
  仕事の予定がわからないので保留でお願いします。 保留で！ 知り合いを連れて行きます！
  用事があるので不参加。 仕事のため不参加。 人数足りてますか？ 前回最高でした！
  また参加させてください！ ありがとうございました！ 次回もよろしくお願いします！
  )
  
groups.each do |g|
  g.users.each do |u|
    a = (1..9).to_a.sample
    t = a.days.ago
    g.chats.create!(
      body: bodies.sample,
      group_id: g.id,
      user_id: u.id,
      created_at: t.advance(hours: a, minutes: a)
      )
  end
end