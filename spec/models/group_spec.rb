# == Schema Information
#
# Table name: groups
#
#  id            :bigint           not null, primary key
#  content       :text(65535)      not null
#  group_name    :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          not null
#
# Indexes
#
#  index_groups_on_group_name  (group_name) UNIQUE
#
require "rails_helper"

describe Group do
  describe "#create" do

    example "グループが登録できること" do
      group = build(:group)
      expect(group).to be_valid
    end  
    
    example "グループ名がない場合は登録できないこと" do
      group = build(:group, group_name: nil)
      group.valid?
      expect(group.errors[:group_name]).to include("を入力してください")
    end

    example "グループの詳細がない場合は登録できないこと" do
      group = build(:group, content: nil)
      group.valid?
      expect(group.errors[:content]).to include("を入力してください")
    end

    example "都道府県がない場合は登録できないこと" do
      group = build(:group, prefecture_id: nil)
      group.valid?
      expect(group.errors[:prefecture]).to include("を入力してください")
    end

    example "グループ名が21文字以上であれば登録できないこと" do
      group = build(:group, group_name: "a" * 21)
      group.valid?
      expect(group.errors[:group_name]).to include("は20文字以内で入力してください")
    end

    example "グループ名が20文字以下では登録できること" do
      group = build(:group, group_name: "a" * 20)
      expect(group).to be_valid
    end

    example "グループの詳細が501文字以上であれば登録できないこと" do
      group = build(:group, content: "a" * 501)
      group.valid?
      expect(group.errors[:content]).to include("は500文字以内で入力してください")
    end

    example "グループの詳細が500文字以下では登録できること" do
      group = build(:group, content: "a" * 500)
      expect(group).to be_valid
    end
  end
end
