FactoryBot.define do

  factory :comment do
    comment         {Faker::Lorem.sentence}
    comment_image   {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
    post
  end

end
