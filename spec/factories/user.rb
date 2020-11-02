FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname              {Faker::Name.first_name}
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
    profile               {Faker::Lorem.sentence}
    gender                {Faker::Number.within(range: 0..3)}
    age                   {Faker::Number.within(range: 0..6)}
    user_image            {File.open("#{Rails.root}/public/images/test_image.jpg")}
    association :user_address, strategy: :build
  end

end
