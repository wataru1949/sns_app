class User < ApplicationRecord
  attr_accessor :remove

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum gender: { gender_private: 0, male: 1, female: 2, others: 3 }
  enum age: { age_private: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, over_sixties: 6 }
  #グループメンバーとしてのリレーション
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  #管理者としてのリレーション
  has_many :group_admins, dependent: :restrict_with_exception
  has_many :my_groups, through: :group_admins, source: :group

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one :user_address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :user_address
  
  mount_uploader :user_image, ImageUploader

  validates :nickname, :email, presence: true
  validates :nickname, uniqueness: true, length: { maximum: 10 }
  validates :profile, length: { maximum: 200 }
  validates :email,"valid_email_2/email": true,
    uniqueness: { case_sensitive: false }

  def self.search(input, id)
    return nil if input == ""
    User.where(['nickname LIKE ?', "%#{input}%"] ).where.not(id: id).limit(10)
  end

  def joined_group(user)
    if memberships = user.group_members.where(approved: true)
      return memberships
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  age                    :integer          default("age_private")
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  gender                 :integer          default("gender_private")
#  nickname               :string(255)      not null
#  profile                :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  user_image             :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_nickname              (nickname) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
