require "rails_helper"

describe Group do
  describe "#create" do

    example "グループが登録できる" do
      group = build(:group)
      expect(group).to be_valid
    end  
    
    example "グループ名がない場合は登録できない" do
      group = build(:group, group_name: nil)
      group.valid?
      expect(group.errors[:group_name]).to include("を入力してください")
    end

    example "グループの詳細がない場合は登録できない" do
      group = build(:group, content: nil)
      group.valid?
      expect(group.errors[:content]).to include("を入力してください")
    end

    example "都道府県がない場合は登録できない" do
      group_address = build(:group_address, prefecture: nil)
      group_address.valid?
      expect(group_address.errors[:prefecture_id]).to include("を入力してください")
    end

    example "グループ名が21文字以上であれば登録できない" do
      group = build(:group, group_name: "a" * 21)
      group.valid?
      expect(group.errors[:group_name]).to include("は20文字以内で入力してください")
    end

    example "グループ名が20文字以下では登録できる" do
      group = build(:group, group_name: "a" * 20)
      expect(group).to be_valid
    end

    example "重複したグループ名が存在する場合は登録できない" do
      group = create(:group)
      another_group = build(:group, group_name: group.group_name)
      another_group.valid?
      expect(another_group.errors[:group_name]).to include("はすでに存在します")
    end

    example "グループの詳細が501文字以上であれば登録できない" do
      group = build(:group, content: "a" * 501)
      group.valid?
      expect(group.errors[:content]).to include("は500文字以内で入力してください")
    end

    example "グループの詳細が500文字以下では登録できる" do
      group = build(:group, content: "a" * 500)
      expect(group).to be_valid
    end
  end
end
