require "rails_helper"

describe Category do
  describe "値の正規化" do
    example "value前後の空白を除去" do
      category = create(:category, value: " 野球 ")
      expect(category.value).to eq("野球")  
    end

    example "valueに含まれる全角英数字記号を半角に変換" do
      category = create(:category, value: "ｂａｓｅｂａｌｌ")
      expect(category.value).to eq("baseball")
    end

    example "value前後の全角スペースを除去" do
      category = create(:category, value: "\u{3000}サッカー\u{3000}")
      expect(category.value).to eq("サッカー")  
    end
  end

  describe "バリデーション" do
    example "記号を含むvalueは無効" do
      category = build(:category, value: "試験★")
      expect(category).not_to be_valid  
    end
  end
end