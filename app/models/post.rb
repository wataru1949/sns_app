class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :accept
  has_many :comments
  has_many :pictures, as: :imageable

  validates :title, :date, :prefecture, :detail, presence: true
end

# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  date          :date             not null
#  detail        :text(65535)      not null
#  end_time      :time
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
