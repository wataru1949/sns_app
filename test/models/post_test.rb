# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  detail      :text(65535)      not null
#  end_time    :time
#  event_date  :date
#  post_image  :string(255)
#  start_time  :time
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  accept_id   :integer
#  category_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_event_date   (event_date)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
