require 'rails_helper'

RSpec.describe 'Public recipes page', type: :feature do
  before do
    @user = User.create(name: 'abbas', email: 'abbas@gmail.com', password: 'abbas.123',
                        password_confirmation: 'abbas.123')
    @recipe = Recipe.create(name: 'qorma', preparation_time: 120, cooking_time: 60, description: 'Meat delicacy',
                            public: true, user: @user)
    sign_in @user
  end

  it 'Enable public should be able to Display in Public' do
    visit recipes_path
    expect(page).to have_link(@recipe.name)
    click_link @recipe.name
    visit public_recipes_path
    expect(page).to have_content(@recipe.name)
  end
end
