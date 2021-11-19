require "rails_helper"

RSpec.describe "Users", type: :system do

  let(:user) { create(:user) }

  describe "ユーザー登録ページ" do
    context "フォームの入力値が正常" do
      it "ユーザー登録に成功" do
        visit new_user_path
        fill_in "user[name]", with: "user"
        fill_in "user[email]", with: "user_1@example.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_button("新規登録")
        expect(current_path).to eq(login_path)
        expect(page).to have_content("ユーザー登録が完了しました")
      end      
    end

    context "メールアドレスが未入力" do
      it "ユーザ登録に失敗する" do
        visit new_user_path
        fill_in "user[name]", with: "user"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_button("新規登録")
        expect(current_path).to eq(users_path)
        expect(page).to have_content("ユーザー登録に失敗しました")
        expect(page).to have_content("メールアドレスを入力してください")
      end
    end

    context "登録済みのメールアドレスを入力" do
      it "ユーザー登録に失敗する" do
        visit new_user_path
        fill_in "user[name]", with: "user"
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_button("新規登録")
        expect(current_path).to eq(users_path)
        expect(page).to have_content("ユーザー登録に失敗しました")
        expect(page).to have_content("メールアドレスはすでに存在します")
      end
    end

    context "パスワードが未入力" do
      it "ユーザー登録に失敗する" do
        visit new_user_path
        fill_in "user[name]", with: "user"
        fill_in "user[email]", with: "user_1@example.com"
        fill_in "user[password_confirmation]", with: "password"
        click_button("新規登録")
        expect(current_path).to eq(users_path)
        expect(page).to have_content("ユーザー登録に失敗しました")
        expect(page).to have_content("パスワードは3文字以上で入力してください")
        expect(page).to have_content("パスワード確認とパスワードの入力が一致しません")
      end
    end
  end
end