FactoryBot.define do

  factory :group_admin do
    status {"participated"}
    rejected {false}
  end

  factory :group_member do
    rejected {false}
  end
end
