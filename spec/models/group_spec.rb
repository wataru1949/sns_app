require 'rails_helper'

describe Group do
  describe '#create' do

  it "グループが登録できること" do
    group = build(:group)
    expect(group).to be_valid
  end  
  
  it "グループ名がない場合は登録できないこと" do
      group = build(:group, group_name: nil)
      group.valid?
      expect(group.errors[:group_name]).to include("を入力してください")
    end

    it "グループの詳細がない場合は登録できないこと" do
      group = build(:group, content: nil)
      group.valid?
      expect(group.errors[:content]).to include("を入力してください")
    end

    it "都道府県がない場合は登録できないこと" do
      group = build(:group, prefecture_id: nil)
      group.valid?
      expect(group.errors[:prefecture]).to include("を入力してください")
    end

    it "グループ名が21文字以上であれば登録できないこと" do
      group = build(:group, group_name: "a" * 21)
      group.valid?
      expect(group.errors[:group_name]).to include("は20文字以内で入力してください")
    end

    it "グループ名が20文字以下では登録できること" do
      group = build(:group, group_name: "a" * 20)
      expect(group).to be_valid
    end

    it "グループの詳細が501文字以上であれば登録できないこと" do
      group = build(:group, content: "a" * 501)
      group.valid?
      expect(group.errors[:content]).to include("は500文字以内で入力してください")
    end

    it "グループの詳細が500文字以下では登録できること" do
      group = build(:group, content: "a" * 500)
      expect(group).to be_valid
    end

  end
end