FactoryBot.define do

  factory :group do
    group_name     {Faker::Team.name}
    content        {Faker::Lorem.sentence}
    category_id    {1}
    association :category
  end
end
