FactoryBot.define do
  factory :card do
    title { "card_title" }
    memo { "card_memo" }
    association :list
  end
end
