FactoryBot.define do
  factory :recipe do
    sequence(:name) { |n| "Recipe #{n}" }
    preparation_time { 30 }
    cooking_time { 45 }
    description { 'A mouth-watering recipe' }
    public { false }
    association :user
  end
end
