# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  chat_image :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_chats_on_group_id  (group_id)
#  index_chats_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

describe Chat do
  describe "#create" do
    context "chatを保存できる場合" do
      example "本文があれば保存できること" do
        expect(build(:chat, chat_image: nil)).to be_valid
      end

      example "画像があれば保存できること" do
        expect(build(:chat, body: nil)).to be_valid
      end

      example "本文と画像があれば保存できること" do
        expect(build(:chat)).to be_valid
      end
    end

    context "chatを保存できない場合" do
      example "本文と画像が両方空だと保存できないこと" do
        chat = build(:chat, body: nil, chat_image: nil)
        chat.valid?
        expect(chat.errors[:body]).to include("を入力してください")
      end

      example "group_idが無いと保存できないこと" do
        chat = build(:chat, group_id: nil)
        chat.valid?
        expect(chat.errors[:group]).to include("を入力してください")
      end

      example "user_idが無いと保存できないこと" do
        chat = build(:chat, user_id: nil)
        chat.valid?
        expect(chat.errors[:user]).to include("を入力してください")
      end
    end
  end
end
