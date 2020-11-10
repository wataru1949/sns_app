FactoryBot.define do

  factory :group do
    group_name     {Faker::Team.name}
    content        {Faker::Lorem.sentence}
    association :category
    association :group_address, strategy: :build
    association :group_admin, strategy: :build
  end
end
