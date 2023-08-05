require 'rails_helper'
RSpec.describe 'Recipes index page', type: :feature do
  let(:user) { create(:user) }
  let!(:recipes) { create_list(:recipe, 5, user: user) }

  before do
    login_as(user)
    visit recipes_path
  end

  it 'displays the recipe names and descriptions' do
    recipes.each do |recipe|
      expect(page).to have_link(recipe.name, href: recipe_path(recipe))
      expect(page).to have_text(recipe.description)
    end
  end

  it "links to the 'new recipe' page" do
    click_link 'Add New recipe'
    expect(page).to have_current_path(new_recipe_path)
  end

  # it "deletes a recipe when 'Remove' button is clicked" do
  #   first('.button-login').click
  #   expect(page).to have_content(" was deleted succesfully")
  # end
end
