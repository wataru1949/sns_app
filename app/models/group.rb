class Group < ApplicationRecord

  belongs_to :category

  #メンバーとしてのリレーション
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members, source: :user
  #管理者としてのリレーション
  has_one :group_admin, dependent: :destroy 
  has_one :admin, through: :group_admin, source: :user
  
  has_many :group_pictures, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one :group_address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :group_pictures, reject_if: proc { |attributes| attributes["group_image"].blank? },allow_destroy: true
  accepts_nested_attributes_for :group_address
  accepts_nested_attributes_for :category

  validates :content, :group_name, presence: true
  validates :group_name, uniqueness: true, length: { maximum: 20 }
  validates :content, length: { maximum: 500 }

  scope :group_listing, -> {
    left_joins(:group_members)
    .select("groups.*, COUNT(group_members.id).where(group_members.approved: true) AS number_of_memberships")
    .group("gorup.id")
    order(created_at: :desc)
    .includes(:group_address, :category, :group_pictures)
  }

  def user_in_member(user)
    if member = self.group_members.find_by(user_id: user.id)
      member.approved?
    end
  end
end

# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  content     :text(65535)      not null
#  group_name  :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_groups_on_category_id  (category_id)
#  index_groups_on_group_name   (group_name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
