# == Schema Information
#
# Table name: group_pictures
#
#  id          :bigint           not null, primary key
#  group_image :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_id    :bigint
#
# Indexes
#
#  index_group_pictures_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
require 'test_helper'

class GroupPictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
