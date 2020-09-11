class PostAddress < Address
  validates :prefecture_id, presence: { message: "を入力してください" }
end

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string(255)
#  city             :string(255)
#  place            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  addressable_id   :bigint
#  prefecture_id    :integer
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#  index_addresses_on_city                                 (city)
#  index_addresses_on_prefecture_id_and_city               (prefecture_id,city)
#
