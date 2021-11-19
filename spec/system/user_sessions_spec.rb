require "rails_helper"

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe "ログイン前" do
    context "フォームの入力値が正常" do
      it "ログインが成功する" do
        visit login_path
        fill_in "email", with: user.email
        fill_in "password",	with: "password"
        click_button "ログイン"
        expect(current_path).to eq root_path
        expect(page).to have_content "ログインしました"
      end
    end

    context "フォームが未入力" do
      it "ログインが失敗する" do
        visit login_path
        fill_in "password",	with: user.password
        click_button "ログイン"
        expect(current_path).to eq login_path
        expect(page).to have_content "ログインに失敗しました"
      end
    end
  end

  describe "ログイン後" do
    context "ログアウトボタンをクリック" do
      it "ログアウトが成功する" do
        login(user)
        click_link "ログアウト"
        expect(page).to have_content "ログアウトしました"
        expect(current_path).to eq login_path
      end
    end
  end
end