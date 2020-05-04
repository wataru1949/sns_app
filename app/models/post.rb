class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title, :event, :date, :prefecture, :detail, presence: true
  belongs_to_active_hash :prefecture
end
