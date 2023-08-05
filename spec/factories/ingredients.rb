FactoryBot.define do
    factory :ingredient do
      association :food
      association :recipe
      quantity { 1 } 
      after(:build) do |ingredient|
        puts "Ingredient: #{ingredient.inspect}"
      end
    end
  end
  