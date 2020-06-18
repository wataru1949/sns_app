require "rails_helper"

describe Chat do
  describe "#create" do
    context "chatを保存できる場合" do
      it "本文があれば保存できること" do
        expect(build(:chat, chat_image: nil)).to be_valid
      end

      it "画像があれば保存できること" do
        expect(build(:chat, body: nil)).to be_valid
      end

      it "本文と画像があれば保存できること" do
        expect(build(:chat)).to be_valid
      end
    end

    context "chatを保存できない場合" do
      it "本文と画像が両方空だと保存できないこと" do
        chat = build(:chat, body: nil, chat_image: nil)
        chat.valid?
        expect(chat.errors[:body]).to include("を入力してください")
      end

      it "group_idが無いと保存できないこと" do
        chat = build(:chat, group_id: nil)
        chat.valid?
        expect(chat.errors[:group]).to include("を入力してください")
      end

      it "user_idが無いと保存できないこと" do
        chat = build(:chat, user_id: nil)
        chat.valid?
        expect(chat.errors[:user]).to include("を入力してください")
      end
    end
  end
end