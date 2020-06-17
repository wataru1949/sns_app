require 'rails_helper'

describe Post do
  describe '#create' do

  it "投稿が登録できること" do
    post = build(:post)
    expect(post).to be_valid
  end

  it "タイトルがない場合は登録できないこと" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "都道府県がない場合は登録できないこと" do
      post = build(:post, prefecture_id: nil)
      post.valid?
      expect(post.errors[:prefecture]).to include("を入力してください")
    end

    it "詳細がない場合は登録できないこと" do
      post = build(:post, detail: nil)
      post.valid?
      expect(post.errors[:detail]).to include("を入力してください")
    end

    it "タイトルが41文字以上であれば登録できないこと" do
      post = build(:post, title: "a" * 41)
      post.valid?
      expect(post.errors[:title]).to include("は40文字以内で入力してください")
    end

    it "タイトルが40文字以下では登録できること" do
      post = build(:post, title: "a" * 40)
      expect(post).to be_valid
    end

    it "詳細が1001文字以上であれば登録できないこと" do
      post = build(:post, detail: "a" * 1001)
      post.valid?
      expect(post.errors[:detail]).to include("は1000文字以内で入力してください")
    end

    it "詳細が1000文字以下では登録できること" do
      post = build(:post, detail: "a" * 1000)
      expect(post).to be_valid
    end
  end
end