FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" } # To generate unique names
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at { Time.now }
  end
end