require 'rails_helper'
RSpec.describe 'Recipe show page', type: :feature do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }

  before do
    login_as(user)
    visit recipe_path(recipe)
  end
end
