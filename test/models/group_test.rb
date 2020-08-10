# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  group_name :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_group_name  (group_name) UNIQUE
#
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
