FactoryBot.define do

  factory :group do
    group_name     {Faker::Team.name}
    content        {Faker::Lorem.sentence}
    prefecture_id  {Faker::Number.within(range: 1..48)}
  end

end
