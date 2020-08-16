User.create!(
  nickname: "ビト",
  email: "vito@example.com",
  password: "vitoco",
  profile: "テスト用アカウント",
  gender: 1,
  age: 2,
  user_image: open("#{Rails.root}/db/fixtures/user_images/bulldog-46360_640.png")
)

nicknames = %w{
  二郎:jiro
  三郎:saburo
  四郎:shiro
  マイケル:michael
  ジョニー:john
  ボブ:bob
  松子:matsuko
  梅子:umeko
  春美:harumi
  冬美:fuyumi
  キャサリン:catherine
  メグ:meg
  わんこ:wanko
  にゃんこ:nyanko
  ぴーこ:piko
}

15.times do |n|
  name = nicknames[n].split(":")

  User.create!(
  nickname: name[0],
  email: "#{name[1]}@example.com",
  password: "password",
  profile: "#{name[0]}です！よろしくお願いします！",
  gender: n < 6 ? 1 : 2,
  age: n % 2 == 0 ? 2 : 3,
  user_image: open("#{Rails.root}/db/fixtures/user_images/user_img#{n}.jpg")
  )
end
