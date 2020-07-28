class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum gender: { gender_private: 0, male: 1, female: 2, others: 3 }
  enum age: { age_private: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, over_sixties: 6 }
  belongs_to_active_hash :prefecture
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  mount_uploader :user_image, ImageUploader

  validates :nickname, :email, presence: true
  validates :nickname, length: { maximum: 10 }
  validates :profile, length: { maximum: 200 }
  validates :email,"valid_email_2/email": true,
    uniqueness: { case_sensitive: false }
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
#  prefecture_id          :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
