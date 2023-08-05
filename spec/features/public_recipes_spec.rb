require 'rails_helper'

RSpec.describe 'Recipes index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  around do |testitem|
    food = FactoryBot.create(:food, name: 'Apple', price: 10.0)
    @recipe = FactoryBot.create(:recipe, name: 'Apple Pie', user: user)
    ingredient = FactoryBot.create(:ingredient, recipe: @recipe, food: food, quantity: 3)
    sign_in(user)
    visit recipes_path
    testitem.run
    user.recipes.destroy_all
    user.destroy # Clean up the user after the test
  end

  it "displays public recipes with their details" do
    within('.card') do
      expect(page).to have_content(@recipe.name)
      #expect(page).to have_content("By:- #{user.name}")
      #expect(page).to have_content("Food items# #{@recipe.ingredients.count}") # Since we created 1 ingredient for the recipe
      expect(page).to have_content("#{@recipe.ingredients.sum {|ingredient| ingredient.food.price}}") # 3 * $10 (quantity * food price)
    end
  end
end
