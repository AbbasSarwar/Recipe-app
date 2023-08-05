require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:food) { FactoryBot.create(:food, user:) } # Use let! to create the food instance before each scenario

  scenario 'Viewing foods index page' do
    sign_in user
    visit foods_path
    expect(page).to have_content(food.name)
    expect(page).to have_content(food.measurement_unit)
    expect(page).to have_content(food.price)
    expect(page).to have_content(food.quantity)
  end

  scenario 'Adding a new food item' do
    sign_in user
    visit new_food_path

    fill_in 'Name', with: 'New Food'
    fill_in 'Measurement Unit', with: 'grams'
    fill_in 'Price', with: 10
    fill_in 'Quantity', with: 3
    click_button 'submit'

    expect(page).to have_content('Food was added successfully')
    expect(page).to have_content('New Food')
    expect(page).to have_content('grams')
    expect(page).to have_content('10')
    expect(page).to have_content('3')
  end

  scenario 'Deleting a food item' do
    sign_in user
    visit foods_path

    expect(page).to have_content(food.name)
    click_button 'Delete'

    expect(page).to have_content("Deleted successfully #{food.name}")
    expect(page).not_to have_content(food.measurement_unit)
    expect(page).not_to have_content(food.price)
    expect(page).not_to have_content(food.quantity)
  end
end
