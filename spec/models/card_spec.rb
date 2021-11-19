require 'rails_helper'

RSpec.describe Card, type: :model do
  context "フィールドが有効なとき" do
    it "有効であること" do
      card = build(:card)
      expect(card).to be_valid
    end
  end

  context "タイトルが存在しないとき" do
    it "無効であること" do
      card = build(:card, title: nil)
      expect(card).to be_invalid
      expect(card.errors[:title]).to include('を入力してください')
    end
  end

  context "タイトルが255文字以下のとき" do
    it "有効であること" do
      card = build(:card, title: "a" * 255)
      expect(card).to be_valid
    end
  end

  context "タイトルが256文字以上のとき" do
    it "無効であること" do
      card = build(:card, title: "a" * 256)
      expect(card).to be_invalid
      expect(card.errors[:title]).to include("は255文字以内で入力してください")
    end
  end

  context "メモが1000文字以下のとき" do
    it "有効であること" do
      card = build(:card, memo: "a" * 1000)
      expect(card).to be_valid
    end
  end

  context "タイトルが1001文字以上のとき" do
    it "無効であること" do
      card = build(:card, memo: "a" * 1001)
      expect(card).to be_invalid
      expect(card.errors[:memo]).to include("は1000文字以内で入力してください")
    end
  end
end
