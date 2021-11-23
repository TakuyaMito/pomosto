require "rails_helper"

RSpec.describe "リスト機能", type: :system do
  let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }

  describe "ログイン前" do
    describe "ページの遷移確認" do
      context "リストの一覧ページにアクセス" do
        it "一覧ページのアクセス失敗" do
          visit top_path
          expect(current_path).to eq(root_path)
          expect(page).to have_content("ログインしてください")
        end
      end

      context "リストの新規作成ページにアクセス" do
        it "新規登録ページのアクセス失敗" do
          visit new_list_path
          expect(current_path).to eq(root_path)
          expect(page).to have_content("ログインしてください")
        end
      end

      context "リストの編集ページにアクセス" do
        it "編集ページアクセスの失敗" do
          visit edit_list_path(list)
          expect(current_path).to eq(root_path)
          expect(page).to have_content("ログインしてください")
        end
      end      
    end
  end

  describe "ログイン後" do
    before { login(user) }

    describe "リストの新規作成" do
      context "フォームの入力値が正常" do
        it "リストの新規登録が成功する" do
          visit top_path
          click_link("リスト作成")
          fill_in "list[title]", with: "list"
          click_button("登録する")
          expect(current_path).to eq top_path
          expect(page).to have_content "list"
          expect(page).to have_content "カードを追加"
        end
      end

      context "タイトルが空白" do
        it "リストの新規登録が失敗する" do
          visit top_path
          click_link("リスト作成")
          fill_in "list[title]", with: " "
          click_button("登録する")
          expect(page).to have_content "タイトルを入力してください"
          expect(current_path).to eq top_path        
        end
      end
    end

    describe "リストの編集" do
      let!(:list) { create(:list, user: user) }
      before do
        login(user)
        visit top_path
      end

      context "フォームの入力値が正常" do
        it "リストの編集が完了すること" do
          find(".fa-pen").click
          fill_in "list[title]", with: "list_test"
          click_button("更新する")
          expect(current_path).to eq top_path
          expect(page).to have_content "list_test"
          expect(page).to have_content "カードを追加"
        end
      end

      context "タイトルが未入力" do
        it "リストの編集が失敗すること" do
          find(".fa-pen").click
          fill_in "list[title]", with: " "
          click_button("更新する")
          expect(current_path).to eq top_path
          expect(page).to have_content "タイトルを入力してください"    
        end
      end
    end

    describe "リストの削除" do
      let!(:list) { create(:list, user: user) }
      before do
        login(user)
        visit top_path
      end

      it "リストの削除ができること" do
        find(".fa-trash").click
        expect(page.accept_confirm).to eq "削除しますか？"
        expect(current_path).to eq top_path
        expect(page).not_to have_content list.title
      end
    end
  end
end