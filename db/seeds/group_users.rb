groups = Group.offset(3)
users = User.offset(1)
a = (1..6).to_a

groups.each_with_index do |g, i|
  users.sample(a.sample).each do |u|
    g.group_users.create!(
      user_id: "#{u.id}"
    )
  end
end