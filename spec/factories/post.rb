FactoryBot.define do

  factory :post do
    title          {Faker::Lorem.sentence}
    detail         {Faker::Lorem.sentence}
    accept_id      {Faker::Number.within(range: 1..4)}
    event_date     {Date.today}
    start_time     {"21:00:00"}
    end_time       {"21:00:00"}
    post_image     {File.open("#{Rails.root}/public/images/test_image.jpg")}
    created_at     { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    category
    user
  end

end
