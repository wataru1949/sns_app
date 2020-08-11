# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  value      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_value  (value) UNIQUE
#
FactoryBot.define do
  factory :category do
    
  end
end
