FactoryBot.define do

  factory :user_address do
    prefecture_id {Faker::Number.within(range: 1..48)}
    city          {"試験場"}
    place         {""}
  end

  factory :post_address do
    prefecture_id {Faker::Number.within(range: 1..48)}
    city          {"試験場"}
    place         {""}
  end

  factory :group_address do
    prefecture_id {Faker::Number.within(range: 1..48)}
    city          {"試験場"}
    place         {""}
  end
end
