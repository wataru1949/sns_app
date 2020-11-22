# require "rails_helper"

# describe Post do
#   describe "#create" do

#     example "投稿が登録できる" do
#       post = create(:post)
#       expect(post).to be_valid
#     end

#     example "タイトルがない場合は登録できない" do
#       post = build(:post, title: nil)
#       post.valid?
#       expect(post.errors[:title]).to include("を入力してください")
#     end

#     example "詳細がない場合は登録できない" do
#       post = build(:post, detail: nil)
#       post.valid?
#       expect(post.errors[:detail]).to include("を入力してください")
#     end

#     example "ユーザーIDがなければ登録できない" do
#       post = build(:post, user_id: nil)
#       post.valid?
#       expect(post.errors[:user]).to include("を入力してください")
#     end

#     example "カテゴリーがなければ登録できない" do
#       post = build(:post, category_id: nil)
#       post.valid?
#       expect(post.errors[:category]).to include("を入力してください")
#     end

#     example "都道府県がない場合は登録できない" do
#       post_address = build(:post_address, prefecture: nil)
#       post_address.valid?
#       expect(post_address.errors[:prefecture_id]).to include("を入力してください")
#     end

#     example "過去の日付では登録できない" do
#       post = build(:post, event_date: Date.yesterday)
#       today = Date.today.strftime("%Y/%m/%d")
#       post.valid?
#       expect(post.errors[:event_date]).to include("は#{today}以後に設定してください")
#     end

#     example "タイトルが41文字以上であれば登録できない" do
#       post = build(:post, title: "a" * 41)
#       post.valid?
#       expect(post.errors[:title]).to include("は40文字以内で入力してください")
#     end

#     example "タイトルが40文字以下では登録できる" do
#       post = build(:post, title: "a" * 40)
#       expect(post).to be_valid
#     end

#     example "詳細が1001文字以上であれば登録できない" do
#       post = build(:post, detail: "a" * 1001)
#       post.valid?
#       expect(post.errors[:detail]).to include("は1000文字以内で入力してください")
#     end

#     example "詳細が1000文字以下では登録できる" do
#       post = build(:post, detail: "a" * 1000)
#       expect(post).to be_valid
#     end
#   end
# end
