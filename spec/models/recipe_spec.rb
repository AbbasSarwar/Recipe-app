require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user1 = User.new(name: 'abbas', role: 'admin')
  subject do
    Recipe.new(name: 'Tikka', preparation_time: 120, cooking_time: 60, description: 'recipe', public: true, user: user1)
  end
  describe 'validations' do
    let(:recipe) { FactoryBot.build(:recipe) }

    it 'requires a user' do
      recipe.user = nil
      expect(recipe).not_to be_valid
      expect(recipe.errors[:user]).to include("can't be blank")
    end

    it 'requires a name' do
      recipe.name = nil
      expect(recipe).not_to be_valid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it 'requires a description' do
      recipe.description = nil
      expect(recipe).not_to be_valid
      expect(recipe.errors[:description]).to include("can't be blank")
    end

    it 'requires a name to be unique for the same user' do
      recipe1 = FactoryBot.create(:recipe)
      recipe.name = recipe1.name
      recipe.user = recipe1.user
      expect(recipe).not_to be_valid
      expect(recipe.errors[:name]).to include('has already been taken')
    end

    it 'does not require the name to be unique for a different user' do
      recipe1 = FactoryBot.create(:recipe)
      recipe.name = recipe1.name
      expect(recipe).to be_valid
    end
  end
end
