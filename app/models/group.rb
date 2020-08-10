class Group < ApplicationRecord

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_pictures, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one :group_address, as: :addressable, dependent: :destroy
  # belongs_to :category
  accepts_nested_attributes_for :group_pictures, reject_if: proc { |attributes| attributes["group_image"].blank? },allow_destroy: true
  accepts_nested_attributes_for :group_address

  validates :content, :group_name, presence: true
  validates :group_name, uniqueness: true, length: { maximum: 20 }
  validates :content, length: { maximum: 500 }

  def self.search(search)
    return Group.all unless search
    Group.where('group_name LIKE(?)', "%#{search}%")
  end
end

# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  group_name :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_group_name  (group_name) UNIQUE
#
