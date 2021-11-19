FactoryBot.define do
  factory :list do
    title { "MyString" }
    association :user
  end
end
