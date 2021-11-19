FactoryBot.define do
  factory :card do
    title { "MyString" }
    memo { "MyText" }
    association :list
  end
end
