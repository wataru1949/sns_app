require "rails_helper"

describe Chat do
  describe "#create" do
    context "chatを保存できる場合" do
      example "本文があれば保存できる" do
        expect(build(:chat, chat_image: nil)).to be_valid
      end

      example "画像があれば保存できる" do
        expect(build(:chat, body: nil)).to be_valid
      end

      example "本文と画像があれば保存できる" do
        expect(build(:chat)).to be_valid
      end
    end

    context "chatを保存できない場合" do
      example "本文と画像が両方空だと保存できない" do
        chat = build(:chat, body: nil, chat_image: nil)
        chat.valid?
        expect(chat.errors[:body]).to include("を入力してください")
      end

      example "group_idが無いと保存できない" do
        chat = build(:chat, group_id: nil)
        chat.valid?
        expect(chat.errors[:group]).to include("を入力してください")
      end

      example "user_idが無いと保存できない" do
        chat = build(:chat, user_id: nil)
        chat.valid?
        expect(chat.errors[:user]).to include("を入力してください")
      end

      example "本文が1001文字以上であれば登録できない" do
        chat = build(:chat, body: "a" * 1001)
        chat.valid?
        expect(chat.errors[:body]).to include("は1000文字以内で入力してください")
      end

      example "本文が1000文字以下では登録できる" do
        chat = build(:chat, body: "a" * 1000)
        expect(chat).to be_valid
      end
    end
  end
end
