require 'rails_helper'
RSpec.describe 'Recipe show page', type: :feature do
  let(:user) { create(:user) }
  let(:food) do
    Food.create(
      name: 'potato',
      measurement_unit: 'kg',
      price: 10,
      user:
    )
  end
  let(:recipe) do
    Recipe.create(
      name: 'qorma',
      preparation_time: 120,
      cooking_time: 60,
      description: 'Meat delicacy',
      public: true,
      user:
    )
  end
  let(:other_user) { create(:user) }

  let!(:ingredients) do
    Ingredient.create(
      quantity: 1,
      food_id: food.id,
      recipe:
    )
  end

  before do
    sign_in user
    visit recipe_path(recipe)
  end

  it 'displays the recipe name, preparation time, and cooking time' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("#{recipe.preparation_time} hour")
    expect(page).to have_content("#{recipe.cooking_time} hour")
  end

  it "updates the 'public' status when the toggle button is clicked" do
    expect(page).to have_css('.button_public_class')
    if recipe.public?
      expect(page).to have_css('.fa-toggle-on')
    else
      expect(page).to have_css('.fa-toggle-off')
    end

    find('.btn').click

    if recipe.public?
      expect(page).to have_css('.fa-toggle-off')
    else
      expect(page).to have_css('.fa-toggle-on')
    end
  end

  it "does not show the 'Delete' button when the user is not the owner of the recipe" do
    logout
    sign_in other_user

    visit recipe_path(recipe)

    expect(page).to have_css('.table-style')
    expect(page).to_not have_selector('.button-login')
  end

  it "links to the 'Add Ingredient' page when the user owns the recipe" do
    click_link 'Add Ingredient'
    expect(page).to have_current_path(new_recipe_ingredient_path(recipe))
  end

  it "links to the 'Shopping List' page when the user owns the recipe" do
    click_link 'Shopping List'
    expect(page).to have_current_path(shopping_lists_path(recipe_id: recipe.id))
  end

  it 'updates the recipe description when form is submitted' do
    new_description = 'New description for the recipe'
    recipe.update(description: new_description)
    visit recipe_path(recipe)

    expect(page).to have_content(new_description)
  end
end
