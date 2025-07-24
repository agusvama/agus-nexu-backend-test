FactoryBot.define do
  factory :brand do
    sequence(:name) { |n| "Brand#{n}" }
    average_price { 702109 }
  end
end
