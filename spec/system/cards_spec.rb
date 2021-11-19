require "rails_helper"

RSpec.describe "cards", type: :system do
  let(:user) { create(:user) }

  describe "cardの追加" do
    before { login(user) }
    let!(:list) { create(:list, user: user) }

    describe "カードの新規作成" do
      context "フォームの入力値が正常" do
        it "cardの新規登録が成功する" do
          visit root_path
          click_link("カードを追加")
          fill_in "card[title]", with: "title"
          fill_in "card[memo]", with: "memo"
          click_button("登録する")
          expect(current_path).to eq root_path
          expect(page).to have_content "title"
          expect(page).to have_css ".card_detail"
        end
      end

      context "メモを空欄で登録" do
        it "cardの新規登録が成功する" do
          visit root_path
          click_link("カードを追加")
          fill_in "card[title]", with: "title"
          fill_in "card[memo]", with: ""
          click_button("登録する")
          expect(current_path).to eq root_path
          expect(page).to have_content "title"
          expect(page).not_to have_css ".card_detail"
        end
      end

      context "タイトルが空白" do
        it "カードの新規登録が失敗する" do
          visit root_path
          click_link("カードを追加")
          fill_in "card[title]", with: " "
          fill_in "card[memo]", with: "memo"
          click_button("登録する")
          expect(page).to have_content "タイトルを入力してください"
          expect(current_path).to eq root_path        
        end
      end
    end
  end

  describe "cardの詳細、削除" do
    let!(:list) { create(:list, user: user) }
    let!(:card) { create(:card, list: list) }
    before do
      login(user)
      visit root_path
    end

    it "cardの詳細が表示されること" do
      click_link(card.title)
      expect(current_path).to eq root_path
      expect(page).to have_content card.title
      expect(page).to have_content card.memo
      expect(page).to have_content card.list.title
    end

    it "cardの削除ができること" do
      click_link(card.title)
      expect(page).to have_content card.title
      expect(page).to have_content card.memo
      expect(page).to have_content card.list.title
      find('a', text: "削除").click 
      expect(current_path).to eq root_path
      expect(page).not_to have_content card.title
    end
  end
end