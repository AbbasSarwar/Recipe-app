FactoryBot.define do
    factory :ingredient do
      association :food
      association :recipe
      quantity { 1 } 
    end
  end
  