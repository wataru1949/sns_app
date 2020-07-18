class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :accept
  has_many :comments, dependent: :destroy

  mount_uploader :post_image, ImageUploader

  validates :title, :prefecture_id, :detail, presence: true
  validates :title, length: { maximum: 40 }
  validates :detail, length: { maximum: 1000 }
  validates :event_date, date: { after_or_equal_to: Proc.new { Date.today } }, allow_blank: true, on: [ :create, :update ] 
end

# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  detail        :text(65535)      not null
#  end_time      :time
#  event_date    :date
#  post_image    :string(255)
#  start_time    :time
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  accept_id     :integer
#  prefecture_id :integer          not null
#  user_id       :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
