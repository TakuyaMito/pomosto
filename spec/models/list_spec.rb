require 'rails_helper'

RSpec.describe List, type: :model do

  context "フィールドが有効なとき" do
    it "有効であること" do
      list = build(:list)
      expect(list).to be_valid
    end
  end

  context "タイトルが存在しないとき" do
    it "無効であること" do
      list = build(:list, title: nil)
      expect(list).to be_invalid
      expect(list.errors[:title]).to include('を入力してください')
    end
  end

  context "タイトルが255文字以下のとき" do
    it "有効であること" do
      list = build(:list, title: "a" * 255)
      expect(list).to be_valid
    end
  end

  context "タイトルが256文字以上のとき" do
    it "無効であること" do
      list = build(:list, title: "a" * 256)
      expect(list).to be_invalid
      expect(list.errors[:title]).to include("は255文字以内で入力してください")
    end
  end
end
