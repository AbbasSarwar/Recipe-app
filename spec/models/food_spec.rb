require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { FactoryBot.build(:food) }

  it 'is valid with valid attributes' do
    user = FactoryBot.create(:user) # Create a user if not already defined
    food = FactoryBot.build(:food, user: user)
    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food.name = nil
    expect(food).not_to be_valid
    expect(food.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a measurement_unit' do
    food.measurement_unit = nil
    expect(food).not_to be_valid
    expect(food.errors[:measurement_unit]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    food.price = nil
    expect(food).not_to be_valid
    expect(food.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without a quantity' do
    food.quantity = nil
    expect(food).not_to be_valid
    expect(food.errors[:quantity]).to include("can't be blank")
  end
  it 'is invalid with a negative price' do
    food.price = -10
    expect(food).not_to be_valid
    expect(food.errors[:price]).to include('must be greater than or equal to 0')
  end

  it 'is invalid with a negative quantity' do
    food.quantity = -5
    expect(food).not_to be_valid
    expect(food.errors[:quantity]).to include('must be greater than or equal to 0')
  end
end