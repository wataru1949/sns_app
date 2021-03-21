# require "rails_helper"

# RSpec.feature "管理者によるグループ管理", type: :system do
#   include FeaturesSpecHelper
#   let(:admin) { create(:user, nickname: "admin") }
#   let!(:member) { create(:user, nickname: "member") }
#   let!(:user) { create(:user) }
#   let!(:group) { create(:group) }
#   let!(:group_admin) { create(:group_admin, group_id: group.id, user_id: admin.id)}
#   let!(:group_member) { create(:group_member, group_id: group.id, user_id: member.id, status: status)}

#   before do
#     login_as_user(admin)
#     click_link group.group_name
#   end

#   feature "招待", type: :system do
#     let(:status) {"inviting"}
    
#     scenario "管理者がユーザーを招待する", js: true do
#       click_link "メンバー管理"
#       fill_in "user_search_form-input", with: user.nickname
#       click_button "検索"
#       within("#user-search-result") do
#         page.accept_confirm do
#           click_link "招待"
#         end
#       end
#       expect(page).to have_selector ".notice", text: "グループに招待しました。"
#       new_member = GroupMember.order(:id).last
#       expect(page).to have_selector "#invited_area", text: user.nickname
#       expect(new_member.status).to eq("inviting")
#     end

#     scenario "招待を取り消す", js: true do
#       click_link "メンバー管理"
#       within("#invited_area") do
#         page.accept_confirm do
#           click_link "招待を取り消す"
#         end
#       end
#       expect(page).to have_no_selector "#invited_area", text: member.nickname
#       expect(GroupMember.count).to eq(0)
#     end
#   end

#   feature "申請", type: :system do
#     let(:status) {"applying"}

#     scenario "管理者が申請を許可する", js: true do
#       click_link "メンバー管理"
#       within("#applying_area") do
#         page.accept_confirm do
#           click_link "参加を許可"
#         end
#       end
#       expect(page).to have_no_selector "#applying_area", text: member.nickname
#       expect(page).to have_selector ".notice", text: "申請を許可しました。"
#       group_member.reload
#       expect(group_member.status).to eq("participated")
#     end

#     scenario "管理者が申請を拒否する", js: true do
#       click_link "メンバー管理"
#       within("#applying_area") do
#         page.accept_confirm do
#           click_link "拒否"
#         end
#       end
#       expect(page).to have_no_selector "#applying_area", text: member.nickname
#       group_member.reload
#       expect(group_member.rejected).to eq(true)
#     end

#     scenario "申請を拒否した後、招待を送る", js: true do
#       group_member.update(rejected: true)
#       click_link "メンバー管理"
#       fill_in "user_search_form-input", with: member.nickname
#       click_button "検索"
#       within("#user-search-result") do
#         page.accept_confirm do
#           click_link "招待"
#         end
#       end
#       expect(page).to have_no_selector "#applying_area", text: member.nickname
#       expect(page).to have_selector ".notice", text: "申請を許可しました。"
#       group_member.reload
#       expect(group_member.status).to eq("participated")
#       expect(group_member.rejected).to eq(false)
#     end

#     scenario "申請が来ているユーザーを招待する", js: true do
#       click_link "メンバー管理"
#       fill_in "user_search_form-input", with: member.nickname
#       click_button "検索"
#       within("#user-search-result") do
#         page.accept_confirm do
#           click_link "招待"
#         end
#       end
#       expect(page).to have_selector ".notice", text: "すでに申請が来ています。"
#     end
#   end

#   feature "退会", type: :system do
#     let(:status) {"participated"}

#     scenario "管理者が参加済みユーザーを退会させる", js: true do
#       click_link "メンバー管理"
#       within("#participated_area") do
#         page.accept_confirm do
#           click_link "退会させる"
#         end
#       end
#       expect(page).to have_no_selector "#participated_area", text: member.nickname
#       expect(GroupMember.count).to eq(0)
#     end
#   end
# end
