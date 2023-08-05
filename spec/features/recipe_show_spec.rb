require 'rails_helper'
RSpec.describe 'Recipe show page', type: :feature do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let!(:ingredients) { create_list(:ingredient, 3, recipe:) }

  before do
    login_as(user)
    visit recipe_path(recipe)
  end

  it 'displays the recipe name, preparation time, and cooking time' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("#{recipe.preparation_time} hour")
    expect(page).to have_content("#{recipe.cooking_time} hour")
  end

  it "updates the 'public' status when the toggle button is clicked" do
    expect(page).to have_css('.btn-off')
    find('.btn').click
    expect(page).to have_css('.btn-on')
  end

  it 'displays the list of ingredients' do
    ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.food.name)
      expect(page).to have_content(ingredient.quantity)
      expect(page).to have_content(ingredient.food.price * ingredient.quantity)
    end
  end

  it "links to the 'edit recipe' page when the user owns the recipe" do
    click_link 'Edit Recipe'
    expect(page).to have_current_path(edit_recipe_path(recipe))
  end

  it "deletes an ingredient when 'Delete' button is clicked" do
    expect(page).to have_css('.button-login')
    first('.button-login').click
    expect(page).to have_content('Ingredient was successfully destroyed.')
  end

  it "links to the 'Add Ingredient' page when the user owns the recipe" do
    click_link 'Add Ingredient'
    expect(page).to have_current_path(new_recipe_ingredient_path(recipe))
  end

  it "links to the 'Shopping List' page when the user owns the recipe" do
    click_link 'Shopping List'
    expect(page).to have_current_path(shopping_lists_path(recipe_id: recipe.id))
  end
end
