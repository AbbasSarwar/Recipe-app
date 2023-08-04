require 'rails_helper'
RSpec.feature 'Foods', type: :feature do
    scenario 'Viewing foods index page' do
      user = FactoryBot.create(:user)
      food = FactoryBot.create(:food, user: user)
  
      sign_in user # Sign in the user using Devise test helper
  
      visit foods_path
  
      expect(page).to have_content(food.name)
      expect(page).to have_content(food.measurement_unit)
      expect(page).to have_content(food.price)
      expect(page).to have_content(food.quantity)
    end
  
    scenario 'Deleting a food item' do
      user = FactoryBot.create(:user)
      food = FactoryBot.create(:food, user: user)
  
      sign_in user # Sign in the user using Devise test helper
  
      visit foods_path
  
      expect(page).to have_content(food.name)
  
      click_button 'Delete'
  
      expect(page).to have_content("Deleted successfully #{food.name}")
      expect(page).not_to have_content(food.measurement_unit)
      expect(page).not_to have_content(food.price)
      expect(page).not_to have_content(food.quantity)
    end
  end
  