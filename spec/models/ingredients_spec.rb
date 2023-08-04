require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject do
    @user1 = User.create(name: "abbas", role: "admin")
    @food1 = Food.create(name: "qorma", measurement_unit: "kg", price: 1000, quantity: 2, user_id: @user1.id)
    @recipe1 = Recipe.create(name: "Tikka", preparation_time: 120, cooking_time: 60, description: "recipe", public: true, user_id: @user1.id)
    Ingredient.new(quantity: 20, food_id: @food1.id, recipe_id: @recipe1.id)
  end

  before { subject.save }

  describe 'validation' do
    it 'Quantity should be valid integer' do
      subject.quantity = 7
      expect(subject).to be_valid
    end
  end
end
