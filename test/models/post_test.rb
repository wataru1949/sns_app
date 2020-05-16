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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
