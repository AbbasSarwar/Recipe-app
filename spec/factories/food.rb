FactoryBot.define do
  factory :food do
    name { 'Pasta' }
    measurement_unit { 'grams' }
    price { 5 }
    quantity { 2 }
    user { nil }
  end
end
