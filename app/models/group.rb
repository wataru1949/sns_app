class Group < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  has_many :group_users
  has_many :users, through: :group_users
  has_many :group_pictures
  has_many :chats
  # belongs_to :category
  accepts_nested_attributes_for :group_pictures, allow_destroy: true

  validates :group_name, presence: true, uniqueness: true
  validates :content, presence: true
end

# == Schema Information
#
# Table name: groups
#
#  id            :bigint           not null, primary key
#  content       :text(65535)      not null
#  group_name    :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          not null
#
# Indexes
#
#  index_groups_on_group_name  (group_name) UNIQUE
#
