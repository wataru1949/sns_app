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
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
