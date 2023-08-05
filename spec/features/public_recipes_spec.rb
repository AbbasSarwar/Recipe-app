require 'rails_helper'
RSpec.describe 'Recipes index page', type: :feature do
  let(:user) { create(:user) }
  let!(:recipe) { create(:recipe, user:) }

  before do
    login_as(user)
    visit recipes_path
  end

  it "Enable public should be able to Display in Public" do
    click_link recipe.name
    first('.btn').click
    visit public_recipes_path
    expect(page).to have_content(recipe.name)
  end
end