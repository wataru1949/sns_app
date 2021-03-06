class Comment < ApplicationRecord
  
  belongs_to :post
  belongs_to :user
  
  mount_uploader :comment_image, ImageUploader
  validates :comment, presence: true, unless: :comment_image?
  validates :comment, length: { maximum: 1000 }
end

# == Schema Information
#
# Table name: comments
#
#  id            :bigint           not null, primary key
#  comment       :text(65535)
#  comment_image :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  post_id       :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
