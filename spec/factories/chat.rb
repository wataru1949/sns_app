FactoryBot.define do

  factory :chat do
    body          {Faker::Lorem.sentence}
    chat_image    {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    group
  end

end
