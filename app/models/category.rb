class Category < ApplicationRecord
  include CategoryHolder

  has_many :posts
  has_many :groups

  def self.search(input)
    return nil if input == ""
    Category.where( ['value LIKE ?', "%#{input}%"] ).limit(10)
  end
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
