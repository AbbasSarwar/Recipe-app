require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do

    let(:recipe) { Recipe.new }
     before do 
      recipe.valid? 
     end

    it "requires a user" do
        expect(recipe.errors[:user]).to include("can't be blank")
    end

    it "requires a name" do
        expect(recipe.errors[:name]).to include("can't be blank")
    end

    it "requires a description" do
        expect(recipe.errors[:description]).to include("can't be blank")
    end
    
    it "requires a name to be unique for the same user" do
        recipe1 = create(:recipe)
        recipe.name = recipe1.name
        recipe.user = recipe1.user
        recipe.valid?
        expect(recipe.errors[:name]).to include("has already been taken")
    end

    it "does not require the name to be unique for the different user" do
        recipe1 = create(:recipe)
        recipe.name = recipe1.name
        recipe.valid?
        expect(recipe.errors[:name]).to_not include("has already been taken")
    end

  end

end


  