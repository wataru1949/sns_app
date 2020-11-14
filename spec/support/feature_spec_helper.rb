module FeaturesSpecHelper

  def login_as_user(user)
    visit user_session_path
    within("#login-form") do
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
    end
  end
end