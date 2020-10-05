class GroupAdmin < GroupUser
end

# == Schema Information
#
# Table name: group_users
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE), not null
#  type       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_group_users_on_group_id  (group_id)
#  index_group_users_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
