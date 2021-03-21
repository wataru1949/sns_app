# require "rails_helper"

# RSpec.feature "ユーザーによるグループ管理", type: :system do
#   include FeaturesSpecHelper
#   let(:user) { create(:user) }
#   let!(:member) { create(:user, nickname: "member") }
#   let!(:group) { create(:group) }
#   let!(:group_member) { create(:group_member, group_id: group.id, user_id: member.id, status: status)}

#   feature "申請", type: :system do
#     let(:status) {"applying"}
    
#     scenario "ユーザーがグループに申請する", js: true do
#       login_as_user(user)
#       visit group_path(group)
#       page.accept_confirm do
#         click_link "参加申請"
#       end
#       expect(page).to have_selector ".notice", text: "参加申請しました。"
#       new_member = GroupMember.order(:id).last
#       expect(new_member.status).to eq("applying")
#     end

#     scenario "申請を取り消す", js: true do
#       login_as_user(member)
#       visit group_path(group)
#       page.accept_confirm do
#         click_link "申請を取り消す"
#       end
#       expect(page).to have_selector ".notice", text: "申請を取り消しました。"
#       expect(GroupMember.count).to eq(0)
#     end
#   end

#   feature "招待", type: :system do
#     let(:status) {"inviting"}
#     before do
#       login_as_user(member)
#     end

#     scenario "ユーザーが招待を受ける", js: true do
#       visit group_path(group)
#       page.accept_confirm do
#         click_link "グループに参加"
#       end
#       expect(page).to have_selector ".notice", text: "グループに参加しました。"
#       group_member.reload
#       expect(group_member.status).to eq("participated")
#     end

#     scenario "ユーザーが招待を拒否する", js: true do
#       visit group_path(group)
#       page.accept_confirm do
#         click_link "招待を拒否"
#       end
#       expect(page).to have_selector ".btn", text: "参加申請"
#       group_member.reload
#       expect(group_member.rejected).to eq(true)
#     end

#     scenario "招待を拒否したあと、申請を送る", js: true do
#       group_member.update(rejected: true)
#       visit group_path(group)
#       page.accept_confirm do
#         click_link "参加申請"
#       end
#       expect(page).to have_selector ".notice", text: "グループに参加しました。"
#       group_member.reload
#       expect(group_member.status).to eq("participated")
#       expect(group_member.rejected).to eq(false)
#     end
#   end

#   feature "退会", type: :system do
#   let(:status) {"participated"}
#     before do
#       login_as_user(member)
#     end

#     scenario "ユーザーが参加済みグループから退会する", js: true do
#       visit group_path(group)
#       page.accept_confirm do
#         click_link "グループから退会する"
#       end
#       expect(page).to have_selector ".notice", text: "グループから退会しました。"
#       expect(GroupMember.count).to eq(0)
#     end
#   end
# end