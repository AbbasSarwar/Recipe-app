require 'rails_helper'

RSpec.describe 'Public recipes page', type: :feature do
  before do
    @user = User.create(name: "abbas", email: "abbas@gmail.com", password: "abbas.123")
    @recipe = Recipe.create(name: "qorma", preparation_time: 120, cooking_time: 60, description: "recipe", public: true)
    login_as(@user)
    visit recipes_path
  end

  it "Enable public should be able to Display in Public" do
    click_link "qorma"
    visit public_recipes_path
    expect(page).to have_content(@recipe.name)
  end
end
