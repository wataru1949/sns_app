FactoryBot.define do

  factory :post do
    title          {"メンバーを"}
    detail         {"募集します！"}
    prefecture_id  {1}
    accept_id      {1}
    date           {"2020-06-12"}
    start_time     {"21:00:00"}
    end_time       {"21:00:00"}
    post_image     {"picture/hut-1681485_1280.jpg"}
    user
  end

end
