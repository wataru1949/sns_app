class Category < ApplicationRecord
  has_many :groups
  has_many :posts

  validates :value, presence: true
end

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
