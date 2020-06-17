require "rails_helper"

describe User do
  describe "#create" do
    
    it "ユーザーが登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "プロフィールがない場合は登録できないこと" do
      user = build(:user, profile: nil)
      user.valid?
      expect(user.errors[:profile]).to include("を入力してください")
    end

    it "メールアドレスがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードが存在しても確認用パスワードがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " ニックネームが11文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は10文字以内で入力してください")
    end

    it "ニックネームが10文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaaaaaa")
      expect(user).to be_valid
    end

    it "重複したメールアドレスが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it "パスワードが5文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

  end
end