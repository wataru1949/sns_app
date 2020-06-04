class Chat < ApplicationRecord
  
  belongs_to :group
  belongs_to :user
  
  mount_uploader :chat_image, ImageUploader
  validates :body, presence: true, unless: :chat_image?
end
# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  chat_image :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_chats_on_group_id  (group_id)
#  index_chats_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
